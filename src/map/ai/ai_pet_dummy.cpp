﻿/*
===========================================================================

Copyright (c) 2010-2015 Darkstar Dev Teams

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see http://www.gnu.org/licenses/

This file is part of DarkStar-server source code.

===========================================================================
*/

#include "../../common/utils.h"

#include "../utils/battleutils.h"
#include "../utils/attackutils.h"
#include "../utils/charutils.h"
#include "../entities/charentity.h"
#include "../entities/petentity.h"
#include "../zone.h"
#include "../attack.h"
#include "../attackround.h"
#include "../mobskill.h"
#include "../utils/petutils.h"

#include "../lua/luautils.h"

#include "../packets/entity_update.h"
#include "../packets/action.h"
#include "../packets/char_update.h"
#include "../packets/pet_sync.h"
#include "../packets/message_basic.h"
#include "../entities/mobentity.h"

#include "states/magic_state.h"

#include "../alliance.h"
#include "../vana_time.h"
#include "ai_pet_dummy.h"
#include <stdio.h>
#include <string>     // std::string, std::stoi

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

CAIPetDummy::CAIPetDummy(CPetEntity* PPet)
{
    m_PPet = PPet;
    m_queueSic = false;
    m_PTargetFind = new CTargetFind(PPet);
    m_PPathFind = new CPathFind(PPet);

    m_PMagicState = new CMagicState(PPet, m_PTargetFind);
    m_Cooldown = 5000;
}

/************************************************************************
*																		*
*  Основная часть интеллекта - главный цикл								*
*																		*
************************************************************************/

void CAIPetDummy::CheckCurrentAction(uint32 tick)
{
    m_Tick = tick;

    CBattleEntity* PSelf = m_PPet;

    //uncharm any pets if time is up
    if (tick > m_PPet->charmTime && m_PPet->isCharmed)
    {
        petutils::DespawnPet(m_PPet->PMaster);
        return;
    }

    switch (m_ActionType)
    {
    case ACTION_NONE:							break;
    case ACTION_ROAMING:	ActionRoaming();	break;
    case ACTION_DEATH:		ActionDeath();		break;
    case ACTION_SPAWN:		ActionSpawn();		break;
    case ACTION_FALL:		ActionFall();		break;
    case ACTION_ENGAGE:		ActionEngage();		break;
    case ACTION_ATTACK:		ActionAttack();		break;
    case ACTION_SLEEP:		ActionSleep();		break;
    case ACTION_DISENGAGE:	ActionDisengage();	break;
    case ACTION_MOBABILITY_START:	ActionAbilityStart();	break;
    case ACTION_MOBABILITY_USING: ActionAbilityUsing(); break;
    case ACTION_MOBABILITY_FINISH: ActionAbilityFinish(); break;
    case ACTION_MOBABILITY_INTERRUPT: ActionAbilityInterrupt(); break;
    case ACTION_MAGIC_START: ActionMagicStart(); break;
    case ACTION_MAGIC_CASTING: ActionMagicCasting(); break;
    case ACTION_MAGIC_FINISH: ActionMagicFinish(); break;

    default: DSP_DEBUG_BREAK_IF(true);
    }

    //check if this AI was replaced (the new AI will update if this is the case)
    if (m_PPet && PSelf->PBattleAI == this)
    {
        m_PPet->UpdateEntity();
    }
}

void CAIPetDummy::WeatherChange(WEATHER weather, uint8 element)
{

}

void CAIPetDummy::ActionAbilityStart()
{
    if (m_PPet->StatusEffectContainer->HasPreventActionEffect())
    {
        return;
    }

    if (m_PPet->objtype == TYPE_MOB && m_PPet->PMaster->objtype == TYPE_PC)
    {
        if (m_MasterCommand == MASTERCOMMAND_SIC && m_PPet->health.tp >= 1000 && m_PBattleTarget != nullptr)
        {
            m_MasterCommand = MASTERCOMMAND_NONE;
            CMobEntity* PMob = (CMobEntity*)m_PPet->PMaster->PPet;
            std::vector<CMobSkill*> MobSkills = battleutils::GetMobSkillsByFamily(PMob->m_Family);

            if (MobSkills.size() > 0)
            {
                int maxSearch = 10;
                // keep looking for an ability until one is valid
                do {
                    SetCurrentMobSkill(MobSkills.at(WELL512::GetRandomNumber(MobSkills.size())));
                } while (luautils::OnMobSkillCheck(m_PBattleTarget, m_PPet, GetCurrentMobSkill()) != 0 && maxSearch--);

                // could not find skill
                if (maxSearch == 0)
                {
                    TransitionBack(true);
                    return;
                }

                preparePetAbility(m_PBattleTarget);
                return;
            }
            return;
        }
    }


    if (m_PPet->getPetType() == PETTYPE_JUG_PET){
        if (m_MasterCommand == MASTERCOMMAND_SIC && m_PPet->health.tp >= 1000 && m_PBattleTarget != nullptr){ //choose random tp move
            m_MasterCommand = MASTERCOMMAND_NONE;
            if (m_PPet->PetSkills.size() > 0){
                SetCurrentMobSkill(m_PPet->PetSkills.at(WELL512::GetRandomNumber(m_PPet->PetSkills.size())));
                preparePetAbility(m_PBattleTarget);
                return;
            }
        }
    }
    else if (m_PPet->getPetType() == PETTYPE_AVATAR){
        for (int i = 0; i < m_PPet->PetSkills.size(); i++){
            if (m_PPet->PetSkills[i]->getAnimationTime() == m_MasterCommand){
                SetCurrentMobSkill(m_PPet->PetSkills[i]);
                m_MasterCommand = MASTERCOMMAND_NONE;
                preparePetAbility(m_PPet);
                return;
            }
        }
        m_MasterCommand = MASTERCOMMAND_NONE;
    }
    else if (m_PPet->getPetType() == PETTYPE_WYVERN){

        WYVERNTYPE wyverntype = m_PPet->getWyvernType();

        if (m_MasterCommand == MASTERCOMMAND_ELEMENTAL_BREATH && (wyverntype == WYVERNTYPE_MULTIPURPOSE || wyverntype == WYVERNTYPE_OFFENSIVE)){
            m_MasterCommand = MASTERCOMMAND_NONE;

            //offensive or multipurpose wyvern
            if (m_PBattleTarget != nullptr){ //prepare elemental breaths
                int skip = WELL512::GetRandomNumber(6);
                int hasSkipped = 0;

                for (int i = 0; i < m_PPet->PetSkills.size(); i++){
                    if (m_PPet->PetSkills[i]->getValidTargets() == TARGET_ENEMY){
                        if (hasSkipped == skip){
                            SetCurrentMobSkill(m_PPet->PetSkills[i]);
                            break;
                        }
                        else{
                            hasSkipped++;
                        }
                    }
                }

                preparePetAbility(m_PBattleTarget);
                return;
            }

        }
        else if (m_MasterCommand == MASTERCOMMAND_HEALING_BREATH && (wyverntype == WYVERNTYPE_DEFENSIVE || wyverntype == WYVERNTYPE_MULTIPURPOSE))
        {

            m_MasterCommand = MASTERCOMMAND_NONE;
            m_PBattleSubTarget = nullptr;
            //TODO: CHECK FOR STATUS EFFECTS FOR REMOVE- BREATH (higher priority than healing breaths)

            //	if(m_PPet->PMaster->PParty==nullptr){//solo with master-kun
            CItemArmor* masterHeadItem = ((CCharEntity*)(m_PPet->PMaster))->getEquip(SLOT_HEAD);

            uint16 masterHead = masterHeadItem ? masterHeadItem->getID() : 0;

			// Determine what the required HP percentage will need to be 
			// at or under in order for healing breath to activate.
			uint8 requiredHPP = 0;
			if (((CCharEntity*)(m_PPet->PMaster))->objtype == TYPE_PC && (masterHead == 12519 || masterHead == 15238)) { //Check for player & AF head, or +1
				if (wyverntype == WYVERNTYPE_DEFENSIVE) { //healer wyvern
					requiredHPP = 50;
				}
				else if (wyverntype == WYVERNTYPE_MULTIPURPOSE) { //hybrid wyvern
					requiredHPP = 33;
				}
			}
			else {
				if (wyverntype == WYVERNTYPE_DEFENSIVE) { //healer wyvern
					requiredHPP = 33;
				}
				else if (wyverntype == WYVERNTYPE_MULTIPURPOSE) { //hybrid wyvern
					requiredHPP = 25;
				}
			}

			// Only attempt to find a target if there is an HP percentage to calculate.
			if (requiredHPP) {
				CBattleEntity* master = m_PPet->PMaster;
				// Check the master first.
				if (master->GetHPP() <= requiredHPP) {
					m_PBattleSubTarget = master;
				}

				// Otherwise if this is a healer wyvern, and the member is in a party 
				// check all of the party members who qualify.
				else if (wyverntype == WYVERNTYPE_DEFENSIVE && master->PParty != nullptr) {
					master->ForParty([this, requiredHPP](CBattleEntity* PTarget){
						if (PTarget->GetHPP() <= requiredHPP) {
							m_PBattleSubTarget = PTarget;
						}
					});
				}
			}

            if (m_PBattleSubTarget != nullptr){ //target to heal
                //get highest breath for wyverns level
                m_PMobSkill = nullptr;
                for (int i = 0; i < m_PPet->PetSkills.size(); i++){
                    if (m_PPet->PetSkills[i]->getValidTargets() == TARGET_PLAYER_PARTY){
                        if (m_PPet->PetSkills[i]->getID() == 638 &&
                            m_PPet->PMaster->GetMLevel() < 20){ //can only using hb1
                            SetCurrentMobSkill(m_PPet->PetSkills[i]);
                            break;
                        }
                        else if (m_PPet->PetSkills[i]->getID() == 639 &&
                            m_PPet->PMaster->GetMLevel() < 40){ //can only using hb2
                            SetCurrentMobSkill(m_PPet->PetSkills[i]);
                            break;
                        }
                        else if (m_PPet->PetSkills[i]->getID() == 640 &&
                            m_PPet->PMaster->GetMLevel() >= 40){ //can only using hb3
                            SetCurrentMobSkill(m_PPet->PetSkills[i]);
                            break;
                        }
                    }
                }
                preparePetAbility(m_PBattleSubTarget);
                return;
            }
        }
    }

    TransitionBack(true);
}

void CAIPetDummy::preparePetAbility(CBattleEntity* PTarg){
    if (m_PMobSkill != nullptr){

        apAction_t Action;
        m_PPet->m_ActionList.clear();

        // find correct targe
        if (m_PMobSkill->getValidTargets() & TARGET_SELF)
        { //self
            m_PBattleSubTarget = m_PPet;
        }
        else if (m_PMobSkill->getValidTargets() & TARGET_PLAYER_PARTY)
        {
			// Only overwrite the sub target if it it not specified or
			// the input target doesn't match the sub target.
			if (m_PBattleSubTarget == nullptr || PTarg != m_PBattleSubTarget) {
				m_PBattleSubTarget = m_PPet->PMaster;
			}
        }
        else
        {
            if (m_PBattleTarget != nullptr)
            {
                m_PBattleSubTarget = m_PBattleTarget;
            }
            DSP_DEBUG_BREAK_IF(m_PBattleSubTarget == nullptr);
        }

        Action.ActionTarget = m_PBattleSubTarget;
        Action.reaction = REACTION_HIT;
        Action.speceffect = SPECEFFECT_HIT;
        Action.animation = 0;
        Action.param = m_PMobSkill->getMsgForAction();
        Action.messageID = 43; //readies message
        Action.knockback = 0;
 
        m_skillTP = m_PPet->health.tp;
        m_PPet->health.tp = 0;

        m_PPet->m_ActionList.push_back(Action);
        m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CActionPacket(m_PPet));

        m_LastActionTime = m_Tick;
        m_ActionType = ACTION_MOBABILITY_USING;
    }
    else{
        ShowWarning("ai_pet_dummy::ActionAbilityFinish Pet skill is NULL \n");
        TransitionBack(true);
    }
}

void CAIPetDummy::ActionAbilityUsing()
{
    DSP_DEBUG_BREAK_IF(m_PMobSkill == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBattleSubTarget == nullptr && m_PMobSkill->getValidTargets() == TARGET_ENEMY && m_PPet->getPetType() != PETTYPE_AVATAR);

    if (m_PPet->objtype == TYPE_MOB)
    {
        if (m_PMobSkill->getValidTargets() == TARGET_ENEMY && m_PBattleSubTarget->isDead() ||
            m_PMobSkill->getValidTargets() == TARGET_ENEMY && m_PBattleSubTarget->getZone() != m_PPet->getZone()){
            m_ActionType = ACTION_MOBABILITY_INTERRUPT;
            ActionAbilityInterrupt();
            return;
        }
    }
    else
    {
        if (m_PPet->getPetType() != PETTYPE_AVATAR && m_PMobSkill->getValidTargets() == TARGET_ENEMY && m_PBattleSubTarget->isDead() ||
            m_PPet->getPetType() != PETTYPE_AVATAR && m_PMobSkill->getValidTargets() == TARGET_ENEMY && m_PBattleSubTarget->getZone() != m_PPet->getZone()){
            m_ActionType = ACTION_MOBABILITY_INTERRUPT;
            ActionAbilityInterrupt();
            return;
        }
        else if (m_PPet->getPetType() == PETTYPE_AVATAR && m_PMobSkill->getValidTargets() == TARGET_ENEMY && m_PBattleSubTarget->isDead() ||
            m_PPet->getPetType() == PETTYPE_AVATAR && m_PMobSkill->getValidTargets() == TARGET_ENEMY && m_PBattleSubTarget->getZone() != m_PPet->getZone()){
            m_ActionType = ACTION_MOBABILITY_INTERRUPT;
            ActionAbilityInterrupt();
            return;
        }
        else if (m_PMobSkill->getValidTargets() == TARGET_PLAYER_PARTY && m_PBattleSubTarget->isDead() ||
            m_PMobSkill->getValidTargets() == TARGET_PLAYER_PARTY && m_PBattleSubTarget->getZone() != m_PPet->getZone()){
            m_ActionType = ACTION_MOBABILITY_INTERRUPT;
            ActionAbilityInterrupt();
            return;
        }
    }

    if (m_PPet != m_PBattleSubTarget)
    {

        // move towards target if i'm too far away
        float currentDistance = distance(m_PPet->loc.p, m_PBattleSubTarget->loc.p);

        //go to target if its too far away
        if (currentDistance > m_PMobSkill->getDistance() && m_PPathFind->PathTo(m_PBattleSubTarget->loc.p, PATHFLAG_RUN | PATHFLAG_WALLHACK))
        {
            m_PPathFind->FollowPath();
        }
        else
        {
            m_PPathFind->LookAt(m_PBattleSubTarget->loc.p);
        }
    }

    //TODO: Any checks whilst the pet is preparing.
    //NOTE: RANGE CHECKS ETC ONLY ARE DONE AFTER THE ABILITY HAS FINISHED PREPARING.
    //      THE ONLY CHECK IN HERE SHOULD BE WITH STUN/SLEEP/TERROR/ETC

    if (m_Tick > m_LastActionTime + m_PMobSkill->getActivationTime())
    {
        //Range check
        if (m_PPet->objtype == TYPE_MOB)
        {
            if (m_PMobSkill->getValidTargets() == TARGET_ENEMY && m_PBattleSubTarget != m_PPet &&
                distance(m_PBattleSubTarget->loc.p, m_PPet->loc.p) > m_PMobSkill->getDistance()){

                // Pet's target is too far away (and isn't itself)
                SendTooFarInterruptMessage(m_PBattleSubTarget);
                return;
            }
        }
        else
        {
            if (m_PPet->getPetType() != PETTYPE_AVATAR && m_PMobSkill->getValidTargets() == TARGET_ENEMY &&
                m_PBattleSubTarget != m_PPet &&
                distance(m_PBattleSubTarget->loc.p, m_PPet->loc.p) > m_PMobSkill->getDistance()){

                // Avatar's target is too far away (and isn't the avatar itself)
                SendTooFarInterruptMessage(m_PBattleSubTarget);
                return;
            }
            else if (m_PPet->getPetType() == PETTYPE_AVATAR && m_PMobSkill->getValidTargets() == TARGET_ENEMY &&
                m_PBattleSubTarget != m_PPet &&
                distance(m_PBattleSubTarget->loc.p, m_PPet->loc.p) > m_PMobSkill->getDistance()){

                // Avatar's sub target is too far away (and isn't the avatar itself)
                SendTooFarInterruptMessage(m_PBattleSubTarget);
                return;
            }
            else if (m_PMobSkill->getValidTargets() == TARGET_PLAYER_PARTY &&
                distance(m_PBattleSubTarget->loc.p, m_PPet->loc.p) > m_PMobSkill->getDistance()){

                // Player in the pet's party is too far away
                SendTooFarInterruptMessage(m_PBattleSubTarget);
                return;
            }
        }

        m_LastActionTime = m_Tick;
        m_ActionType = ACTION_MOBABILITY_FINISH;
        ActionAbilityFinish();
    }
}

void CAIPetDummy::ActionAbilityFinish(){
    DSP_DEBUG_BREAK_IF(m_PMobSkill == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBattleSubTarget == nullptr);

    // reset AoE finder
    m_PTargetFind->reset();
    m_PPet->m_ActionList.clear();

    float distance = m_PMobSkill->getDistance();

    if (m_PTargetFind->isWithinRange(&m_PBattleSubTarget->loc.p, distance))
    {
        if (m_PMobSkill->isAoE())
        {
            float radius = m_PMobSkill->getDistance();

            m_PTargetFind->findWithinArea(m_PBattleSubTarget, (AOERADIUS)m_PMobSkill->getAoe(), distance);
        }
        else if (m_PMobSkill->isConal())
        {
            float angle = 45.0f;
            m_PTargetFind->findWithinCone(m_PBattleSubTarget, distance, angle);
        }
        else
        {
            m_PTargetFind->findSingleTarget(m_PBattleSubTarget);
        }
    }

    uint16 totalTargets = m_PTargetFind->m_targets.size();
    //call the script for each monster hit
    m_PMobSkill->setTotalTargets(totalTargets);
    m_PMobSkill->setTP(m_skillTP);

    apAction_t Action;
    Action.ActionTarget = nullptr;
    Action.reaction = REACTION_HIT;
    Action.speceffect = SPECEFFECT_HIT;
    Action.animation = m_PMobSkill->getAnimationID();
    Action.knockback = 0;

    uint16 msg = 0;
    for (std::vector<CBattleEntity*>::iterator it = m_PTargetFind->m_targets.begin(); it != m_PTargetFind->m_targets.end(); ++it)
    {

        CBattleEntity* PTarget = *it;

        Action.ActionTarget = PTarget;

        if (m_PPet->isBstPet()){
            Action.param = luautils::OnMobWeaponSkill(PTarget, m_PPet, GetCurrentMobSkill());
        }
        else {
            Action.param = luautils::OnPetAbility(PTarget, m_PPet, GetCurrentMobSkill(), m_PPet->PMaster);
        }

        if (msg == 0){
            msg = m_PMobSkill->getMsg();
        }
        else {
            msg = m_PMobSkill->getAoEMsg();
        }

        Action.messageID = msg;

        battleutils::ClaimMob(m_PBattleSubTarget, m_PPet);

        if (PTarget->objtype == TYPE_MOB && !m_PTargetFind->checkIsPlayer(PTarget) && m_PMobSkill->isDamageMsg())
        {
            ((CMobEntity*)PTarget)->PEnmityContainer->UpdateEnmityFromDamage(m_PPet, Action.param);
        }

        // If we dealt damage.. we should wake up our target..
        if (m_PMobSkill->isDamageMsg() && Action.param > 0 && PTarget->StatusEffectContainer != nullptr)
        {
            PTarget->StatusEffectContainer->WakeUp();
            
            
            if (it == m_PTargetFind->m_targets.begin() && (m_PMobSkill->getSkillchain() != 0))
            {
                CWeaponSkill* PWeaponSkill = battleutils::GetWeaponSkill(m_PMobSkill->getSkillchain());
                if (PWeaponSkill)
                {
                    SUBEFFECT effect = battleutils::GetSkillChainEffect(m_PBattleSubTarget, PWeaponSkill);
                    if (effect != SUBEFFECT_NONE)
                    {
                        int32 skillChainDamage = battleutils::TakeSkillchainDamage(m_PPet, PTarget, Action.param);
                        if (skillChainDamage < 0)
                        {
                            Action.addEffectParam = -skillChainDamage;
                            Action.addEffectMessage = 384 + effect;
                        }
                        else
                        {
                            Action.addEffectParam = skillChainDamage;
                            Action.addEffectMessage = 287 + effect;
                        }
                        Action.additionalEffect = effect;
                    }
                }
            }
            
            
            
        }

        m_PPet->m_ActionList.push_back(Action);
    }

    m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CActionPacket(m_PPet));

    if (Action.ActionTarget != nullptr && m_PPet->getPetType() == PETTYPE_AVATAR){ //todo: remove pet type avatar maybe
        Action.ActionTarget->loc.zone->PushPacket(Action.ActionTarget, CHAR_INRANGE, new CEntityUpdatePacket(Action.ActionTarget, ENTITY_UPDATE, UPDATE_COMBAT));
    }

    m_PBattleSubTarget = nullptr;
    m_ActionType = ACTION_ATTACK;
}

void CAIPetDummy::ActionAbilityInterrupt(){
    m_LastActionTime = m_Tick;
    //cancel the whole readying animation
    apAction_t Action;
    m_PPet->m_ActionList.clear();

    Action.ActionTarget = m_PPet;
    Action.reaction = REACTION_NONE;
    Action.speceffect = SPECEFFECT_NONE;
    Action.animation = 0;
    Action.param = 0;
    Action.messageID = 0;
    Action.knockback = 0;

    m_PPet->m_ActionList.push_back(Action);
    m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CActionPacket(m_PPet));

    m_PMobSkill = nullptr;
    m_ActionType = ACTION_ATTACK;
}

bool CAIPetDummy::PetIsHealing(){

    bool isMasterHealing = (m_PPet->PMaster->animation == ANIMATION_HEALING);
    bool isPetHealing = (m_PPet->animation == ANIMATION_HEALING);

    if (isMasterHealing && !isPetHealing && !m_PPet->StatusEffectContainer->HasPreventActionEffect()){
        //animation down
        m_PPet->animation = ANIMATION_HEALING;
        m_PPet->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_HEALING, 0, 0, 10, 0));
        m_PPet->updatemask |= UPDATE_HP;
        return true;
    }
    else if (!isMasterHealing && isPetHealing){
        //animation up
        m_PPet->animation = ANIMATION_NONE;
        m_PPet->StatusEffectContainer->DelStatusEffect(EFFECT_HEALING);
        m_PPet->updatemask |= UPDATE_HP;
        return false;
    }
    return isMasterHealing;
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void CAIPetDummy::ActionRoaming()
{
    if (m_PPet->PMaster == nullptr || m_PPet->PMaster->isDead()){
        m_ActionType = ACTION_FALL;
        ActionFall();
        return;
    }

    //automaton, wyvern
    if (m_PPet->getPetType() == PETTYPE_WYVERN || m_PPet->getPetType() == PETTYPE_AUTOMATON){
        if (PetIsHealing()){
            return;
        }
    }

    if (m_PBattleTarget != nullptr){
        m_ActionType = ACTION_ENGAGE;
        ActionEngage();
        return;
    }

    float currentDistance = distance(m_PPet->loc.p, m_PPet->PMaster->loc.p);

    // this is broken until pet / mob relationship gets fixed
    // pets need to extend mob or be a mob because pet has no spell list!
	int16 spellID = -1;
    if (m_PPet->getPetType() == PETTYPE_AVATAR && m_PPet->m_Family == 104 && m_Tick >= m_LastMagicTime + m_Cooldown && currentDistance < PET_ROAM_DISTANCE * 2)
    {
        spellID = LightRoam();      
    }
	
	if (spellID != -1)
    {
        m_PPet->addMP(1000);
		SetCurrentSpell(spellID);
        m_ActionType = ACTION_MAGIC_START;
        ActionMagicStart();
        return;
    }

    if (currentDistance > PET_ROAM_DISTANCE)
    {
        if (currentDistance < 35.0f && m_PPathFind->PathAround(m_PPet->PMaster->loc.p, 2.0f, PATHFLAG_RUN | PATHFLAG_WALLHACK))
        {
            m_PPathFind->FollowPath();
        }
        else if (m_PPet->GetSpeed() > 0)
        {
            m_PPathFind->WarpTo(m_PPet->PMaster->loc.p, PET_ROAM_DISTANCE);
        }
    }
}

void CAIPetDummy::ActionEngage()
{
    DSP_DEBUG_BREAK_IF(m_PBattleTarget == nullptr);

    if (m_PPet->PMaster == nullptr || m_PPet->PMaster->isDead())
    {
        m_ActionType = ACTION_FALL;
        ActionFall();
        return;
    }

    bool hasClaim = false;

    if (m_PBattleTarget->m_OwnerID.id == m_PPet->PMaster->id)
        hasClaim = true;

    if (m_PBattleTarget->m_OwnerID.id == 0)
        hasClaim = true;


    if (m_PPet->PMaster->PParty != nullptr)
    {
        // alliance
        if (m_PPet->PMaster->PParty->m_PAlliance != nullptr)
        {
            for (uint8 a = 0; a < m_PPet->PMaster->PParty->m_PAlliance->partyList.size(); ++a)
            {
                for (uint8 i = 0; i < m_PPet->PMaster->PParty->m_PAlliance->partyList.at(a)->members.size(); ++i)
                {
                    if (m_PPet->PMaster->PParty->m_PAlliance->partyList.at(a)->members[i]->id == m_PBattleTarget->m_OwnerID.id)
                        hasClaim = true;
                }
            }
        }
        else  // party
            for (uint8 i = 0; i < m_PPet->PMaster->PParty->members.size(); ++i)
            {
                if (m_PPet->PMaster->PParty->members[i]->id == m_PBattleTarget->m_OwnerID.id)
                    hasClaim = true;
            }
    }


    if (hasClaim)
    {
        m_PPet->animation = ANIMATION_ATTACK;
        m_PPet->updatemask |= UPDATE_HP;
        m_LastActionTime = m_Tick - 1000;
        TransitionBack(true);
    }
    else
    {
        m_PPet->animation = ANIMATION_NONE;
        m_PPet->updatemask |= UPDATE_HP;
        if (m_PPet->PMaster->objtype == TYPE_PC)
        {
            ((CCharEntity*)m_PPet->PMaster)->pushPacket(new CMessageBasicPacket(((CCharEntity*)m_PPet->PMaster),
                ((CCharEntity*)m_PPet->PMaster), 0, 0, 12));
            m_ActionType = ACTION_DISENGAGE;
            return;
        }
    }
}


void CAIPetDummy::ActionAttack()
{
    if (m_PPet->PMaster == nullptr || m_PPet->PMaster->isDead() || m_PPet->isDead()){
        m_ActionType = ACTION_FALL;
        ActionFall();
        return;
    }

    //if 2 bsts are in party, make sure their pets cannot fight eachother
    if (m_PBattleTarget != nullptr && m_PBattleTarget->objtype == TYPE_MOB && m_PBattleTarget->PMaster != nullptr && m_PBattleTarget->PMaster->objtype == TYPE_PC)
    {
        m_ActionType = ACTION_DISENGAGE;
        ActionDisengage();
        return;
    }

    //wyvern behaviour
    if (m_PPet->getPetType() == PETTYPE_WYVERN && m_PPet->PMaster->PBattleAI->GetBattleTarget() == nullptr){
        m_PBattleTarget = nullptr;
    }

    //handle death of target
    if (m_PBattleTarget == nullptr || m_PBattleTarget->isDead() ||
        m_PBattleTarget->animation == ANIMATION_CHOCOBO)
    {
        m_ActionType = ACTION_DISENGAGE;
        ActionDisengage();
        return;
    }

    if (m_queueSic && m_PPet->health.tp >= 1000)
    {
        // now use my tp move
        m_queueSic = false;
        m_MasterCommand = MASTERCOMMAND_SIC;
        m_ActionType = ACTION_MOBABILITY_START;
        ActionAbilityStart();
        return;
    }
    

	float currentDistance = distance(m_PPet->loc.p, m_PBattleTarget->loc.p);
	int16 spellID = -1;
    if (m_Tick >= m_LastActionTime + m_Cooldown)
    {
        uint16 family = m_PPet->m_Family;
		if (m_PPet->getPetType() == PETTYPE_AVATAR)
		{	
			if (family == 104)
				spellID = LightAttack();
			else if (family == 100)
				spellID = DarkAttack();
		}
    }
	
	if (spellID != -1)
    {
        m_PPet->addMP(1000);
		SetCurrentSpell(spellID);
        m_ActionType = ACTION_MAGIC_START;
        ActionMagicStart();
        return;
    }
	
    m_PPathFind->LookAt(m_PBattleTarget->loc.p);

    
    
    

    //go to target if its too far away
    if (currentDistance > m_PBattleTarget->m_ModelSize && m_PPet->speed != 0)
    {
        if (m_PPathFind->PathAround(m_PBattleTarget->loc.p, 2.0f, PATHFLAG_RUN | PATHFLAG_WALLHACK))
        {
            m_PPathFind->FollowPath();

            // recalculate
            currentDistance = distance(m_PPet->loc.p, m_PBattleTarget->loc.p);
        }
    }

    if (currentDistance <= m_PBattleTarget->m_ModelSize)
    {
        int32 WeaponDelay = m_PPet->m_Weapons[SLOT_MAIN]->getDelay();
        //try to attack
        if (m_Tick > m_LastActionTime + WeaponDelay){
            if (battleutils::IsParalyzed(m_PPet))
            {
                m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CMessageBasicPacket(m_PPet, m_PBattleTarget, 0, 0, 29));
            }
            else if (battleutils::IsIntimidated(m_PPet, m_PBattleTarget))
            {
                m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CMessageBasicPacket(m_PPet, m_PBattleTarget, 0, 0, 106));
            }
            else
            {
                apAction_t Action;
                m_PPet->m_ActionList.clear();

                Action.ActionTarget = m_PBattleTarget;

                uint8 numAttacks = battleutils::CheckMultiHits(m_PPet, m_PPet->m_Weapons[SLOT_MAIN]);

                for (uint8 i = 0; i < numAttacks; i++){
                    Action.reaction = REACTION_EVADE;
                    Action.speceffect = SPECEFFECT_NONE;
                    Action.animation = 0;
                    Action.param = 0;
                    Action.messageID = 15;
                    Action.knockback = 0;
                    //ShowDebug("pet hp %i and atk %i def %i eva is %i \n",m_PPet->health.hp,m_PPet->ATT(),m_PPet->DEF(),m_PPet->getMod(MOD_EVA));
                    int32 damage = 0;

                    if (m_PBattleTarget->StatusEffectContainer->HasStatusEffect(EFFECT_PERFECT_DODGE))
                    {
                        Action.messageID = 32;
                    }
                    else if ((WELL512::GetRandomNumber(100) < battleutils::GetHitRate(m_PPet, m_PBattleTarget)) &&
                        !m_PBattleTarget->StatusEffectContainer->HasStatusEffect(EFFECT_ALL_MISS))
                    {
                        if (battleutils::IsAbsorbByShadow(m_PBattleTarget))
                        {
                            Action.messageID = 31;
                            Action.param = 1;
                            Action.reaction = REACTION_EVADE;
                        }
                        else
                        {
                            Action.reaction = REACTION_HIT;
                            Action.speceffect = SPECEFFECT_HIT;
                            Action.messageID = 1;

                            bool isCritical = (WELL512::GetRandomNumber(100) < battleutils::GetCritHitRate(m_PPet, m_PBattleTarget, false));
                            float DamageRatio = battleutils::GetDamageRatio(m_PPet, m_PBattleTarget, isCritical, 0);

                            if (isCritical)
                            {

                                Action.speceffect = SPECEFFECT_CRITICAL_HIT;
                                Action.messageID = 67;
                            }

                            damage = (int32)((m_PPet->GetMainWeaponDmg() + battleutils::GetFSTR(m_PPet, m_PBattleTarget, SLOT_MAIN)) * DamageRatio);
                        }
                    }
                    else {
                        // create enmity even on misses
                        if (m_PBattleTarget->objtype == TYPE_MOB){
                            CMobEntity* PMob = (CMobEntity*)m_PBattleTarget;
                            PMob->PEnmityContainer->UpdateEnmity(m_PPet, 0, 0);
                        }
                    }
                    if (m_PBattleTarget->objtype == TYPE_PC)
                    {
                        charutils::TrySkillUP((CCharEntity*)m_PBattleTarget, SKILL_EVA, m_PPet->GetMLevel());
                    }

                    bool isBlocked = (WELL512::GetRandomNumber(100) < battleutils::GetBlockRate(m_PPet, m_PBattleTarget));
                    if (isBlocked){ Action.reaction = REACTION_BLOCK; }


                    Action.param = battleutils::TakePhysicalDamage(m_PPet, m_PBattleTarget, damage, isBlocked, SLOT_MAIN, 1, nullptr, true, true);
                    if (Action.param < 0)
                    {
                        Action.param = -(Action.param);
                        Action.messageID = 373;
                    }

                    // spike effect
                    if (Action.reaction != REACTION_EVADE && Action.reaction != REACTION_PARRY)
                    {

                        battleutils::HandleEnspell(m_PPet, m_PBattleTarget, &Action, i, m_PPet->m_Weapons[SLOT_MAIN], damage);
                        battleutils::HandleSpikesDamage(m_PPet, m_PBattleTarget, &Action, damage);
                    }

                    m_PPet->m_ActionList.push_back(Action);
                }

                m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CActionPacket(m_PPet));

                if (m_PPet->PMaster != nullptr && m_PPet->PMaster->objtype == TYPE_PC && m_PPet->PMaster->PPet != nullptr){
                    ((CCharEntity*)m_PPet->PMaster)->pushPacket(new CPetSyncPacket((CCharEntity*)m_PPet->PMaster));
                }
            }
            m_LastActionTime = m_Tick;

            // Update the targets attacker level..
            CMobEntity* Monster = (CMobEntity*)m_PBattleTarget;
            if (Monster->m_HiPCLvl < ((CCharEntity*)m_PPet->PMaster)->GetMLevel())
                Monster->m_HiPCLvl = ((CCharEntity*)m_PPet->PMaster)->GetMLevel();
        }
    }
}

void CAIPetDummy::ActionSleep()
{
    if (!m_PPet->StatusEffectContainer->HasPreventActionEffect())
    {
        TransitionBack();
    }
}

void CAIPetDummy::ActionDisengage()
{
    if (m_PPet->PMaster == nullptr || m_PPet->PMaster->isDead()){
        m_ActionType = ACTION_FALL;
        ActionFall();
        return;
    }

    m_queueSic = false;
    m_PPet->animation = ANIMATION_NONE;
    m_PPet->updatemask |= UPDATE_HP;
    m_LastActionTime = m_Tick;
    m_PBattleTarget = nullptr;
    TransitionBack();
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void CAIPetDummy::ActionFall()
{
    bool isMob = m_PPet->objtype == TYPE_MOB;
    // remove master from pet
    if (m_PPet->PMaster != nullptr && m_PPet->PMaster->PPet == m_PPet){
        petutils::DetachPet(m_PPet->PMaster);
    }

    // detach pet just deleted this
    // so break out of here
    if (isMob){
        return;
    }

    m_PPet->updatemask |= UPDATE_HP;
    m_PPet->UpdateEntity();

    m_LastActionTime = m_Tick;
    m_ActionType = ACTION_DEATH;
}

void CAIPetDummy::ActionDeath()
{
    if (m_Tick - m_LastActionTime > 3000){
        m_PPet->status = STATUS_DISAPPEAR;
        m_PPet->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DEATH, true);

        m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CEntityUpdatePacket(m_PPet, ENTITY_DESPAWN, UPDATE_NONE));

        m_ActionType = ACTION_NONE;
    }
}

void CAIPetDummy::ActionMagicStart()
{
    // disabled
    DSP_DEBUG_BREAK_IF(m_PSpell == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBattleSubTarget == nullptr);

    m_LastActionTime = m_Tick;
    m_LastMagicTime = m_Tick;


    STATESTATUS status = m_PMagicState->CastSpell(GetCurrentSpell(), m_PBattleSubTarget);

    if (status == STATESTATUS_START)
    {
        m_ActionType = ACTION_MAGIC_CASTING;
    }
    else
    {
        TransitionBack(true);
    }

}

void CAIPetDummy::ActionMagicCasting()
{
    m_PPathFind->LookAt(m_PMagicState->GetTarget()->loc.p);

    STATESTATUS status = m_PMagicState->Update(m_Tick);

    if (status == STATESTATUS_INTERRUPT)
    {
        m_ActionType = ACTION_MAGIC_INTERRUPT;
        ActionMagicInterrupt();
    }
    else if (status == STATESTATUS_ERROR)
    {
        TransitionBack(true);
    }
    else if (status == STATESTATUS_FINISH)
    {
        m_ActionType = ACTION_MAGIC_FINISH;
        ActionMagicFinish();
    }
}

void CAIPetDummy::ActionMagicFinish()
{
    m_LastActionTime = m_Tick;
    m_LastMagicTime = m_Tick;

    m_PMagicState->FinishSpell();

    m_PSpell = nullptr;
    m_PBattleSubTarget = nullptr;

    TransitionBack();
}

void CAIPetDummy::ActionMagicInterrupt()
{
    m_LastActionTime = m_Tick;
    m_LastMagicTime = m_Tick;

    m_PMagicState->InterruptSpell();

    m_PSpell = nullptr;
    m_PBattleSubTarget = nullptr;

    TransitionBack();
}

/************************************************************************
*																		*
*  При появлении питомца задержка в 4.5 секунды перед началом			*
*  следования за персонажем. Состояние может быть перезаписано.			*
*																		*
************************************************************************/

void CAIPetDummy::ActionSpawn()
{
    if (m_PPet->PMaster == nullptr || m_PPet->PMaster->isDead()){
        m_ActionType = ACTION_FALL;
        ActionFall();
        return;
    }

    if (m_Tick > m_LastActionTime + 4000)
    {
        m_ActionType = ACTION_ROAMING;
    }
}

/************************************************************************
*																		*
*  Sends the too far away message and interrupts the pet from			*
*  performing its action. Changes to the interrupt state.				*
*																		*
************************************************************************/

void CAIPetDummy::SendTooFarInterruptMessage(CBattleEntity* PTarg)
{
    m_ActionType = ACTION_MOBABILITY_INTERRUPT;
    //too far away message = 78
    m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CMessageBasicPacket(PTarg, PTarg, 0, 0, 78));
    ActionAbilityInterrupt();
}

void CAIPetDummy::TransitionBack(bool skipWait)
{

    if (m_PPet->animation == ANIMATION_ATTACK)
    {
        m_ActionType = ACTION_ATTACK;
        if (skipWait)
        {
            ActionAttack();
        }
    }
    else
    {
        m_ActionType = ACTION_ROAMING;
        if (skipWait)
        {
            ActionRoaming();
        }
    }
}



//LIGHT ELEMENTAL
int16 CAIPetDummy::LightRoam()
{
    uint8 level = m_PPet->GetMLevel();
    int16 spellID = -1;
    CBattleEntity* master = m_PPet->PMaster;
    
    CStatusEffectContainer* status = master->StatusEffectContainer;
    if (status->HasStatusEffect(EFFECT_PROTECT) == false)
    {
        m_PBattleSubTarget = m_PPet;
        if (level < 27)
            spellID = 125;
        else if (level < 47)
            spellID = 126;
        else if (level < 63)
            spellID = 127;
        else
            spellID = 128;
        m_Cooldown = 5000;
    }
    else if (status->HasStatusEffect(EFFECT_SHELL) == false)
    {
        m_PBattleSubTarget = m_PPet;
        if (level < 27)
            spellID = 130;
        else if (level < 47)
            spellID = 131;
        else if (level < 63)
            spellID = 132;
        else
            spellID = 133;
        m_Cooldown = 5000;
    }
    else if (status->HasStatusEffect(EFFECT_REGEN) == false && level > 20)
    {
        m_PBattleSubTarget = master;
        if (level < 44)
            spellID = 108;
        else if (level < 66)
            spellID = 110;
        else
            spellID = 111;
        m_Cooldown = 5000;
    }
    //uint8 masterHPP = 
    //int16 spellID = 108;
    return spellID;
}

int16 CAIPetDummy::LightAttack()
{
	uint8 level = m_PPet->GetMLevel();
    int16 spellID = -1;
    CBattleEntity* master = m_PPet->PMaster;  
    CBattleEntity* mostWounded = getWounded(50);
    //CBattleEntity* mostWounded = m_PPet;
    
    if (mostWounded != nullptr)
    {
        m_PBattleSubTarget = mostWounded;
        if (level < 11)
            spellID = 1;
        else if (level < 21)
            spellID = 2;
        else if (level < 41)
            spellID = 3;
        else if (level < 61)
            spellID = 4;
        else
            spellID = 5;
        m_Cooldown = 20000;
    }
	else if (m_PBattleTarget != nullptr && m_PBattleTarget->StatusEffectContainer->HasStatusEffect(EFFECT_DIA) == false)
	{
		m_PBattleSubTarget = m_PBattleTarget;
		m_Cooldown = 5000;
        if (level < 36)
            spellID = 23;
        else
            spellID = 24;
        
	}
	else
	{
		m_Cooldown = 5000;
		m_PBattleSubTarget = m_PBattleTarget;
		if (level < 30)
			spellID = 28;
		else if (level < 65)
			spellID = 29;
		else
			spellID = 30;
	}
	return spellID;
}


int16 CAIPetDummy::DarkAttack()
{
	uint8 level = m_PPet->GetMLevel();
    int16 spellID = -1;
    CBattleEntity* master = m_PPet->PMaster;  
    //CBattleEntity* mostWounded = m_PPet;
    m_PBattleSubTarget = m_PBattleTarget;

	if (m_PBattleTarget->StatusEffectContainer->HasStatusEffect(EFFECT_DIA) == false
			&& m_PBattleTarget->StatusEffectContainer->HasStatusEffect(EFFECT_BIO) == false)
	{
		m_Cooldown = getSpiritCooldown(5000, DARKSDAY);
        if (level < 36)
            spellID = 230;
        else
            spellID = 231;
        
	}
	else if (m_PBattleTarget->StatusEffectContainer->HasStatusEffect(EFFECT_BLINDNESS) == false
		&& WELL512::GetRandomNumber(100) < 70)
		{
		m_Cooldown = getSpiritCooldown(6500, DARKSDAY);
		if (level < 70)
			spellID = 254;
		else
			spellID = 276;
		}
	else if (level < 61 && WELL512::GetRandomNumber(100) < 45)
	{
		spellID = 242;
        m_Cooldown = getSpiritCooldown(8000, DARKSDAY);
	}
	else if (WELL512::GetRandomNumber(100) < 20 && level > 44)
	{
		m_Cooldown = getSpiritCooldown(6500, DARKSDAY);
		spellID = 252;
	}
	else
	{
		m_Cooldown = getSpiritCooldown(12000, DARKSDAY);
		if (level < 50)
			spellID = 245;
		else
			spellID = 246;
	}
	
	
	return spellID;
}


CBattleEntity* CAIPetDummy::getWounded(uint8 threshold)
{
    uint8 lowest = 100;
    CBattleEntity* mostHurt = nullptr;
     std::vector<CBattleEntity*> members = std::vector<CBattleEntity*>();
	 if (m_PPet->PMaster->PParty == nullptr)
	 {
		 if (m_PPet->PMaster->GetHPP() <= threshold)
			 return m_PPet->PMaster;
		 else if (m_PPet->GetHPP() <= threshold)
			 return m_PPet;
		 else
			 return nullptr;
	 }
	
    try
    {
        members = m_PPet->PMaster->PParty->members;
    }
    catch (int e)
    {
        perror("Can't access PParty.");
        return nullptr;
        
    }
    /*for (uint32 i = 0; i < members.size(); ++i)
    {
        CBattleEntity* ally = nullptr;
        try
        {
            ally = members.at(i);
        }
        catch (int e)
        {
            perror("No members.at");
            return false;
        }
        if (ally == nullptr)
        {
            continue;
        }
        
        try
        {
            uint8 hpp = ally->GetHPP();
            if (hpp < lowest && hpp < threshold)
            {
                lowest = hpp;
                mostHurt = ally;
            }   
        }
        catch (int e)
        {
            perror("Math stuff.");
            return nullptr;
        }*/
	
    

    
    /*if (m_PPet->PMaster->GetHPP() <= threshold)
    {
        mostHurt = m_PPet->PMaster;
    }
    else if (m_PPet->GetHPP() <= threshold)
    {
        mostHurt = m_PPet;
    }*/
    
    return mostHurt;
}

uint32 CAIPetDummy::getSpiritCooldown(uint32 cooldown, uint8 sDay)
{
	CBattleEntity* master = m_PPet->PMaster;
	double mSummoning = (double)master->getMod(MOD_SUMMONING);
    if (mSummoning > 30)
        mSummoning = 30;
	double mChr = (double)master->getMod(MOD_CHR);
    if (mChr > 60)
        mChr = 60;
	double mBloodpact = (double)master->getMod(MOD_BP_DELAY);
    if (mBloodpact > 15)
        mBloodpact = 15;
	uint8 day = (uint8)CVanaTime::getInstance()->getWeekday();
	WEATHER weather = battleutils::GetWeather(m_PPet, true);
    double fCooldown = cooldown;
    fCooldown = fCooldown * (1.0 - mSummoning / 100.0);
    fCooldown = fCooldown * (1.0 - mChr / 200.0);
    fCooldown = fCooldown * (1.0 - mBloodpact / 50.0);
    
    if (sDay == day)
        fCooldown = fCooldown * 0.8;
    if (weather == WEATHER_HOT_SPELL && day == FIRESDAY)
        fCooldown = fCooldown * 0.8;
    else if (weather == WEATHER_HEAT_WAVE && day == FIRESDAY)
        fCooldown = fCooldown * 0.6;
    else if (weather == WEATHER_RAIN && day == WATERSDAY)
        fCooldown = fCooldown * 0.8;
    else if (weather == WEATHER_SQUALL && day == WATERSDAY)
        fCooldown = fCooldown * 0.6;
    else if (weather == WEATHER_DUST_STORM && day == EARTHSDAY)
        fCooldown = fCooldown * 0.8;
    else if (weather == WEATHER_SAND_STORM && day == EARTHSDAY)
        fCooldown = fCooldown * 0.6;
    else if (weather == WEATHER_WIND && day == WINDSDAY)
        fCooldown = fCooldown * 0.8;
    else if (weather == WEATHER_GALES && day == WINDSDAY)
        fCooldown = fCooldown * 0.6;
    else if (weather == WEATHER_SNOW && day == ICEDAY)
        fCooldown = fCooldown * 0.8;
    else if (weather == WEATHER_BLIZZARDS && day == ICEDAY)
        fCooldown = fCooldown * 0.6;
    else if (weather == WEATHER_THUNDER && day == LIGHTNINGDAY)
        fCooldown = fCooldown * 0.8;
    else if (weather == WEATHER_THUNDERSTORMS && day == LIGHTNINGDAY)
        fCooldown = fCooldown * 0.6;
    else if (weather == WEATHER_AURORAS && day == LIGHTSDAY)
        fCooldown = fCooldown * 0.8;
    else if (weather == WEATHER_STELLAR_GLARE && day == LIGHTSDAY)
        fCooldown = fCooldown * 0.6;
    else if (weather == WEATHER_GLOOM && day == DARKSDAY)
        fCooldown = fCooldown * 0.8;
    else if (weather == WEATHER_DARKNESS && day == DARKSDAY)
        fCooldown = fCooldown * 0.6;
    
    
	return (uint32)fCooldown;
}
