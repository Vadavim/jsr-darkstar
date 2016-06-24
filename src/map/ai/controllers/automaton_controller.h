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

#ifndef _AUTOMATONCONTROLLER_H
#define _AUTOMATONCONTROLLER_H

#include <vector>
#include "pet_controller.h"
#include "../../status_effect_container.h"

class CAutomatonEntity;

class CAutomatonController : public CPetController
{
public:
    CAutomatonController(CAutomatonEntity* PPet);

private:
    bool TrySpellcast(time_point);
    bool TryTPMove();
    bool TrySpecialSkill();
    bool ChooseSkill();
    bool TryRangedAttack();
    bool canCast(uint32 spellid);
    uint16 getAutomatonWeaponskill();

    CAutomatonEntity* PAutomaton;


    time_point  m_universalTick;
    time_point  m_healTick;
    time_point  m_enfeebleTick;
    time_point  m_nukeTick;
    time_point  m_enhanceTick;
    time_point  m_darkTick;
    time_point  m_statusTick;
    time_point m_LastRangedTime;
    uint16 targid;
    uint16 spellid;


    time_point m_lastSkillTick;
    time_point m_capacitorTick;
    time_point m_provokeTick;
    time_point m_reactiveTick;
    time_point m_flashbulbTick;
    time_point m_disruptorTick;
    time_point m_economizerTick;
    time_point m_converterTick;
    time_point m_eraserTick;
    time_point m_barrageTick;
    time_point m_shockTick;
    time_point m_replicatorTick;
    time_point m_shieldBashTick;

    maneuverList mList;
    bool useStatusRecast;
    bool useEnfeebleRecast;


    bool choose(CBattleEntity* target, uint16 spellID, time_point &recast);
    int chooseNuke(int sFire, int sWater, int sAero, int sBlizzard, int sStone, int sThunder);

    bool isReady(time_point cooldown, int delay);
    bool combatStormStorm(int magicSkill);
    bool combatStormSoul(int magicSkill);
    bool combatStormSpirit(int magicSkill);
    bool roamStormStorm(int magicSkill);
    bool roamStormSoul(int magicSkill);

    duration m_rangedCooldown {duration::zero()};
    static constexpr int m_RangedAbility {1949};
protected:
    virtual void DoCombatTick(time_point tick) override;
    virtual void DoRoamTick(time_point tick) override;

};

bool notHave(CBattleEntity* target, EFFECT effect);
bool isCaster(CBattleEntity* target);
CBattleEntity* getLowestHP(CBattleEntity* caster, int threshold);
CBattleEntity* rankedBuff(CBattleEntity* caster, EFFECT buff, std::map<JOBTYPE, uint16> &ranking);
CBattleEntity* getByEffect(CBattleEntity* caster, EFFECT effect, bool mageOnly = false);
CBattleEntity* getByErasable(CBattleEntity* caster);
std::vector<CBattleEntity*> getWholeParty(CBattleEntity* caster, bool includeCaster = true, bool includePets = true);
#endif