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

#include "automaton_controller.h"
#include "../../entities/automatonentity.h"
#include "../../utils/battleutils.h"
#include "../../lua/luautils.h"
#include "../../mobskill.h"
#include "../../spell.h"
#include "../../status_effect_container.h"

CAutomatonController::CAutomatonController(CAutomatonEntity* PPet) : CPetController(PPet),
    PAutomaton(PPet)
{
    PPet->setInitialBurden();
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

void CAutomatonController::DoCombatTick(time_point tick)
{
    PTarget = static_cast<CBattleEntity*>(PAutomaton->GetEntity(PAutomaton->GetBattleTargetID()));

    if (TryDeaggro())
    {
        Disengage();
        return;
    }
    if (TrySpellcast(tick))
    {
        return;
    }
    else if (TryTPMove())
    {
        //TODO: check if automaton WS have activation times (don't think so)
        return;
    }
    else if (TryRangedAttack())
    {
        //TODO: set ID to ranged attack
        m_LastRangedTime = m_Tick;
        return;
    }
    Move();
}

bool CAutomatonController::TrySpellcast(time_point tick)
{
    AUTOFRAMETYPE frame = PAutomaton->getFrame();
    if (frame == FRAME_VALOREDGE || frame == FRAME_SHARPSHOT)
        return false;

    AUTOHEADTYPE head = PAutomaton->getHead();
    int skill = PAutomaton->PMaster->GetSkill(SKILL_AMA);
    uint16 targId = 0;
    uint16 spellId = 0;

    if (frame == FRAME_STORMWAKER && head == HEAD_STORMWAKER && tryStormStorm(targId, spellId, skill, tick)) {
        ShowDebug("Success!\n");
        CSpell* spell = spell::GetSpell(spellId);
        if (spell->getSkillType() == SKILL_HEA)
            PAutomaton->m_healTick = tick;
        else if (spell->getSkillType() == SKILL_ELE)
            PAutomaton->m_nukeTick = tick;
        Cast(targId, spellId);
        return true;
    }
    return false;

}

bool CAutomatonController::tryStormStorm(uint16 &targId, uint16 &spellId, int magicSkill, time_point tick) {
    int primaryCure = magicSkill < 12 ? 0 :
                      magicSkill < 45 ? 1 : // Cure
                      magicSkill < 81 ? 2 : // Cure II
                      magicSkill < 147 ? 3 : 4; // Cure III or Cure IV

    int secondCure  = magicSkill < 45 ? 0 :
                      magicSkill < 81 ? 1 : // Cure
                      magicSkill < 147 ? 2 : 3; // Cure II or Cure III

    int sStone = magicSkill < 15 ? 0 :
                 magicSkill < 108 ? 159 : // Stone
                 magicSkill < 227 ? 160 : // Stone II
                 magicSkill < 266 ? 161 : 162; // Stone III or Stone IV

    ShowDebug("cure: %d\n", primaryCure);
    ShowDebug("stone: %d\n", sStone);
    ShowDebug("stone delay: %d\n", PAutomaton->m_nukeDelay);

    CBattleEntity* master = PAutomaton->PMaster;
    CBattleEntity* target = PAutomaton->GetBattleTarget();
    if (tick >= PAutomaton->m_healTick + std::chrono::seconds(PAutomaton->m_healDelay)) {

        if (master->GetHPP() < 50 && canCast(primaryCure)) {
            targId = master->id;
            spellId = primaryCure;
            return true;

        } else if (PAutomaton->GetHPP() < 50 && canCast(primaryCure)) {
            targId = master->id;
            spellId = primaryCure;
            return true;
        }
    }


    if (tick >= PAutomaton->m_nukeTick + std::chrono::seconds(PAutomaton->m_nukeDelay)) {
        if (target != nullptr && canCast(sStone)) {
            targId = target->id;
            spellId = sStone;
            return true;
        }
    }



    return false;
}





uint16 CAutomatonController::getAutomatonWeaponskill() {
    const auto& FamilySkills = battleutils::GetMobSkillList(PAutomaton->m_Family);
    SKILLTYPE skilltype = SKILL_AME;

    if (PAutomaton->getFrame() == FRAME_SHARPSHOT)
    {
        skilltype = SKILL_ARA;
    }

    std::map<uint16, bool> knownSkills;
    uint16 highestSkill = 0;
    int highestSkillLevel = -1;

    // retrieve skills
    for (auto skillid : FamilySkills)
    {
        auto PSkill = battleutils::GetMobSkill(skillid);
        if (PSkill && PAutomaton->PMaster && PAutomaton->PMaster->GetSkill(skilltype) > PSkill->getParam() && PSkill->getParam() != -1)
        {
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
        if (mList.light >= 2 && knownSkills.find(2301) != knownSkills.end()) {
            return 1942; // Magic Mortar
        } else if (mList.thunder >= 2 && knownSkills.find(1943) != knownSkills.end()) {
            return 1943; // Slapstick
        }
        } else if (mList.wind >= 2 && knownSkills.find(2067) != knownSkills.end()) {
            return 2067; // Knockout
        }

    // if we got this far, just return weaponskill with highest skill level requirement
    return highestSkill;
}

bool CAutomatonController::TryTPMove()
{
    //TODO: range checks
    if (PAutomaton->health.tp > 1000)
    {
        const auto& FamilySkills = battleutils::GetMobSkillList(PAutomaton->m_Family);

        std::vector<CMobSkill*> validSkills;

        //load the skills that the automaton has access to with it's skill
        SKILLTYPE skilltype = SKILL_AME;

//        if (PAutomaton->getFrame() == FRAME_SHARPSHOT)
//        {
//            skilltype = SKILL_ARA;
//        }
//
//
//        for (auto skillid : FamilySkills)
//        {
//            auto PSkill = battleutils::GetMobSkill(skillid);
//            if (PSkill && PAutomaton->PMaster && PAutomaton->PMaster->GetSkill(skilltype) > PSkill->getParam() && PSkill->getParam() != -1)
//            {
//                existingSkills[PSkill->getID()] = true;
//                validSkills.push_back(PSkill);
//            }
//        }
//
//        uint16 currentSkill = 0;
//        int8 currentManeuvers = -1;
//        maneuverList mList = PAutomaton->PMaster->StatusEffectContainer->GetManeuverList();
//
//
//        for (auto PSkill : validSkills)
//        {
//            int8 maneuvers = luautils::OnMobAutomatonSkillCheck(PTarget, PAutomaton, PSkill);
//            ShowDebug("found maneuvers: %d\n", maneuvers);
//            ShowDebug("found maneuvers: %d\n", maneuvers);
//            if ( maneuvers > -1 && (maneuvers > currentManeuvers || (maneuvers == currentManeuvers && PSkill->getParam() > currentSkill)))
//            {
//                currentManeuvers = maneuvers;
//                currentSkill = PSkill->getParam();
//                ShowDebug("Found valid maneuver: %d\n", currentManeuvers);
//            }
//        }
//
//
//        // No WS was chosen (waiting on master's TP to skillchain probably)
//        if (currentManeuvers == -1)
//        {
//            return false;
//        }
        uint16 skillID = getAutomatonWeaponskill();
        if (skillID > 0) {
            MobSkill(PTarget->targid, skillID);
            return true;
        }
    }
    return false;
}

bool CAutomatonController::TryRangedAttack()
{
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

