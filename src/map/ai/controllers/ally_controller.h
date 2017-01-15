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

#ifndef _ALLYCONTROLLER_H
#define _ALLYCONTROLLER_H

#include <vector>
#include "pet_controller.h"
#include "../../status_effect_container.h"

class CPetEntity;


enum nukeTypes {
    nFIRE = 0x01, nICE = 0x02, nTHUNDER = 0x04, nWIND = 0x08, nWATER = 0x10, nEARTH = 0x20,
};

enum nukeFlags {
    NUKE_TARGET_WEAKNESS        = 0x01,
    NUKE_ONLY_MAGICBURST        = 0x02,
    NUKE_CAREFUL                = 0x04,
    NUKE_USE_GA                 = 0x08,
};

class CAllyController : public CPetController
{
public:
    CAllyController(CPetEntity* PPet);

private:
    bool TrySpellcast(time_point);
    bool TryTPMove();
    bool TrySpecialSkill();
    bool ChooseSkill();
    bool TryRangedAttack();
    bool canCast(uint32 spellid);
//    uint16 getAllyWeaponskill();
//
    CPetEntity* PAlly;
//
//
    time_point  m_lastMagicTick;
    time_point m_LastRangedTime;

    time_point m_heal1;
    time_point m_heal2;
    time_point m_status1;
    time_point m_status2;
    time_point m_enfeeble1;
    time_point m_enfeeble2;
    time_point m_dark1;
    time_point m_dark2;
    time_point m_divine1;
    time_point m_divine2;
    time_point m_enhancing1;
    time_point m_enhancing2;
    time_point m_elemental1;
    time_point m_elemental2;
    time_point m_magicBurst;

    time_point  m_lastAbilityTick;
    time_point m_ability1;
    time_point m_ability2;
    time_point m_ability3;
    time_point m_ability4;
    time_point m_ability5;
    time_point m_ability6;

    uint16 targid;
    CBattleEntity* lastTarget;
    uint16 spellid;
    uint16 restCounter;

//    time_point m_capacitorTick;
//    time_point m_provokeTick;
//    time_point m_reactiveTick;
//    time_point m_flashbulbTick;
//    time_point m_disruptorTick;
//    time_point m_economizerTick;
//    time_point m_converterTick;
//    time_point m_eraserTick;
//    time_point m_barrageTick;
//    time_point m_shockTick;
//    time_point m_replicatorTick;
//    time_point m_shieldBashTick;
//
//    maneuverList mList;
//    bool useStatusRecast;
//    bool useEnfeebleRecast;
//
//
    bool choose(CBattleEntity* target, uint16 spellID, time_point &recast);
    bool useJobAbility(CBattleEntity* PTarget, uint16 abilityId, time_point &recast, uint32 useDelay = 0);
//    int chooseNuke(int sFire, int sWater, int sAero, int sBlizzard, int sStone, int sThunder);
//
    bool isReady(time_point cooldown, int delay);
    bool combatCherukiki(uint16 lvl);
    bool combatIngrid(uint16 lvl);
    bool combatCurilla(uint16 lvl);
    bool roamCherukiki(uint16 lvl);
    bool roamCurilla(uint16 lvl);
    bool tryWeaponskill(uint16 lvl, std::vector<std::pair<int, int> > weaponskills, int tpThreshold);

    bool tryStatusRemoval(uint16 lvl);
    bool doCureRegen(uint16 lvl, JOBTYPE job, int threshold, bool hasRegen = false, bool hasEmergencyHeal = false);
    bool doProtectShell(uint16 lvl, bool useRa = false, bool selfOnly = false);
//    bool combatStormSoul(int magicSkill);
//    bool combatHarlHarl(int magicSkill);
//    bool combatStormSpirit(int magicSkill);
//    bool roamStormStorm(int magicSkill);
//    bool roamStormSoul(int magicSkill);
//    bool roamHarlHarl(int magicSkill);

    duration m_rangedCooldown {duration::zero()};
    static constexpr int m_RangedAbility {1949};
protected:
    virtual void DoCombatTick(time_point tick) override;
    virtual void DoRoamTick(time_point tick) override;

};

//bool notHave(CBattleEntity* target, EFFECT effect);
//bool isCaster(CBattleEntity* target);
//CBattleEntity* getLowestHP(CBattleEntity* caster, int threshold, bool useRegen = false);
//CBattleEntity* rankedBuff(CBattleEntity* caster, EFFECT buff, std::map<JOBTYPE, uint16> &ranking);
//CBattleEntity* getByEffect(CBattleEntity* caster, EFFECT effect, bool mageOnly = false);
//CBattleEntity* getByErasable(CBattleEntity* caster);
//std::vector<CBattleEntity*> getWholeParty(CBattleEntity* caster, bool includeCaster = true, bool includePets = true);
#endif