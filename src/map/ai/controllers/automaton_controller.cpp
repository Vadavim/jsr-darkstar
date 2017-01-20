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
#include "automaton_controller.h"
#include "../../entities/automatonentity.h"
#include "../../lua/luautils.h"
#include "../../mobskill.h"
#include "../../utils/battleutils.h"
#include "../../mob_spell_container.h"
#include "../ai_container.h"
#include "../helpers/ai_utils.h"
#include "../states/magic_state.h"
#include "../states/mobskill_state.h"
#include "../../spell.h"
#include "../../../common/utils.h"
#include "../helpers/ai_utils.h"
using namespace aiutils;


//std::map<JOBTYPE, uint16> rankingsHaste = {
//        {JOB_NIN, 30}, {JOB_DNC, 29}, {JOB_WAR, 28}, {JOB_MNK, 27}, {JOB_DRG, 26}, {JOB_SAM, 25}, {JOB_DRK, 24},
//        {JOB_RUN, 23}, {JOB_PLD, 22}, {JOB_THF, 21}, {JOB_PUP, 20}, {JOB_BST, 19}, {JOB_BLU, 18},
//        {JOB_COR, 17}, {JOB_RNG, 16}
//};
//
//std::map<JOBTYPE, uint16> rankingsRefresh = {
//        {JOB_WHM, 30}, {JOB_BLM, 29}, {JOB_SCH, 28}, {JOB_GEO, 27}, {JOB_BLU, 26}, {JOB_PLD, 25}, {JOB_DRK, 24}
//};
//
//std::map<JOBTYPE, uint16> rankingsFlurry = {
//        {JOB_RNG, 10}, {JOB_COR, 9}
//};


CAutomatonController::CAutomatonController(CAutomatonEntity* PPet) : CPetController(PPet),
    PAutomaton(PPet)
{
    PPet->setInitialBurden();
    uint16 targId = 0;
    uint16 spellId = 0;
    if (PPet->getFrame() == FRAME_SHARPSHOT)
    {
        PPet->m_Behaviour |= BEHAVIOUR_STANDBACK;
        switch (PPet->getHead())
        {
            case HEAD_SHARPSHOT:
                m_rangedCooldown = 20s;
                break;
            case HEAD_HARLEQUIN:
                m_rangedCooldown = 25s;
                break;
            default:
                m_rangedCooldown = 36s;
        }
    }
}
void CAutomatonController::DoRoamTick(time_point tick) {
    if (PAutomaton->PMaster == nullptr || PAutomaton->PMaster->isDead()) {
        PAutomaton->Die();
        return;
    }

    //automaton healing
    if (PetIsHealing()) {
        return;
    }

    AUTOHEADTYPE   head = PAutomaton->getHead();
    AUTOFRAMETYPE  frame = PAutomaton->getFrame();
    mList = PAutomaton->PMaster->StatusEffectContainer->GetManeuverList();
    int skill = PAutomaton->PMaster->GetSkill(SKILL_AMA);
    bool success = false;
    useStatusRecast = false;
    useEnfeebleRecast = false;

    if (head == HEAD_STORMWAKER && frame == FRAME_STORMWAKER && roamStormStorm(skill)) {
        success = true;
    } else if (head == HEAD_SOULSOOTHER && frame == FRAME_STORMWAKER && roamStormSoul(skill)) {
        success = true;
    } else if (head == HEAD_HARLEQUIN && frame == FRAME_HARLEQUIN && roamHarlHarl(skill)) {
        success = true;
    }

    if (success) {
        CSpell* spell = spell::GetSpell(spellid);
        m_universalTick = m_Tick;
        Cast(targid, spellid);
    }



    float currentDistance = distance(PAutomaton->loc.p, PAutomaton->PMaster->loc.p);

    if (currentDistance > PetRoamDistance)
    {
        if (currentDistance < 35.0f && PAutomaton->PAI->PathFind->PathAround(PAutomaton->PMaster->loc.p, 2.0f, PATHFLAG_RUN | PATHFLAG_WALLHACK))
        {
            PAutomaton->PAI->PathFind->FollowPath();
        }
        else if (PAutomaton->GetSpeed() > 0)
        {
            PAutomaton->PAI->PathFind->WarpTo(PAutomaton->PMaster->loc.p, PetRoamDistance);
        }
    }

}

void CAutomatonController::DoCombatTick(time_point tick)
{
    PTarget = static_cast<CBattleEntity*>(PAutomaton->GetEntity(PAutomaton->GetBattleTargetID()));
    if (PAutomaton->PMaster == nullptr || PAutomaton->PMaster->isDead()) {
        PAutomaton->Die();
        return;
    }

    if (TryDeaggro()) {
        Disengage();
        return;
    }
    int uDelay = PAutomaton->hasAttachment(ATTACHMENT_TACTICAL_PROCESSOR) ? PAutomaton->m_universalDelay - 3 : PAutomaton->m_universalDelay;
    if (isReady(m_universalTick, uDelay) && TrySpellcast(tick)) {
        return;
    }
    else if (TrySpecialSkill()) {
        return;
    }
    else if (TryTPMove()) {
        //TODO: check if automaton WS have activation times (don't think so)
        return;
    }
    else if (TryRangedAttack()) {
        //TODO: set ID to ranged attack
        m_LastRangedTime = m_Tick;
        return;
    }
    Move();
}

bool CAutomatonController::TrySpellcast(time_point tick) {
    AUTOFRAMETYPE frame = PAutomaton->getFrame();
    if (frame == FRAME_VALOREDGE || frame == FRAME_SHARPSHOT)
        return false;

    AUTOHEADTYPE head = PAutomaton->getHead();
    int skill = PAutomaton->PMaster->GetSkill(SKILL_AMA);
    mList = PAutomaton->PMaster->StatusEffectContainer->GetManeuverList();
    useStatusRecast = false;
    bool success = false;

    if (frame == FRAME_STORMWAKER && head == HEAD_STORMWAKER && combatStormStorm(skill)) {
        success = true;
    } else if (frame == FRAME_STORMWAKER && head == HEAD_SPIRITREAVER && combatStormSpirit(skill)) {
        success = true;
    } else if (frame == FRAME_STORMWAKER && head == HEAD_SOULSOOTHER && combatStormSoul(skill)) {
        success = true;
    } else if (frame == FRAME_HARLEQUIN && head == HEAD_HARLEQUIN && combatHarlHarl(skill)) {
        success = true;
    }

    if (success) {
        CSpell* spell = spell::GetSpell(spellid);
        m_universalTick = m_Tick;
        Cast(targid, spellid);
    }
    return success;

}


bool CAutomatonController::combatHarlHarl(int mS) {
    int sDia =        mS < 96 ? 23 : 24; // Dia I or Dia II
//    int sSlow =       mS < 42 ? 0 : 56;
//    int sParalyze =   mS < 21 ? 0 : 58;
    int sSilence =   mS < 57 ? 0 : 59;
    int sPoison =     mS < 18 ? 0 : mS < 141 ? 220 : 221;
    int sRegen = mS < 60 ? 0 : mS < 100 ? 108 : mS < 180 ? 110 : mS < 240 ? 111 : 477;
    int sHaste = mS < 100 ? 0 : 57;
    int sGain = mS < 80 ? 0 : 486; // Gain Strength
    int sDistract = mS < 96 ? 0 : mS < 190 ? 841 : 842; // Distract I and II
    int sInundation = mS < 165 ? 0 : 879;


    CBattleEntity* master = PAutomaton->PMaster;
    CBattleEntity* target = PAutomaton->GetBattleTarget();
    int manaMod = PAutomaton->hasAttachment(ATTACHMENT_MANA_BOOSTER) ? -1 * (2 + mList.ice * 2) : 0;


    // try regen next
    if (isReady(m_enhanceTick, PAutomaton->m_enhanceDelay + manaMod)) {
        if (canCast(sRegen) && notHave(master, EFFECT_REGEN) && master->GetHPP() <= 85)
            return choose(master, sRegen, m_healTick);
        if (canCast(sRegen) && notHave(PAutomaton, EFFECT_REGEN) && PAutomaton->GetHPP() <= 85)
            return choose(PAutomaton, sRegen, m_healTick);
    }


    // try to enfeeble
    int levelDiff = PTarget->GetMLevel() - PAutomaton->GetMLevel();


    if (isReady(m_enfeebleTick, PAutomaton->m_enfeebleDelay + manaMod) && PTarget != nullptr && levelDiff >= 2) {
        bool b75 = (PTarget->GetHPP() >= 75);
        bool b50 = (PTarget->GetHPP() >= 50);
        bool b25 = (PTarget->GetHPP() >= 25);

        if (b25 && isCaster(PTarget) && canCast(sSilence) && notHave(PTarget, EFFECT_SILENCE))
            return choose(target, sSilence, m_enfeebleTick);

        if (b50 && canCast(sDia) && mList.light >= 1 && notHave(PTarget, EFFECT_DIA) && notHave(PTarget, EFFECT_BIO))
            return choose(target, sDia, m_enfeebleTick);


        if (b50 && canCast(sPoison) && mList.water >= 1 && notHave(PTarget, EFFECT_POISON))
            return choose(target, sPoison, m_enfeebleTick);

        if (b50 && canCast(sDistract) && mList.ice >= 1 && notHave(PTarget, EFFECT_EVASION_DOWN))
            return choose(target, sDistract, m_enfeebleTick);

    }

    if (isReady(m_nukeTick, PAutomaton->m_nukeDelay + 30 + manaMod) && PTarget != nullptr && levelDiff >= 0) {
        if (canCast(sInundation) && notHave(PTarget, EFFECT_CHAINBOUND))
            return choose(target, sInundation, m_nukeTick);
    }


    if (isReady(m_enhanceTick, PAutomaton->m_enhanceDelay + manaMod)) {
        if (canCast(sHaste) && notHave(master, EFFECT_HASTE))
            return choose(master, sHaste, m_enhanceTick);
        if (canCast(sHaste) && notHave(PAutomaton, EFFECT_HASTE))
            return choose(PAutomaton, sHaste, m_enhanceTick);
        if (canCast(sGain) && notHave(master, EFFECT_STR_BOOST))
            return choose(master, sGain, m_enhanceTick);
        if (canCast(sGain) && notHave(PAutomaton, EFFECT_STR_BOOST))
            return choose(PAutomaton, sGain, m_enhanceTick);
    }

    return false;
}


bool CAutomatonController::roamHarlHarl(int mS) {

    int sRegen = mS < 60 ? 0 : mS < 100 ? 108 : mS < 180 ? 110 : mS < 240 ? 111 : 477;
    int sHaste = mS < 100 ? 0 : 57;
    int sGain = mS < 80 ? 0 : 486; // Gain Strength
    CBattleEntity* master = PAutomaton->PMaster;
    int manaMod = PAutomaton->hasAttachment(ATTACHMENT_MANA_BOOSTER) ? -1 * (2 + mList.ice * 2) : 0;

    // try regen next
    if (isReady(m_enhanceTick, PAutomaton->m_enhanceDelay + manaMod)) {
        if (canCast(sRegen) && notHave(master, EFFECT_REGEN) && master->GetHPP() <= 85)
            return choose(master, sRegen, m_healTick);
        if (canCast(sRegen) && notHave(PAutomaton, EFFECT_REGEN) && PAutomaton->GetHPP() <= 85)
            return choose(PAutomaton, sRegen, m_healTick);
    }

    if (isReady(m_enhanceTick, PAutomaton->m_enhanceDelay + manaMod)) {
        if (canCast(sHaste) && notHave(master, EFFECT_HASTE))
            return choose(master, sHaste, m_enhanceTick);
        if (canCast(sHaste) && notHave(PAutomaton, EFFECT_HASTE))
            return choose(PAutomaton, sHaste, m_enhanceTick);
        if (canCast(sGain) && notHave(master, EFFECT_STR_BOOST))
            return choose(master, sGain, m_enhanceTick);
        if (canCast(sGain) && notHave(PAutomaton, EFFECT_STR_BOOST))
            return choose(PAutomaton, sGain, m_enhanceTick);
    }


    return false;
}


bool CAutomatonController::roamStormStorm(int mS) {

    int secondCure = mS < 45 ? 0 : mS < 81 ? 1 : mS < 147 ? 2 : 3;
    int sRefresh = mS < 144 ? 0 : mS < 240 ? 109 : 473;
    int sStoneskin = mS < 105 ? 0 : 54;
    int sBlink = mS < 70 ? 0 : 53;
    int sPhalanx = mS < 99 ? 0 : 106;
    int sProtect = mS < 24 ? 0 : mS < 70 ? 43 : mS < 120 ? 44 : mS < 190 ? 45 : mS < 240 ? 46 : 47;
    int sShell = mS < 36 ? 0 : mS < 80 ? 48 : mS < 140 ? 49 : mS < 190 ? 50 : mS < 240 ? 51 : 52;
    int sErase = mS < 99 ? 0 : 143;
    CBattleEntity* master = PAutomaton->PMaster;

    if (isReady(m_healTick, PAutomaton->m_healDelay)) {
        if (master->GetHPP() <= 85 && canCast(secondCure))
            return choose(master, secondCure, m_healTick);
        if (PAutomaton->GetHPP() <= 85 && canCast(secondCure))
            return choose(PAutomaton, secondCure, m_healTick);
    }

    if (isReady(m_statusTick, PAutomaton->m_statusDelay)) {
        if (master->StatusEffectContainer->HasStatusEffectByFlag(EFFECTFLAG_ERASABLE) && canCast(sErase)) {
            return choose(master, sErase, m_statusTick);
        }
        if (PAutomaton->StatusEffectContainer->HasStatusEffectByFlag(EFFECTFLAG_ERASABLE) && canCast(sErase)) {
            return choose(PAutomaton, sErase, m_statusTick);
        }

    }

    if (isReady(m_enhanceTick, PAutomaton->m_enhanceDelay)) {
        if (PAutomaton->GetMPP() < 95 && notHave(PAutomaton, EFFECT_REFRESH) && canCast(sRefresh))
            return choose(PAutomaton, sRefresh, m_enhanceTick);
        if (master->GetMPP() < 80 && master->health.mp != 0 && notHave(master, EFFECT_REFRESH) && canCast(sRefresh))
            return choose(master, sRefresh, m_enhanceTick);

        if (notHave(master, EFFECT_PROTECT) && canCast(sProtect))
            return choose(master, sProtect, m_enhanceTick);

        if (notHave(PAutomaton, EFFECT_PROTECT) && canCast(sProtect))
            return choose(PAutomaton, sProtect, m_enhanceTick);

        if (notHave(master, EFFECT_SHELL) && canCast(sShell))
            return choose(master, sShell, m_enhanceTick);

        if (notHave(PAutomaton, EFFECT_SHELL) && canCast(sShell))
            return choose(PAutomaton, sShell, m_enhanceTick);

        if (mList.earth >= 1 && notHave(PAutomaton, EFFECT_STONESKIN) && canCast(sStoneskin) && PAutomaton->GetMPP() >= 50)
            return choose(PAutomaton, sStoneskin, m_enhanceTick);

        if (mList.wind >= 1 && notHave(PAutomaton, EFFECT_BLINK) && canCast(sStoneskin) && PAutomaton->GetMPP() >= 50)
            return choose(PAutomaton, sBlink, m_enhanceTick);

        if (mList.light >= 2 && notHave(PAutomaton, EFFECT_PHALANX) && canCast(sPhalanx) && PAutomaton->GetMPP() >= 50)
            return choose(PAutomaton, sPhalanx, m_enhanceTick);

    }


    return false;
}


bool CAutomatonController::combatStormStorm(int mS) {
    int primaryCure = mS < 12 ? 0 : mS < 45 ? 1 : mS < 81 ? 2 : mS < 147 ? 3 : 4; // Cure III or Cure IV

    int secondCure  = mS < 45 ? 0 : mS < 81 ? 1 : mS < 147 ? 2 : 3;
    int sDia =        mS < 96 ? 23 : 24; // Dia I or Dia II
    int sBlind =      mS < 27 ? 0 : 254; // Blind
    int sBio =        mS < 33 ? 0 : mS < 111 ? 230 : 231;
    int sSlow =       mS < 42 ? 0 : 56;
    int sDispel =     mS < 105 ? 0 : 260;
    int sParalyze =   mS < 21 ? 0 : 58;
    int sSilence =   mS < 57 ? 0 : 59;
    int sRefresh =   mS < 144 ? 0 : mS < 240 ? 109 : 473;
    int sPoison =     mS < 18 ? 0 : mS < 141 ? 220 : 221;

    int sStone = mS < 15 ? 0 : mS < 108 ? 159 : mS < 227 ? 160 : mS < 266 ? 161 : 162;
    int sAero = mS < 45 ? 0 : mS < 138 ? 154 : mS < 246 ? 155 : mS < 276 ? 156 : 157;
    int sWater = mS < 30 ? 0 : mS < 123 ? 169 : mS < 236 ? 170 : mS < 271 ? 171 : 172;
    int sFire = mS < 60 ? 0 : mS < 153 ? 144 : mS < 251 ? 145 : mS < 281 ? 146 : 147;
    int sBlizzard = mS < 75 ? 0 : mS < 178 ? 149 : mS < 256 ? 150 : mS < 286 ? 151 : 152;
    int sThunder = mS < 90 ? 0 : mS < 203 ? 164 : mS < 261 ? 165 : mS < 291 ? 166 : 167;
    int sStoneskin = mS < 105 ? 0 : 54;
    int sErase = mS < 99 ? 0 : 143;

    CBattleEntity* master = PAutomaton->PMaster;
    CBattleEntity* target = PAutomaton->GetBattleTarget();
    int manaMod = PAutomaton->hasAttachment(ATTACHMENT_MANA_BOOSTER) ? -1 * (2 + mList.ice * 2) : 0;

    // try healing first
    if (isReady(m_healTick, PAutomaton->m_healDelay + manaMod)) {
        int healThresh = mList.light == 1 ? 40 : mList.light == 2 ? 50 : mList.light == 3 ? 75 : 30;
        if (PAutomaton->hasAttachment(ATTACHMENT_DAMAGE_GAUGE))
                    healThresh += mList.light == 1 ? 30 : mList.light == 2 ? 30 : mList.light == 3 ? 15 : 20;

        if (master->GetHPP() < healThresh + mList.light * 5 && canCast(primaryCure)) {
            return choose(master, primaryCure, m_healTick);

        } else if (PAutomaton->GetHPP() < healThresh && canCast(primaryCure)) {
            return choose((CBattleEntity*)PAutomaton->PMaster->PPet, primaryCure, m_healTick);
        }
    }


    if (isReady(m_statusTick, PAutomaton->m_statusDelay + manaMod) && PTarget != nullptr) {
        // try dispelling
        if (mList.dark >= 1 && PTarget->StatusEffectContainer->HasStatusEffectByFlag(EFFECTFLAG_DISPELABLE) && canCast(sDispel)) {
            return choose(PTarget, sDispel, m_darkTick);
        }


        // try erasing
        if (mList.light >= 1 && master->StatusEffectContainer->HasStatusEffectByFlag(EFFECTFLAG_ERASABLE) && canCast(sErase)) {
            return choose(master, sErase, m_statusTick);
        }

        if (mList.light >= 1 && PAutomaton->StatusEffectContainer->HasStatusEffectByFlag(EFFECTFLAG_ERASABLE) && canCast(sErase)) {
            return choose(PAutomaton, sErase, m_statusTick);
        }

    }

    // prioritize nuking if two ice
    if (mList.ice >= 2 && isReady(m_nukeTick, PAutomaton->m_nukeDelay + manaMod) && PTarget != nullptr) {
        int sNuke = chooseNuke(sFire, sWater, sAero, sBlizzard, sStone, sThunder);
        if (sNuke) {
            return choose(target, sNuke, m_nukeTick);
        }
    }

    // try to enfeeble
    if (isReady(m_enfeebleTick, PAutomaton->m_enfeebleDelay + manaMod) && PTarget != nullptr) {
        bool b75 = (PTarget->GetHPP() >= 75);
        bool b50 = (PTarget->GetHPP() >= 50);
        bool b25 = (PTarget->GetHPP() >= 25);

        if (((b50 && mList.wind >= 1 ) || (b25 && mList.wind >= 2)) && isCaster(PTarget)
                    && canCast(sSilence) && notHave(PTarget, EFFECT_SILENCE))
            return choose(target, sSilence, m_enfeebleTick);

        if (b75 && canCast(sDia) && mList.light >= 1 && notHave(PTarget, EFFECT_DIA) && notHave(PTarget, EFFECT_BIO))
            return choose(target, sDia, m_enfeebleTick);

        if ((b75 || (b50 && mList.dark > 2)) && canCast(sBio) && notHave(PTarget, EFFECT_BIO) && notHave(PTarget, EFFECT_DIA))
            return choose(target, sBio, m_enfeebleTick);

        if ((b75 || (b50 && mList.water > 2)) && canCast(sPoison) && notHave(PTarget, EFFECT_POISON))
            return choose(target, sPoison, m_enfeebleTick);

        if ((b75 || (b50 && mList.ice > 2)) && canCast(sParalyze) && notHave(PTarget, EFFECT_PARALYSIS))
            return choose(target, sParalyze, m_enfeebleTick);

        if ((b75 || (b50 && mList.earth > 2)) && canCast(sSlow) && notHave(PTarget, EFFECT_SLOW))
            return choose(target, sSlow, m_enfeebleTick);

        if ((b75 || (b50 && mList.dark > 2)) && canCast(sBlind) && notHave(PTarget, EFFECT_BLINDNESS))
            return choose(target, sBlind, m_enfeebleTick);

    }

    if (isReady(m_enhanceTick, PAutomaton->m_enhanceDelay + manaMod)) {
        int mpThresh = mList.dark == 1 ? 25 : mList.dark == 2 ? 35 : mList.dark == 3 ? 45 : 15;
        if (PAutomaton->hasAttachment(ATTACHMENT_DAMAGE_GAUGE))
            mpThresh += 35;
        if (PAutomaton->GetMPP() < mpThresh && notHave(PAutomaton, EFFECT_REFRESH) && canCast(sRefresh))
            return choose(PAutomaton, sRefresh, m_enhanceTick);
        if (master->GetMPP() < mpThresh && master->health.mp != 0 && notHave(master, EFFECT_REFRESH) && canCast(sRefresh))
            return choose(master, sRefresh, m_enhanceTick);

        if (mList.earth >= 1 && notHave(PAutomaton, EFFECT_STONESKIN) && canCast(sStoneskin) && dsprand::GetRandomNumber(100) < 30 + mList.earth * 20)
            return choose(PAutomaton, sStoneskin, m_enhanceTick);

    }

    if (isReady(m_nukeTick, PAutomaton->m_nukeDelay + manaMod) && PTarget != nullptr) {
        int sNuke = chooseNuke(sFire, sWater, sAero, sBlizzard, sStone, sThunder);
        if (sNuke) {
            return choose(target, sNuke, m_nukeTick);
        }
    }

    return false;
}



bool CAutomatonController::roamStormSoul(int mS) {

    int primaryCure = mS < 12 ? 0 : mS < 45 ? 1 : mS < 81 ? 2 : mS < 147 ? 3 : mS < 207 ? 4 : 5;
    int sProtect = mS < 24 ? 0 : mS < 70 ? 125 : mS < 120 ? 126 : mS < 190 ? 127 : mS < 240 ? 128 : 129;
    int sShell = mS < 36 ? 0 : mS < 80 ? 130 : mS < 140 ? 131 : mS < 190 ? 132 : mS < 240 ? 133 : 134;
    int sErase = mS < 99 ? 0 : 143;
    int sPoisona = mS < 27 ? 0 : 14;
    int sParalyna = mS < 36 ? 0 : 15;
    int sBlindna = mS < 45 ? 0 : 16;
    int sSilena = mS < 60 ? 0 : 17;
    int sCursna = mS < 90 ? 0 : 20;
    int sViruna = mS < 105 ? 0 : 19;
    int sStona = mS < 120 ? 0 : 18;
    int sRaise = mS < 78 ? 0 : mS < 182 ? 12 :mS < 251 ? 13 : 140;
    int sRegen = mS < 66 ? 0 : mS < 114 ? 108 : mS < 200 ? 110 : mS < 265 ? 111 : 477;
    int sHaste = mS < 147 ? 0 : 57; // Haste
    int sFlurry = mS < 147 ? 0 : 845; // Flurry

    CBattleEntity* master = PAutomaton->PMaster;
    int manaMod = PAutomaton->hasAttachment(ATTACHMENT_MANA_BOOSTER) ? -1 * (2 + mList.ice * 2) : 0;

    // try healing first
    if (isReady(m_healTick, PAutomaton->m_healDelay + manaMod)) {
        int healThresh = mList.light == 1 ? 40 : mList.light == 2 ? 50 : mList.light == 3 ? 75 : 30;
        if (PAutomaton->hasAttachment(ATTACHMENT_DAMAGE_GAUGE))
            healThresh += mList.light == 1 ? 30 : mList.light == 2 ? 30 : mList.light == 3 ? 15 : 20;

        CBattleEntity* lowestTarget = getLowestHP(PAutomaton, healThresh);
        if (lowestTarget != nullptr && canCast(primaryCure))
            return choose(lowestTarget, primaryCure, m_healTick);
    }

    // try regen next
    if (isReady(m_enhanceTick, PAutomaton->m_enhanceDelay + manaMod)) {
        CBattleEntity* lowestTarget = getLowestHP(PAutomaton, 85, true);
        if (lowestTarget != nullptr && canCast(sRegen))
            return choose(lowestTarget, sRegen, m_enhanceTick);
    }


    if (isReady(m_statusTick, PAutomaton->m_statusDelay + manaMod)) {

        // try erasing
        if (canCast(sErase)) {
            CBattleEntity* eraseTarget = getByErasable(PAutomaton);
            if (eraseTarget != nullptr)
                return choose(eraseTarget, sErase, m_statusTick);
        }

        // try healing status effects
        std::vector<std::pair<EFFECT, int> > statusHeals = {
                {EFFECT_POISON, sPoisona}, {EFFECT_BLINDNESS, sBlindna}, {EFFECT_PARALYSIS, sParalyna},
                {EFFECT_DISEASE, sViruna}, {EFFECT_PLAGUE, sViruna}, {EFFECT_PETRIFICATION, sStona},
                {EFFECT_SILENCE, sSilena}, {EFFECT_CURSE, sCursna}
        };

        for (auto const& p : statusHeals) {
            if (canCast(p.second)) {
                CBattleEntity* statusTarget = getByEffect(PAutomaton, p.first);
                if (statusTarget != nullptr)
                    return choose(statusTarget, p.second, m_statusTick);
            }
        }

    }

    // try raising!
    if (isReady(m_healTick, PAutomaton->m_healDelay + manaMod)) {
        if (canCast(sRaise)) {
            CBattleEntity* dead = getByEffect(PAutomaton, EFFECT_KO);
            if  (dead != nullptr)
                return choose(dead, sRaise, m_healTick);
        }
    }


    if (isReady(m_enhanceTick, PAutomaton->m_enhanceDelay + manaMod)) {
        // Protectra
        if (canCast(sProtect) && notHave(master, EFFECT_PROTECT)) {
            return choose(master, sProtect, m_enhanceTick);
        }

        // Shellra
        if (canCast(sShell) && notHave(master, EFFECT_SHELL)) {
            return choose(master, sShell, m_enhanceTick);
        }


        // Haste
        if (canCast(sHaste) && mList.wind >= 1) {
            CBattleEntity* hasteTarget = rankedBuff(PAutomaton, EFFECT_HASTE, rankingsHaste);
            if (hasteTarget != nullptr)
                return choose(hasteTarget, sHaste, m_enhanceTick);
        }

        // Flurry
        if (canCast(sFlurry) && mList.wind >= 1) {
            CBattleEntity* hasteTarget = rankedBuff(PAutomaton, EFFECT_FLURRY, rankingsFlurry);
            if (hasteTarget != nullptr)
                return choose(hasteTarget, sFlurry, m_enhanceTick);
        }

    }



    return false;
}


bool CAutomatonController::combatStormSoul(int mS) {
    int primaryCure = mS < 12 ? 0 : mS < 45 ? 1 : mS < 81 ? 2 : mS < 147 ? 3 : mS < 207 ? 4 : 5;

    int secondCure  = mS < 45 ? 0 : mS < 81 ? 1 : mS < 147 ? 2 : 3;
    int sDia =        mS < 96 ? 23 : 24; // Dia I or Dia II
    int sSlow =       mS < 42 ? 0 : 56;
    int sParalyze =   mS < 21 ? 0 : 58;
    int sSilence =   mS < 57 ? 0 : 59;

    int sRegen = mS < 66 ? 0 : mS < 114 ? 108 : mS < 200 ? 110 : mS < 265 ? 111 : 477;
    int sHaste = mS < 147 ? 0 : 57; // Haste
    int sFlurry = mS < 147 ? 0 : 845; // Flurry
    int sErase = mS < 99 ? 0 : 106;
    int sPoisona = mS < 27 ? 0 : 14;
    int sParalyna = mS < 36 ? 0 : 15;
    int sBlindna = mS < 45 ? 0 : 16;
    int sSilena = mS < 60 ? 0 : 17;
    int sCursna = mS < 90 ? 0 : 20;
    int sViruna = mS < 105 ? 0 : 19;
    int sStona = mS < 120 ? 0 : 18;


    CBattleEntity* master = PAutomaton->PMaster;
    CBattleEntity* target = PAutomaton->GetBattleTarget();
    int manaMod = PAutomaton->hasAttachment(ATTACHMENT_MANA_BOOSTER) ? -1 * (2 + mList.ice * 2) : 0;

    // try healing first
    if (isReady(m_healTick, PAutomaton->m_healDelay + manaMod)) {
        int healThresh = mList.light == 1 ? 40 : mList.light == 2 ? 50 : mList.light == 3 ? 75 : 30;
        if (PAutomaton->hasAttachment(ATTACHMENT_DAMAGE_GAUGE))
            healThresh += mList.light == 1 ? 30 : mList.light == 2 ? 30 : mList.light == 3 ? 15 : 20;

        CBattleEntity* lowestTarget = getLowestHP(PAutomaton, healThresh);
        if (lowestTarget != nullptr && canCast(primaryCure))
            return choose(lowestTarget, primaryCure, m_healTick);
    }

    // try regen next
    if (isReady(m_enhanceTick, PAutomaton->m_enhanceDelay + manaMod)) {
        CBattleEntity* lowestTarget = getLowestHP(PAutomaton, 85, true);
        if (lowestTarget != nullptr && canCast(sRegen))
            return choose(lowestTarget, sRegen, m_enhanceTick);
    }



    if (isReady(m_statusTick, PAutomaton->m_statusDelay + manaMod)) {

        // try erasing
        if (canCast(sErase)) {
            CBattleEntity* eraseTarget = getByErasable(PAutomaton);
            if (eraseTarget != nullptr)
                return choose(eraseTarget, sErase, m_statusTick);
        }

        // try healing status effects
        std::vector<std::pair<EFFECT, int> > statusHeals = {
                {EFFECT_POISON, sPoisona}, {EFFECT_BLINDNESS, sBlindna}, {EFFECT_PARALYSIS, sParalyna},
                {EFFECT_DISEASE, sViruna}, {EFFECT_PLAGUE, sViruna}, {EFFECT_PETRIFICATION, sStona},
                {EFFECT_SILENCE, sSilena}, {EFFECT_CURSE, sCursna}
        };

        for (auto const& p : statusHeals) {
            if (canCast(p.second)) {
                CBattleEntity* statusTarget = getByEffect(PAutomaton, p.first);
                if (statusTarget != nullptr)
                    return choose(statusTarget, p.second, m_statusTick);
            }
        }

    }



    // try to enfeeble
    if (isReady(m_enfeebleTick, PAutomaton->m_enfeebleDelay + manaMod) && PTarget != nullptr) {
        bool b75 = (PTarget->GetHPP() >= 75);
        bool b50 = (PTarget->GetHPP() >= 50);
        bool b25 = (PTarget->GetHPP() >= 25);

        if (b75 && canCast(sDia) && mList.light >= 1 && notHave(PTarget, EFFECT_DIA) && notHave(PTarget, EFFECT_BIO))
            return choose(target, sDia, m_enfeebleTick);

        if ((b75 || (b50 && mList.ice > 2)) && canCast(sParalyze) && notHave(PTarget, EFFECT_PARALYSIS))
            return choose(target, sParalyze, m_enfeebleTick);

        if ((b75 || (b50 && mList.earth > 2)) && canCast(sSlow) && notHave(PTarget, EFFECT_SLOW))
            return choose(target, sSlow, m_enfeebleTick);

    }

    if (isReady(m_enhanceTick, PAutomaton->m_enhanceDelay + manaMod)) {
        // Haste
        if (canCast(sHaste)) {
            CBattleEntity* hasteTarget = rankedBuff(PAutomaton, EFFECT_HASTE, rankingsHaste);
            if (hasteTarget != nullptr)
                return choose(hasteTarget, sHaste, m_enhanceTick);
        }

        // Flurry
        if (canCast(sFlurry)) {
            CBattleEntity* hasteTarget = rankedBuff(PAutomaton, EFFECT_FLURRY, rankingsFlurry);
            if (hasteTarget != nullptr)
                return choose(hasteTarget, sFlurry, m_enhanceTick);
        }

    }

    return false;
}




bool CAutomatonController::combatStormSpirit(int mS) {

    int sStone = mS < 12 ? 0 : mS < 81 ? 159 : mS < 157 ? 160 : mS < 241 ? 161 : 162;
    int sAero = mS < 30 ? 0 : mS < 105 ? 154 : mS < 200 ? 155 : mS < 261 ? 156 : 157;
    int sWater = mS < 18 ? 0 : mS < 93 ? 169 : mS < 178 ? 170 : mS < 251 ? 171 : 172;
    int sFire = mS < 42 ? 0 : mS < 117 ? 144 : mS < 212 ? 145 : mS < 266 ? 146 : 147;
    int sBlizzard = mS < 54 ? 0 : mS < 129 ? 149 : mS < 217 ? 150 : mS < 271 ? 151 : 152;
    int sThunder = mS < 63 ? 0 : mS < 141 ? 164 : mS < 227 ? 165 : mS < 276 ? 166 : 167;

    int sDrain =     mS < 45 ? 0 : 245;
    int sAspir =     mS < 78 ? 0 : mS < 251 ? 247 : 248;
    int sDread =     mS < 256 ? 0 : 277;
    int sBurn =     mS < 75 ? 0 : 235;
    int sFrost =     mS < 69 ? 0 : 236;
    int sChoke =     mS < 63 ? 0 : 237;
    int sRasp =     mS < 57 ? 0 : 238;
    int sShock =     mS < 51 ? 0 : 239;
    int sDrown =     mS < 84 ? 0 : 240;
    int sAbsorbInt = mS < 120 ? 0 : 270;

    CBattleEntity* master = PAutomaton->PMaster;
    CBattleEntity* target = PAutomaton->GetBattleTarget();
    int manaMod = PAutomaton->hasAttachment(ATTACHMENT_MANA_BOOSTER) ? -1 * (2 + mList.ice * 2) : 0;

    // priioritize nuking if two ice
    if (mList.ice >= 2 && isReady(m_nukeTick, PAutomaton->m_nukeDelay + manaMod) && PTarget != nullptr) {
        int sNuke = chooseNuke(sFire, sWater, sAero, sBlizzard, sStone, sThunder);
        if (sNuke) {
            return choose(target, sNuke, m_nukeTick);
        }
    }


    if (isReady(m_statusTick, PAutomaton->m_statusDelay + manaMod) && PTarget != nullptr) {
        // if I'm being attacked, try Dread Spikes
        if (canCast(sDread) &&  PTarget->GetBattleTarget() == PAutomaton) {
            return choose (PAutomaton, sDread, m_statusTick);
        }
    }


    if (isReady(m_darkTick, PAutomaton->m_darkDelay + manaMod) && PTarget != nullptr) {
        if (PAutomaton->GetMPP() <= 75 && PTarget->health.mp > 25 && canCast(sAspir))
            return choose(PTarget, sAspir, m_darkTick);

    }

    if (isReady(m_healTick, PAutomaton->m_healDelay + manaMod) && PTarget != nullptr) {
        if (PAutomaton->GetHPP() <= 75 && canCast(sDrain))
            return choose(PTarget, sDrain, m_healTick);
    }

    if (isReady(m_enfeebleTick, PAutomaton->m_enfeebleDelay + manaMod) && PTarget != nullptr) {
        if (mList.fire >= 1 && PTarget->GetHPP() >= 50 && canCast(sBurn) && notHave(PTarget, EFFECT_FROST)
            && notHave(PTarget, EFFECT_BURN) && notHave(PTarget, EFFECT_DROWN) && PTarget->getMod(MOD_FIREDEF) <= 10)
            return choose(PTarget, sBurn, m_enfeebleTick);

        if (mList.wind >= 1 && PTarget->GetHPP() >= 50 && canCast(sChoke) && notHave(PTarget, EFFECT_FROST)
            && notHave(PTarget, EFFECT_CHOKE) && notHave(PTarget, EFFECT_RASP) && PTarget->getMod(MOD_WINDDEF) <= 10)
            return choose(PTarget, sChoke, m_enfeebleTick);

        if (mList.ice >= 2 && PTarget->GetHPP() >= 50 && canCast(sFrost) && notHave(PTarget, EFFECT_FROST)
            && notHave(PTarget, EFFECT_CHOKE) && notHave(PTarget, EFFECT_BURN) && PTarget->getMod(MOD_ICEDEF) <= 10)
            return choose(PTarget, sFrost, m_enfeebleTick);

        if (mList.thunder >= 1 && PTarget->GetHPP() >= 50 && canCast(sShock) && notHave(PTarget, EFFECT_DROWN)
            && notHave(PTarget, EFFECT_SHOCK) && notHave(PTarget, EFFECT_RASP) && PTarget->getMod(MOD_THUNDERDEF) <= 10)
            return choose(PTarget, sShock, m_enfeebleTick);

        if (mList.earth >= 1 && PTarget->GetHPP() >= 50 && canCast(sRasp) && notHave(PTarget, EFFECT_CHOKE)
            && notHave(PTarget, EFFECT_SHOCK) && notHave(PTarget, EFFECT_RASP) && PTarget->getMod(MOD_EARTHDEF) <= 10)
            return choose(PTarget, sRasp, m_enfeebleTick);

        if (mList.water >= 1 && PTarget->GetHPP() >= 50 && canCast(sDrown) && notHave(PTarget, EFFECT_DROWN)
            && notHave(PTarget, EFFECT_SHOCK) && notHave(PTarget, EFFECT_BURN) && PTarget->getMod(MOD_WATERDEF) <= 10)
            return choose(PTarget, sDrown, m_enfeebleTick);

        if (notHave(PTarget, EFFECT_INT_DOWN) && notHave(PAutomaton, EFFECT_INT_BOOST) && canCast(sAbsorbInt))
            return choose(PTarget, sAbsorbInt, m_enfeebleTick);
    }



    if (isReady(m_nukeTick, PAutomaton->m_nukeDelay + manaMod) && PTarget != nullptr) {
        int sNuke = chooseNuke(sFire, sWater, sAero, sBlizzard, sStone, sThunder);
        if (sNuke) {
            return choose(target, sNuke, m_nukeTick);
        }
    }

    return false;
}



int CAutomatonController::chooseNuke(int sFire, int sWater, int sAero, int sBlizzard, int sStone, int sThunder) {
    // handle Tactical Processer
    int sType = 0;
    int lowestRes = 0;

    std::vector<std::pair<int, MODIFIER> > resTypes = {
            {sFire, MOD_FIREDEF}, {sWater, MOD_WATERDEF}, {sThunder, MOD_THUNDERDEF},
            {sBlizzard, MOD_ICEDEF}, {sAero, MOD_WINDDEF}, {sStone, MOD_EARTHDEF}
    };

    int strongestSpell = 0;
    int highestCost = 0;
    for (auto const& p : resTypes) {
        if (canCast(p.first) && spell::GetSpell(p.first)->getMPCost() > highestCost) {
            strongestSpell = p.first;
            highestCost = spell::GetSpell(p.first)->getMPCost();
        }
        if (PTarget->getMod(p.second) < lowestRes) {
            sType = p.first;
            lowestRes = PTarget->getMod(p.second);
        }
    }

    if (PAutomaton->hasAttachment(ATTACHMENT_SCANNER) && dsprand::GetRandomNumber(100) < (55 + mList.ice * 15)) {
        if (sType && canCast(sType))
            return sType;
    }

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

    // otherwise, randomly cast a spell!
//    std::vector<int> spellArray = {sStone, sWater, sFire, sThunder, sAero, sBlizzard};
//    spellArray.erase(std::remove(spellArray.begin(), spellArray.end(), 0), spellArray.end());
//    if (spellArray.size() > 0) {
//        int nukeSpell = spellArray[dsprand::GetRandomNumber(spellArray.size())];
//        if (canCast(nukeSpell))
//            return nukeSpell;
//    }
    return strongestSpell;
}

bool CAutomatonController::isReady(time_point cooldown, int delay) {
    return m_Tick >= cooldown + std::chrono::seconds(delay);
}

bool CAutomatonController::choose(CBattleEntity* target, uint16 spellID, time_point &recast) {
    recast = m_Tick;
    targid = target->targid;
    spellid = spellID;
    return true;
}





uint16 CAutomatonController::getAutomatonWeaponskill() {
    const auto& FamilySkills = battleutils::GetMobSkillList(PAutomaton->m_Family);
    SKILLTYPE skilltype = SKILL_AME;

    if (PAutomaton->getFrame() == FRAME_SHARPSHOT) {
        skilltype = SKILL_ARA;
    }

    std::map<uint16, bool> knownSkills;
    uint16 highestSkill = 0;
    int highestSkillLevel = -1;

    // retrieve skills
    for (auto skillid : FamilySkills) {
        auto PSkill = battleutils::GetMobSkill(skillid);
        if (PSkill && PAutomaton->PMaster && PAutomaton->PMaster->GetSkill(skilltype) > PSkill->getParam() && PSkill->getParam() != -1) {
            int skillRequirement = PSkill->getParam();
            if (skillRequirement > highestSkillLevel) {
                highestSkillLevel = skillRequirement;
                highestSkill = PSkill->getID();
            }

            knownSkills[PSkill->getID()] = true;
        }
    }

    // retrieve maneuvers
    maneuverList mList = PAutomaton->PMaster->StatusEffectContainer->GetManeuverList();

    // if a particular maneuver dominates, might choose a specific weaponskill
    if (PAutomaton->getFrame() == FRAME_VALOREDGE) {
        if (PAutomaton->hasAttachment(ATTACHMENT_INHIBITOR) && PAutomaton->PMaster->health.tp >= 900) {
            if (knownSkills.find(2299) != knownSkills.end() && battleutils::canSkillchain(PTarget, 55))
                return 2299; // Can shillchain with Bone Crusher
            else if (knownSkills.find(2743) != knownSkills.end() && battleutils::canSkillchain(PTarget, 104))
                return 2743; // Can shillchain with String Shredder
            else if (knownSkills.find(1941) != knownSkills.end() && battleutils::canSkillchain(PTarget, 16))
                return 1941; // Can shillchain with String Clipper
            else if (knownSkills.find(1940) != knownSkills.end() && battleutils::canSkillchain(PTarget, 33))
                return 1940; // Can shillchain with Chimera Ripper
            return 0; // hold TP until we can skillchain
        }

        if (mList.fire >= 2 && knownSkills.find(1940) != knownSkills.end()) {
            return 1940; // Chimera Ripper
        } else if (mList.thunder >= 2) {
            if (knownSkills.find(2743) != knownSkills.end()) {
                return 2743; // String Shredder
            } else if (knownSkills.find(1941) != knownSkills.end()) {
                return 1941; // String Clipper
            }
        } else if (mList.dark >= 2 && knownSkills.find(2065) != knownSkills.end()) {
            return 2065; // Cannibal Blade
        } else if (mList.light >= 2 && knownSkills.find(2299) != knownSkills.end()) {
            return 2299; // Bone Crusher
        }
    }

    if (PAutomaton->getFrame() == FRAME_SHARPSHOT) {
        if (PAutomaton->hasAttachment(ATTACHMENT_INHIBITOR) && PAutomaton->PMaster->health.tp >= 900) {
            if (knownSkills.find(2744) != knownSkills.end() && battleutils::canSkillchain(PTarget, 141))
                return 2744; // Can shillchain with Armor Shatterer
            else if (knownSkills.find(2066) != knownSkills.end() && battleutils::canSkillchain(PTarget, 7))
                return 2066; // Can shillchain with Daze
            else if (knownSkills.find(2300) != knownSkills.end() && battleutils::canSkillchain(PTarget, 41))
                return 2300; // Can shillchain with Armor Piercer
            else if (knownSkills.find(1942) != knownSkills.end() && battleutils::canSkillchain(PTarget, 192))
                return 1942; // Can shillchain with Arcuballista
            return 0; // hold TP until we can skillchain
        }



        if (mList.fire >= 2 && knownSkills.find(1942) != knownSkills.end()) {
            return 1942; // Arcuballista
        } else if (mList.thunder >= 2 && knownSkills.find(2066) != knownSkills.end()) {
            return 2066; // Daze
            }
        else if (mList.dark >= 2 && knownSkills.find(2300) != knownSkills.end()) {
            return 2300; // Armor Piercer
        } else if (mList.wind >= 2 && knownSkills.find(2744) != knownSkills.end()) {
            return 2744; // Armor Shatterer
        }
    }

    if (PAutomaton->getFrame() == FRAME_HARLEQUIN || PAutomaton->getFrame() == FRAME_STORMWAKER) {
        if (PAutomaton->hasAttachment(ATTACHMENT_INHIBITOR) && PAutomaton->PMaster->health.tp >= 900) {
            if (knownSkills.find(2301) != knownSkills.end() && battleutils::canSkillchain(PTarget, 122))
                return 2301; // Can shillchain with Magic Mortar
            else if (knownSkills.find(2067) != knownSkills.end() && battleutils::canSkillchain(PTarget, 23))
                return 2067; // Can shillchain with Slapstick
            else if (knownSkills.find(1943) != knownSkills.end() && battleutils::canSkillchain(PTarget, 2))
                return 1943; // Can shillchain with Knockout
            return 0; // hold TP until we can skillchain
        }

        if (mList.light >= 2 && knownSkills.find(2301) != knownSkills.end()) {
            return 2301; // Magic Mortar
        } else if (mList.thunder >= 2 && knownSkills.find(1943) != knownSkills.end()) {
            return 1943; // Slapstick.lua
        }
        } else if (mList.wind >= 2 && knownSkills.find(2067) != knownSkills.end()) {
            return 2067; // Knockout
        }

    // if we got this far, just return weaponskill with highest skill level requirement
    return highestSkill;
}

bool CAutomatonController::TrySpecialSkill() {
    if (m_Tick <= m_lastSkillTick + std::chrono::seconds(5))
        return false;
    bool success = ChooseSkill();

    if (success) {
        m_lastSkillTick = m_Tick;
        ShowDebug("Success with: %d\n", m_Tick);
        MobSkill(targid, spellid);
        return true;
    }
    return false;
}

bool CAutomatonController::ChooseSkill() {
    maneuverList mList = PAutomaton->PMaster->StatusEffectContainer->GetManeuverList();

    // Eraser
    if (PAutomaton->hasAttachment(ATTACHMENT_ERASER) && mList.light >= 1
        && m_Tick >= m_eraserTick + std::chrono::seconds(60)
            && (PAutomaton->StatusEffectContainer->HasStatusEffectByFlag(EFFECTFLAG_ERASABLE)
                || PAutomaton->PMaster->StatusEffectContainer->HasStatusEffectByFlag(EFFECTFLAG_ERASABLE))){
        return choose(PAutomaton->PMaster, 2021, m_eraserTick);
    }

    // Replicator
    if (PAutomaton->hasAttachment(ATTACHMENT_REPLICATOR)
        && mList.wind >= 1 && m_Tick >= m_replicatorTick + std::chrono::seconds(120)
            && !PAutomaton->StatusEffectContainer->HasStatusEffect(EFFECT_COPY_IMAGE) ) {
        return choose(PAutomaton, 2132, m_replicatorTick);
    }

    // Barrage Turbine
    if (PAutomaton->hasAttachment(ATTACHMENT_BARRAGE_TURBINE)
        && mList.wind >= 1 && mList.earth == 0 && m_Tick >= m_barrageTick + std::chrono::seconds(180)
        && !PAutomaton->StatusEffectContainer->HasStatusEffect(EFFECT_BARRAGE) ) {
        return choose(PAutomaton, 2746, m_barrageTick);
    }

    // Heat Capacitor
    if (PAutomaton->hasAttachment(ATTACHMENT_HEAT_CAPACITOR) && mList.fire >= 1 && mList.water == 0
        && m_Tick >= m_capacitorTick + std::chrono::seconds(90)) {
        return choose(PAutomaton, 2745, m_capacitorTick);
    }

    // Shock Absorber
    if ((PAutomaton->hasAttachment(ATTACHMENT_SHOCK_ABSORBER) || PAutomaton->hasAttachment(ATTACHMENT_SHOCK_ABSORBER_II))
        && notHave(PAutomaton, EFFECT_STONESKIN)
        && mList.earth >= 1 && mList.wind == 0 && m_Tick >= m_shockTick + std::chrono::seconds(180)) {
        return choose(PAutomaton, 1946, m_shockTick);
    }


    // Reactive Shield
    if (PAutomaton->hasAttachment(ATTACHMENT_REACTIVE_SHIELD) && notHave(PAutomaton, EFFECT_BLAZE_SPIKES)
        && mList.fire >= 1 && mList.water == 0 && m_Tick >= m_reactiveTick + std::chrono::seconds(65)) {
        return choose(PAutomaton, 2031, m_reactiveTick);
    }

    // Economizer
    if (PAutomaton->hasAttachment(ATTACHMENT_ECONOMIZER) && mList.dark >= 1 && mList.light == 0
        && m_Tick >= m_economizerTick + std::chrono::seconds(180) && PAutomaton->GetMPP() <= 50) {
        return choose(PAutomaton, 2068, m_economizerTick);
    }

    // Mana Converter
    if (PAutomaton->hasAttachment(ATTACHMENT_MANA_CONVERTER) && mList.dark >= 1
        && m_Tick >= m_converterTick + std::chrono::seconds(120) && PAutomaton->GetMPP() <= 50) {
        return choose(PAutomaton, 1948, m_converterTick);
    }

    // begin moves that target creatures
    if (PTarget == nullptr)
        return false;

    // Disruptor
    if (PAutomaton->hasAttachment(ATTACHMENT_DISRUPTOR) && PTarget->StatusEffectContainer->HasStatusEffectByFlag(EFFECTFLAG_DISPELABLE)
            && mList.dark >= 1 && m_Tick >= m_disruptorTick + std::chrono::seconds(60)) {
        return choose(PTarget, 2747, m_disruptorTick);
    }

    // Shield Bash
    if (PAutomaton->getFrame() == FRAME_VALOREDGE && m_Tick >= m_shieldBashTick + std::chrono::seconds(120) &&
        (PTarget->PAI->IsCurrentState<CMagicState>() || PTarget->PAI->IsCurrentState<CMobSkillState>())) {
        return choose(PTarget, 1307, m_shieldBashTick);
    }

    // Provoke
    if ((PAutomaton->hasAttachment(ATTACHMENT_STROBE) || PAutomaton->hasAttachment(ATTACHMENT_STROBE_II))
        && mList.fire >= 1 && m_Tick >= m_provokeTick + std::chrono::seconds(30)) {
        return choose(PTarget, 1945, m_provokeTick);
    }

    // Flashbulb
    if (PAutomaton->hasAttachment(ATTACHMENT_FLASHBULB) && mList.light >= 1 && m_Tick >= m_flashbulbTick + std::chrono::seconds(45)) {
        return choose(PTarget, 1947, m_flashbulbTick);
    }

    return false;

}

bool CAutomatonController::TryTPMove() {
    //TODO: range checks
    if (PAutomaton->health.tp > 1000) {
        const auto& FamilySkills = battleutils::GetMobSkillList(PAutomaton->m_Family);

        std::vector<CMobSkill*> validSkills;

        //load the skills that the automaton has access to with it's skill
        SKILLTYPE skilltype = SKILL_AME;

        uint16 skillID = getAutomatonWeaponskill();
        if (skillID > 0) {
            MobSkill(PTarget->targid, skillID);
            return true;
        }
    }
    return false;
}

bool CAutomatonController::TryRangedAttack() {
    if (m_rangedCooldown > 0s && m_Tick > m_LastRangedTime + (m_rangedCooldown - std::chrono::seconds(PAutomaton->getMod(MOD_SNAP_SHOT))))
    {
        MobSkill(PTarget->targid, m_RangedAbility);
        return true;
    }
    return false;
}

bool CAutomatonController::canCast(uint32 spellId) {
    if (spellId == 0)
        return false;

    CSpell* PSpell = spell::GetSpell(spellId);
    return PSpell == nullptr ? false : PAutomaton->health.mp > PSpell->getMPCost();
}

// utilities


//bool CAutomatonController::notHave(CBattleEntity* target, EFFECT effect) {
//    return !target->StatusEffectContainer->HasStatusEffect(effect);
//}
//
//
//bool CAutomatonController::isCaster(CBattleEntity* target) {
//    if (target->objtype != TYPE_MOB)
//        return false;
//
//    return ((CMobEntity*)target)->SpellContainer->HasSpells();
//}
//
//CBattleEntity* CAutomatonController::rankedBuff(CBattleEntity* caster, EFFECT buff, std::map<JOBTYPE, uint16> &ranking) {
//    int highest = 0;
//    CBattleEntity* curTarget = nullptr;
//    std::vector<CBattleEntity*> party = getWholeParty(caster);
//    for (CBattleEntity* member : party) {
//        int jobRanking = ranking.find(member->GetMJob()) == ranking.end() ? 0 : ranking[member->GetMJob()];
//        if (jobRanking > highest && notHave(member, buff)) {
//            highest = jobRanking;
//            curTarget = member;
//        }
//    }
//
//    return curTarget;
//}
//
//
//CBattleEntity* CAutomatonController::getLowestHP(CBattleEntity* caster, int threshold, bool useRegen) {
//    int lowest = threshold;
//    CBattleEntity* curTarget = nullptr;
//    std::vector<CBattleEntity*> party = getWholeParty(caster);
//    for (CBattleEntity* member : party) {
//        if (member->GetHPP() <= lowest) {
////        if ((member->objtype == TYPE_PET && member->GetHPP() <= lowest && caster->GetBattleTarget()->GetBattleTarget() == member)
////                || (member->GetHPP() <= lowest)) {
//            if (useRegen && notHave(member, EFFECT_REGEN)) {
//                lowest = member->GetHPP();
//                curTarget = member;
//            } else if (!useRegen) {
//                lowest = member->GetHPP();
//                curTarget = member;
//            }
//        }
//
//    }
//
//    return curTarget;
//}
//
//CBattleEntity* CAutomatonController::getByEffect(CBattleEntity* caster, EFFECT effect, bool mageOnly) {
//
//    std::vector<CBattleEntity*> party = getWholeParty(caster);
//    for (CBattleEntity* member : party) {
//        if (mageOnly) {
//            JOBTYPE  job = member->GetMJob();
//            if (!(job == JOB_WHM || job == JOB_NIN || job == JOB_GEO || job == JOB_BLU || job == JOB_BRD
//                        || job == JOB_BLM || job == JOB_SCH || job == JOB_PLD || job == JOB_DRK || job == JOB_RUN
//                        || job == JOB_RDM || job == JOB_SMN))
//                continue;
//        }
//
//        if (member->StatusEffectContainer->HasStatusEffect(effect))
//            return member;
//    }
//
//    return nullptr;
//}
//
//CBattleEntity* CAutomatonController::getByErasable(CBattleEntity* caster) {
//
//    std::vector<CBattleEntity*> party = getWholeParty(caster);
//    for (CBattleEntity* member : party)
//        if (member->StatusEffectContainer->HasStatusEffectByFlag(EFFECTFLAG_ERASABLE))
//            return member;
//
//    return nullptr;
//}
//
//std::vector<CBattleEntity*> CAutomatonController::getWholeParty(CBattleEntity* caster, bool includeCaster, bool includePets) {
//    std::vector<CBattleEntity* > party;
//    float currentDistance = 100.f;
//    CBattleEntity* origin = caster;
//    if (includeCaster)
//        party.push_back(caster);
//
//    if (caster->PMaster != nullptr) {
//        if (distance(caster->loc.p, caster->PMaster->loc.p) <= 20.0f)
//            party.push_back(caster->PMaster);
//        caster = caster->PMaster;
//    }
//
//    // iterate over allies
//    if (!caster->PAlly.empty()) {
//        for (CBattleEntity* PAlly : caster->PAlly) {
//            if (distance(origin->loc.p, PAlly->loc.p) <= 20.0f)
//                party.push_back(PAlly);
//        }
//    }
//
//    // iterate over party and their allies
//    if (caster->PParty != nullptr && !caster->PParty->members.empty()) {
//        for (CBattleEntity* PMember : caster->PParty->members) {
//            if (distance(origin->loc.p, PMember->loc.p) <= 20.0f)
//                party.push_back(PMember);
//
//            if (includePets && PMember->PPet != nullptr && distance(origin->loc.p, PMember->PPet->loc.p) <= 20.0f)
//                party.push_back(PMember->PPet);
//
//            if (!PMember->PAlly.empty()) {
//                for (CBattleEntity* PAlly : PMember->PAlly) {
//                    if (distance(origin->loc.p, PAlly->loc.p) <= 20.0f)
//                        party.push_back(PAlly);
//                }
//            }
//        }
//    }
//    return party;
//}
