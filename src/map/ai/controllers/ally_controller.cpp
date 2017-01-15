/*
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

#include <algorithm>
#include "ally_controller.h"
#include "../../entities/petentity.h"
#include "../../lua/luautils.h"
#include "../../mobskill.h"
#include "../../utils/battleutils.h"
#include "../../utils/petutils.h"
#include "../../utils/zoneutils.h"
#include "../../mob_spell_container.h"
#include "../ai_container.h"
#include "../states/magic_state.h"
#include "../states/mobskill_state.h"
#include "../../spell.h"
#include "../../ability.h"
#include "../../../common/utils.h"
#include "../helpers/ai_utils.h"
using namespace aiutils;


CAllyController::CAllyController(CPetEntity* PPet) : CPetController(PPet),
    PAlly(PPet)
{
    uint16 targId = 0;
    uint16 spellId = 0;
    restCounter = 0;
    if (PPet->m_PetID == PETID_INGRID)
        PPet->m_Behaviour |= 2;
}
void CAllyController::DoRoamTick(time_point tick) {
    if (PAlly->PMaster == nullptr || PAlly->PMaster->isDead()) {
        PAlly->Die();
        return;
    }


    restCounter += 1;
    if (restCounter >= 10) {
        PAlly->addHP(PAlly->GetMaxHP() / 50);
        PAlly->addMP(PAlly->GetMaxMP() / 70);
        restCounter = 0;
    }


    bool success = false;
    uint16 level = PAlly->GetMLevel();

    if (isReady(m_lastMagicTick, 6)) {
        if (PAlly->m_PetID == PETID_CHERUKIKI && roamCherukiki(level))
            success = true;
        if (PAlly->m_PetID == PETID_CURILLA && roamCurilla(level))
            success = true;
    }

//    if (head == HEAD_STORMWAKER && frame == FRAME_STORMWAKER && roamStormStorm(skill)) {
//        success = true;
//    } else if (head == HEAD_SOULSOOTHER && frame == FRAME_STORMWAKER && roamStormSoul(skill)) {
//        success = true;
//    } else if (head == HEAD_HARLEQUIN && frame == FRAME_HARLEQUIN && roamHarlHarl(skill)) {
//        success = true;
//    }

    if (success) {
        CSpell* spell = spell::GetSpell(spellid);
        m_lastMagicTick = m_Tick;
        Cast(targid, spellid);
    }



    float currentDistance = distance(PAlly->loc.p, PAlly->PMaster->loc.p);

    if (currentDistance > PetRoamDistance)
    {
        if (currentDistance < 35.0f && PAlly->PAI->PathFind->PathAround(PAlly->PMaster->loc.p, 2.0f, PATHFLAG_RUN | PATHFLAG_WALLHACK))
        {
            PAlly->PAI->PathFind->FollowPath();
        }
        else if (PAlly->GetSpeed() > 0)
        {
            PAlly->PAI->PathFind->WarpTo(PAlly->PMaster->loc.p, PetRoamDistance);
        }
    }

}

void CAllyController::DoCombatTick(time_point tick)
{
    PTarget = static_cast<CBattleEntity*>(PAlly->GetEntity(PAlly->GetBattleTargetID()));
    if (PAlly->PMaster == nullptr || PAlly->PMaster->isDead()) {
        PAlly->Die();
        return;
    }

    if (TryDeaggro()) {
        Disengage();
        return;
    }
    if (isReady(m_lastMagicTick, 6) && TrySpellcast(tick)) {
        return;
    }
    else if (TrySpecialSkill()) {
        return;
    }
    else if (TryTPMove()) {
//        WeaponSkill(PTarget->targid, spellid);
        MobSkill(PTarget->targid, spellid);
        return;
    }
//    else if (TryRangedAttack()) {
//        //TODO: set ID to ranged attack
//        m_LastRangedTime = m_Tick;
//        return;
//    }
    Move();
}

bool CAllyController::TrySpellcast(time_point tick) {
//    AUTOFRAMETYPE frame = PAlly->getFrame();
//    if (frame == FRAME_VALOREDGE || frame == FRAME_SHARPSHOT)
//        return false;
//
//    AUTOHEADTYPE head = PAlly->getHead();
//    int skill = PAlly->PMaster->GetSkill(SKILL_AMA);
//    mList = PAlly->PMaster->StatusEffectContainer->GetManeuverList();
//    useStatusRecast = false;
    bool success = false;
    uint16 level = PAlly->GetMLevel();
    if (PAlly->m_PetID == PETID_CHERUKIKI && combatCherukiki(level))
        success = true;
    else if (PAlly->m_PetID == PETID_INGRID && combatIngrid(level))
        success = true;
    else if (PAlly->m_PetID == PETID_CURILLA && combatCurilla(level))
        success = true;

//
//    if (frame == FRAME_STORMWAKER && head == HEAD_STORMWAKER && combatStormStorm(skill)) {
//        success = true;
//    } else if (frame == FRAME_STORMWAKER && head == HEAD_SPIRITREAVER && combatStormSpirit(skill)) {
//        success = true;
//    } else if (frame == FRAME_STORMWAKER && head == HEAD_SOULSOOTHER && combatStormSoul(skill)) {
//        success = true;
//    } else if (frame == FRAME_HARLEQUIN && head == HEAD_HARLEQUIN && combatHarlHarl(skill)) {
//        success = true;
//    }
//
    if (success) {
        CSpell* spell = spell::GetSpell(spellid);
        m_lastMagicTick = m_Tick;
        Cast(targid, spellid);
    }
    return success;

}

bool CAllyController::roamCherukiki(uint16 lvl) {
    if (tryStatusRemoval(lvl))
        return true;
    if (doProtectShell(lvl, 1))
        return true;
    if (doCureRegen(lvl, JOB_WHM, 50, true, true))
        return true;
    if (isReady(m_enhancing1, 20) && notHave(PAlly, EFFECT_STONESKIN) && lvl >= 21 && canCast(54))
        return choose(PAlly, 54, m_enhancing1);
    if (isReady(m_enhancing1, 20) && notHave(PAlly, EFFECT_BLINK) && lvl >= 16 && canCast(53))
        return choose(PAlly, 53, m_enhancing1);
    return false;
}

bool CAllyController::roamCurilla(uint16 lvl){
    if (doProtectShell(lvl, false, true))
        return true;
    if (doCureRegen(lvl, JOB_PLD, 50, false, false))
        return true;
    return false;
}

bool CAllyController::useJobAbility(CBattleEntity* PTarget, uint16 abilityId, time_point &recast, uint32 useDelay) {
    queueJobAbility(PAlly, abilityId, PTarget, useDelay);
    recast = m_Tick;
    m_lastAbilityTick = m_Tick;
    return true;
};


bool CAllyController::combatIngrid(uint16 lvl) {
//    int sCure = lvl < 11 ? 1 : lvl < 21 ? 2 : lvl < 41 ? 3 : lvl < 61 ? 4 : 5; // Cure III or Cure IV
    int sBanish = lvl < 30 ? 28 : lvl < 65 ? 29 :  30;
    int sHoly = lvl < 50 ? 0 : lvl < 72 ? 21 : 22;
    int sDia = lvl < 3 ? 0 : lvl < 36 ? 23 : lvl < 70 ? 24 : 25;
    int sFlash = lvl < 45 ? 0 : 112;

    if (PTarget != nullptr && canMagicBurst(PTarget, 7) && isReady(m_divine2, 30) && canCast(sHoly))
        return choose(PTarget, sHoly, m_divine2);


    if (PTarget == nullptr || PTarget->GetHPP() == 100)
        return false;

    if (notHave(PTarget, EFFECT_DIA) && notHave(PTarget, EFFECT_BIO) && canCast(sDia) && isReady(m_enfeeble1, 10))
        return choose(PTarget, sDia, m_enfeeble1);

    if (isReady(m_divine1, 25) && canCast(sBanish))
        return choose(PTarget, sBanish, m_divine1);

    if (PTarget->objtype == TYPE_MOB && isReady(m_status1, 60) && notHave(PTarget, EFFECT_FLASH)
        && getEnmityDifference(PAlly, (CMobEntity*)PTarget) > 3000 && canCast(sFlash))
        return choose(PTarget, sFlash, m_status1);
    return false;
}

bool CAllyController::combatCurilla(uint16 lvl) {
    int sBanish = lvl < 30 ? 28 : lvl < 65 ? 29 :  30;
    int sFlash = lvl < 45 ? 0 : 112;

    if (doCureRegen(lvl, JOB_PLD, 50, false, false))
        return true;

    if (PAlly->StatusEffectContainer->HasStatusEffect(EFFECT_DIVINE_EMBLEM) && isReady(m_divine1, 60) && canCast(sBanish))
        return choose(PTarget, sBanish, m_divine1);

    if (notHave(PTarget, EFFECT_FLASH) && isReady(m_divine2, 60) && canCast(sFlash))
        return choose(PTarget, sFlash, m_divine2);

    return false;
}



bool CAllyController::combatCherukiki(uint16 lvl) {
//    int sCure = lvl < 11 ? 1 : lvl < 21 ? 2 : lvl < 41 ? 3 : lvl < 61 ? 4 : 5; // Cure III or Cure IV
    int sParalyze = lvl < 8 ? 0 : 58;
    int sSlow = lvl < 8 ? 0 : 56;
    int sFlash = lvl < 45 ? 0 : 112;
    int sHaste = lvl < 40 ? 0 : 57;

    if (doCureRegen(lvl, JOB_WHM, 50, true, true)) {
        if (lastTarget != nullptr && lastTarget->GetHPP() <= 35 && isReady(m_ability1, 300))
            useJobAbility(PAlly, ABILITY_DIVINE_SEAL, m_ability1);
        return true;
    }

    // Haste
    if (PAlly->GetMPP() > 35 && isReady(m_enhancing2,25) && canCast(sHaste)) {
        CBattleEntity *hasteTarget = rankedBuff(PAlly, EFFECT_HASTE, rankingsHaste);
        if (hasteTarget != nullptr)
            return choose(hasteTarget, sHaste, m_enhancing2);
    }

    if (isReady(m_status1, 15)) {
        bool statusRemoved = tryStatusRemoval(lvl);
        if (statusRemoved)
            return true;
    }

    if (PTarget == nullptr || PTarget->GetHPP() == 100)
        return false;

    if (isReady(m_enfeeble1, 15) && PTarget->GetHPP() > 40) {
        if (notHave(PTarget, EFFECT_PARALYSIS) && canCast(sParalyze))
            return choose(PTarget, sParalyze, m_enfeeble1);

        if (notHave(PTarget, EFFECT_SLOW) && canCast(sSlow))
            return choose(PTarget, sSlow, m_enfeeble1);
    }





    if (PTarget->objtype == TYPE_MOB && isReady(m_divine2, 60) && notHave(PTarget, EFFECT_FLASH)
            && getEnmityDifference(PAlly, (CMobEntity*)PTarget) > 3000 && canCast(sFlash))
        return choose(PTarget, sFlash, m_divine2);
    return false;
}



bool CAllyController::doCureRegen(uint16 lvl, JOBTYPE job, int threshold, bool hasRegen, bool hasEmergencyHeal) {
    int cureDelay = 30;
    int sCure = 0;
    int sRegen = 0;
    if (job == JOB_RDM) {
        cureDelay = 20;
        sCure = lvl < 3 ? 0 : lvl < 14 ? 1 : lvl < 26 ? 2 : lvl < 48 ? 3 : 4;
        sRegen = lvl < 21 ? 0 : 108;
    } else if (job == JOB_PLD) {
        cureDelay = 30;
        sCure = lvl < 5 ? 0 : lvl < 17 ? 1 : lvl < 30 ? 2 : lvl < 55 ? 3 : 4;
    } else if (job == JOB_SCH) {
        cureDelay = 15;
        sCure = lvl < 5 ? 0 : lvl < 17 ? 1 : lvl < 30 ? 2 : lvl < 55 ? 3 : 4;
        sRegen = lvl < 18 ? 0 : lvl < 37 ? 108 : lvl < 59 ? 110 : 111;
    } else if (job == JOB_WHM) {
        cureDelay = 12;
        sCure = lvl < 1 ? 0 : lvl < 11 ? 1 : lvl < 21 ? 2 : lvl < 41 ? 3 : lvl < 61 ? 4 : 5;
        sRegen = lvl < 21 ? 0 : lvl < 44 ? 108 : lvl < 66 ? 110 : 111;
    }


    if (isReady(m_heal1, cureDelay)) { // normal heal
        CBattleEntity* lowestTarget = getLowestHP(PAlly, threshold);
        if (lowestTarget != nullptr && canCast(sCure))
            return choose(lowestTarget, sCure, m_heal1);
    }
    else if (hasEmergencyHeal && isReady(m_heal2, 60)) { // emergency heal
        CBattleEntity* lowestTarget = getLowestHP(PAlly, 35); // emergency heal always at <= 35% HP
        if (lowestTarget != nullptr && canCast(sCure))
            return choose(lowestTarget, sCure, m_heal2);
    }

    // try regen if available
    if (hasRegen && canCast(sRegen) && isReady(m_enhancing1, 15)) {
        CBattleEntity* lowestTarget = getLowestHP(PAlly, 90, true);
        if (lowestTarget != nullptr)
            return choose(lowestTarget, sRegen, m_enhancing1);

    }

    return false;
}


bool CAllyController::tryStatusRemoval(uint16 lvl) {
    int sErase = lvl < 32 ? 0 : 143;
    int sPoisona = lvl < 6 ? 0 : 14;
    int sParalyna = lvl < 9 ? 0 : 15;
    int sBlindna = lvl < 14 ? 0 : 16;
    int sSilena = lvl < 20 ? 0 : 17;
    int sCursna = lvl < 29 ? 0 : 20;
    int sViruna = lvl < 34 ? 0 : 19;
    int sStona = lvl < 39 ? 0 : 18;

    // try erasing
    if (canCast(sErase)) {
        CBattleEntity* eraseTarget = getByErasable(PAlly);
        if (eraseTarget != nullptr)
            return choose(eraseTarget, sErase, m_status1);
    }

    // try healing status effects
    std::vector<std::pair<EFFECT, int> > statusHeals = {
            {EFFECT_POISON, sPoisona}, {EFFECT_BLINDNESS, sBlindna}, {EFFECT_PARALYSIS, sParalyna},
            {EFFECT_DISEASE, sViruna}, {EFFECT_PLAGUE, sViruna}, {EFFECT_PETRIFICATION, sStona},
            {EFFECT_SILENCE, sSilena}, {EFFECT_CURSE, sCursna}
    };

    for (auto const& p : statusHeals) {
        if (canCast(p.second)) {
            CBattleEntity* statusTarget = getByEffect(PAlly, p.first);
            if (statusTarget != nullptr)
                return choose(statusTarget, p.second, m_status1);
        }
    }
    return false;
}

bool CAllyController::doProtectShell(uint16 lvl, bool useRa, bool selfOnly) {
    int sProtect =  lvl < 7 ? 0 : lvl < 27 ? 43 : lvl < 47 ? 44 : lvl < 63 ? 45 : 46;
    int sShell =  lvl < 17 ? 0 : lvl < 37 ? 48 : lvl < 57 ? 49 : lvl < 68 ? 50 : 51;

    int sProtectra =  lvl < 7 ? 0 : lvl < 27 ? 125 : lvl < 47 ? 126 : lvl < 63 ? 127 : 128;
    int sShellra =  lvl < 17 ? 0 : lvl < 37 ? 130 : lvl < 57 ? 131 : lvl < 68 ? 132 : 133;

    if (isReady(m_enhancing1, 30)) {
        if (useRa) {
            float dist = distance(PAlly->loc.p, PAlly->PMaster->loc.p);
            if (dist < 20 && canCast(sProtectra) && notHave(PAlly->PMaster, EFFECT_PROTECT))
                return choose(PAlly->PMaster, sProtectra, m_enhancing1);

            if (dist < 20 && canCast(sShellra) && notHave(PAlly->PMaster, EFFECT_SHELL))
                return choose(PAlly->PMaster, sShellra, m_enhancing1);

        } else {
            if (selfOnly) {
                if (canCast(sProtect) && notHave(PAlly, EFFECT_PROTECT))
                    return choose(PAlly, sProtect, m_enhancing1);

                if (canCast(sShell) && notHave(PAlly, EFFECT_SHELL))
                    return choose(PAlly, sShell, m_enhancing1);
            } else {
                if (canCast(sProtect)) {
                    CBattleEntity* hasteTarget = rankedBuff(PAlly, EFFECT_PROTECT, rankingsProtectShell);
                    if (hasteTarget != nullptr)
                        return choose(hasteTarget, sProtect, m_enhancing1);
                }

                if (canCast(sShell)) {
                    CBattleEntity* hasteTarget = rankedBuff(PAlly, EFFECT_SHELL, rankingsProtectShell);
                    if (hasteTarget != nullptr)
                        return choose(hasteTarget, sShell, m_enhancing1);
                }
            }
        }
    }
    return false;
}




//int CAllyController::chooseNuke(int sFire, int sWater, int sAero, int sBlizzard, int sStone, int sThunder) {
//    // handle Tactical Processer
//    if (PAlly->hasAttachment(ATTACHMENT_SCANNER) && dsprand::GetRandomNumber(100) < (55 + mList.ice * 15)) {
//        int sType = 0;
//        int lowestRes = 0;
//
//        std::vector<std::pair<int, MODIFIER> > resTypes = {
//                {sFire, MOD_FIREDEF}, {sWater, MOD_WATERDEF}, {sThunder, MOD_THUNDERDEF},
//                {sBlizzard, MOD_ICEDEF}, {sAero, MOD_WINDDEF}, {sStone, MOD_EARTHDEF}
//        };
//
//        for (auto const& p : resTypes) {
//            if (PTarget->getMod(p.second) < lowestRes) {
//                sType = p.first;
//                lowestRes = PTarget->getMod(p.second);
//            }
//        }
//
//        if (sType && canCast(sType))
//            return sType;
//    }
//
//    if ((mList.earth == 2 && (mList.ice == 1 || mList.dark == 1)) && canCast(sStone))
//        return sStone;
//    if ((mList.water == 2 && (mList.ice == 1 || mList.dark == 1)) && canCast(sWater))
//        return sWater;
//    if ((mList.fire == 2 && (mList.ice == 1 || mList.dark == 1)) && canCast(sFire))
//        return sFire;
//    if ((mList.thunder == 2 && (mList.ice == 1 || mList.dark == 1)) && canCast(sThunder))
//        return sThunder;
//    if ((mList.wind == 2 && (mList.ice == 1 || mList.dark == 1)) && canCast(sAero))
//        return sAero;
//    if ((mList.ice == 3 || (mList.ice == 2 && mList.dark == 1)) && canCast(sBlizzard))
//        return sBlizzard;
//
//    // otherwise, randomly cast a spell!
//    std::vector<int> spellArray = {sStone, sWater, sFire, sThunder, sAero, sBlizzard};
//    spellArray.erase(std::remove(spellArray.begin(), spellArray.end(), 0), spellArray.end());
//    if (spellArray.size() > 0) {
//        int nukeSpell = spellArray[dsprand::GetRandomNumber(spellArray.size())];
//        if (canCast(nukeSpell))
//            return nukeSpell;
//    }
//    return 0;
//}

bool CAllyController::isReady(time_point cooldown, int delay) {
    return m_Tick >= cooldown + std::chrono::seconds(delay);
}

bool CAllyController::choose(CBattleEntity* target, uint16 spellID, time_point &recast) {
    lastTarget = target;
    recast = m_Tick;
    targid = target->targid;
    spellid = spellID;
    return true;
}


bool CAllyController::TrySpecialSkill() {
    if (m_Tick <= m_lastAbilityTick + std::chrono::seconds(5))
        return false;
    uint32 lvl = PAlly->GetMLevel();

    uint32 id = PAlly->m_PetID;
    if (id == PETID_VOLKER) {
        if (PTarget != nullptr && PTarget->GetBattleTarget()  == PAlly) {
            if (isReady(m_ability1, 60) && notHave(PAlly, EFFECT_DEFENDER))
                return useJobAbility(PAlly, ABILITY_DEFENDER, m_ability1);

            if (lvl > 50 && isReady(m_ability2, 300) && notHave(PAlly, EFFECT_RETALIATION))
                return useJobAbility(PAlly, ABILITY_RETALIATION, m_ability2);
        }
        else {
            if (isReady(m_ability1, 60) && notHave(PAlly, EFFECT_BERSERK))
                return useJobAbility(PAlly, ABILITY_BERSERK, m_ability1);

            if (lvl >= 45 && isReady(m_ability3, 300) && notHave(PAlly, EFFECT_AGGRESSOR))
                return useJobAbility(PAlly, ABILITY_AGGRESSOR, m_ability3);
        }

        if (lvl >= 35 && isReady(m_ability4, 180) && notHave(PAlly, EFFECT_WARCRY))
            return useJobAbility(PAlly, ABILITY_WARCRY, m_ability4);
    }
    else if (id == PETID_CURILLA) {
        if (lvl >= 10 && notHave(PAlly, EFFECT_DEFENDER))
            return useJobAbility(PAlly, ABILITY_DEFENDER, m_ability1);

        if (lvl >= 30 && notHave(PAlly, EFFECT_SENTINEL) && isReady(m_ability1, 300))
            return useJobAbility(PAlly, ABILITY_SENTINEL, m_ability2);

        if (lvl >= 10 && PTarget != nullptr && isReady(m_ability2, 30))
            return useJobAbility(PTarget, ABILITY_PROVOKE, m_ability3);

        if (lvl >= 20 && isReady(m_ability3, 180))
            return useJobAbility(PAlly, ABILITY_DIVINE_EMBLEM, m_ability4);

        if (lvl >= 40 && isReady(m_ability4, 180))
            return useJobAbility(PAlly, ABILITY_DIVINE_SEAL, m_ability5);

        if (lvl >= 35 && isReady(m_ability5, 300) && PTarget != nullptr && PTarget->GetBattleTarget() != nullptr
                && PTarget->GetBattleTarget() != PAlly && PTarget->GetBattleTarget()->GetHPP() <= 50)
            return useJobAbility(PTarget->GetBattleTarget(), ABILITY_COVER, m_ability6);
    }

    return false;
}

bool CAllyController::ChooseSkill() {
    return false;

}

bool CAllyController::TryTPMove() {
    int tpThreshold = 1000;
    int id = PAlly->m_PetID;
    if (id == PETID_AYAME)
        tpThreshold = 2000;

    int lvl = PAlly->GetMLevel();
    if (PTarget == nullptr || PAlly->health.tp < 1000)
        return false;



    std::vector<std::pair<int, int> > weaponskills;
    if (id == PETID_VOLKER)
        weaponskills = { {42, 68}, {40, 58}, {41, 50}, {37, 25}, {33, 1} };
    else if (id == PETID_AYAME)
        weaponskills = {{149, 35}, {148, 30}, {147, 20}, {146, 15}, {144, 1}};
    else if (id == PETID_CURILLA)
    weaponskills = { {37, 25}, {33, 1} };

    bool success =  tryWeaponskill(lvl, weaponskills, tpThreshold);
    return success;
}

bool CAllyController::tryWeaponskill(uint16 lvl, std::vector<std::pair<int, int> > weaponskills, int tpThreshold) {
    int id = 0;
    bool canSkillchain = false;
    if (weaponskills.empty())
        return false;

    for (std::pair<int,int> weaponskill : weaponskills) {
        if (lvl < weaponskill.second)
            continue;
        if (battleutils::canSkillchain(PTarget, weaponskill.first)) {
            id = weaponskill.first;
            canSkillchain = true;
            break;
        }
        if (id == 0 && dsprand::GetRandomNumber(100) < 50)
            id = weaponskill.first;
    }

    if (id == 0)
        id = weaponskills[weaponskills.size() - 1].first;

    if (PAlly->health.tp < tpThreshold && !canSkillchain)
        return false;

    if (id != 0) {
        spellid = id;
        targid = PTarget->targid;

        if (canSkillchain && PAlly->m_PetID == PETID_AYAME && isReady(m_ability1, 90))
            useJobAbility(PAlly, 47, m_ability1, 1000);

        return true;
    }
    return false;
};

bool CAllyController::TryRangedAttack() {
    if (m_rangedCooldown > 0s && m_Tick > m_LastRangedTime + (m_rangedCooldown - std::chrono::seconds(PAlly->getMod(MOD_SNAP_SHOT))))
    {
        MobSkill(PTarget->targid, m_RangedAbility);
        return true;
    }
    return false;
}


bool CAllyController::canCast(uint32 spellId) {
    if (spellId == 0)
        return false;

    CSpell* PSpell = spell::GetSpell(spellId);
    return PSpell == nullptr ? false : PAlly->health.mp > PSpell->getMPCost();
}

// utilities


