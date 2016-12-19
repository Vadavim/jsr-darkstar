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

/*
The PathFind class provides an interface for getting an entity to a destination. It will find a path from a navmesh and carry it out.
*/
#ifndef _AIUTILS_H
#define _AIUTILS_H

#include "../../../common/showmsg.h"
#include "../../entities/battleentity.h"
#include "../../../common/mmo.h"
#include "../../status_effect_container.h"

#include <vector>
#include <map>

class CBattleEntity;


namespace aiutils {
    static std::map<JOBTYPE, uint16> rankingsHaste = {
            {JOB_NIN, 30}, {JOB_DNC, 29}, {JOB_WAR, 28}, {JOB_MNK, 27}, {JOB_DRG, 26}, {JOB_SAM, 25}, {JOB_DRK, 24},
            {JOB_RUN, 23}, {JOB_PLD, 22}, {JOB_THF, 21}, {JOB_PUP, 20}, {JOB_BST, 19}, {JOB_BLU, 18},
            {JOB_COR, 17}, {JOB_RNG, 16}
    };

    static std::map<JOBTYPE, uint16> rankingsRefresh = {
            {JOB_WHM, 30}, {JOB_BLM, 29}, {JOB_SCH, 28}, {JOB_GEO, 27}, {JOB_BLU, 26}, {JOB_PLD, 25}, {JOB_DRK, 24}
    };

    static std::map<JOBTYPE, uint16> rankingsFlurry = {
            {JOB_RNG, 10}, {JOB_COR, 9}
    };

    static std::map<JOBTYPE, uint16> rankingsProtectShell = {
            {JOB_BLM, 10}, {JOB_BLU, 20}, {JOB_BRD, 10}, {JOB_BST, 15}, {JOB_COR, 20}, {JOB_DNC, 25}, {JOB_DRG, 25},
            {JOB_DRK, 20}, {JOB_GEO, 15}, {JOB_MNK, 28}, {JOB_NIN, 30}, {JOB_PLD, 1}, {JOB_PUP, 10}, {JOB_RDM, 1},
            {JOB_RNG, 20}, {JOB_RUN, 1}, {JOB_SAM, 25}, {JOB_SCH, 1}, {JOB_SMN, 10}, {JOB_THF, 20}, {JOB_WAR, 30}, {JOB_WHM, 1},
    };

    static int resonanceMatches [13][17] = {
            {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            {0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0},
            {0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1},
            {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1},
            {0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0},
            {0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 1},
            {0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 1, 0},
            {0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0},
            {0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1},
            {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
    };


    bool notHave(CBattleEntity* target, EFFECT effect);
    bool isCaster(CBattleEntity* target);
    bool canMagicBurst(CBattleEntity* target, int element);
    CBattleEntity* getByNotHaveEffect(CBattleEntity* caster, EFFECT effect);
    CBattleEntity* getLowestHP(CBattleEntity* caster, int threshold, bool useRegen = false);
    CBattleEntity* rankedBuff(CBattleEntity* caster, EFFECT buff, std::map<JOBTYPE, uint16> &ranking);
    CBattleEntity* getByEffect(CBattleEntity* caster, EFFECT effect, bool mageOnly = false);
    CBattleEntity* getByErasable(CBattleEntity* caster);
    int getEnmityDifference(CBattleEntity* PEntity, CMobEntity* PMob);
    void queueJobAbility(CBattleEntity* PEntity, int abilityId, CBattleEntity* PTarget = nullptr, uint32 milliseconds = 0 );
    std::vector<CBattleEntity*> getWholeParty(CBattleEntity* caster, bool includeCaster = true, bool includePets = true);
}



#endif
