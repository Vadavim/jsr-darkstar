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

#ifndef _IPETUTILS_H
#define _IPETUTILS_H

#include "../../common/cbasetypes.h"
#include "../../common/mmo.h"

#include "../entities/petentity.h"

enum PETID
{
	PETID_FIRESPIRIT         = 0,
	PETID_ICESPIRIT          = 1,
	PETID_AIRSPIRIT          = 2,
	PETID_EARTHSPIRIT        = 3,
	PETID_THUNDERSPIRIT      = 4,
	PETID_WATERSPIRIT        = 5,
	PETID_LIGHTSPIRIT        = 6,
	PETID_DARKSPIRIT         = 7,
	PETID_CARBUNCLE          = 8,
	PETID_FENRIR             = 9,
	PETID_IFRIT              = 10,
	PETID_TITAN              = 11,
	PETID_LEVIATHAN          = 12,
	PETID_GARUDA             = 13,
	PETID_SHIVA              = 14,
	PETID_RAMUH              = 15,
	PETID_DIABOLOS           = 16,
	PETID_ALEXANDER          = 17,
	PETID_ODIN               = 18,
	PETID_ATOMOS             = 19,
	PETID_CAIT_SITH          = 20,
	PETID_WYVERN             = 48,
	PETID_HARLEQUINFRAME     = 69,
    PETID_VALOREDGEFRAME     = 70,
    PETID_SHARPSHOTFRAME     = 71,
    PETID_STORMWAKERFRAME    = 72,
	PETID_VOLKER            = 73,
	PETID_AYAME            = 74,
	PETID_LUOPAN            = 75,
	PETID_STORM           = 76,
	PETID_CHERUKIKI           = 77,
	PETID_INGRID           = 78,
	PETID_CURILLA           = 79,
	PETID_MORIMAR           = 80,
	PETID_AUGUST           = 81,
	PETID_ADVENTURING_FELLOW = 230,
	PETID_CHOCOBO            = 230
};


class CBattleEntity;

namespace petutils
{
    void	LoadPetList();
    void	FreePetList();

    void	SpawnPet(CBattleEntity* PMaster, uint32 PetID, bool spawningFromZone);
	void	SpawnAlly(CBattleEntity* PMaster, uint32 PetID, bool spawningFromZone);
	void ReloadAlly(CPetEntity* PPet);
    void  SpawnMobPet(CBattleEntity* PMaster, uint32 PetID);
    void  DetachPet(CBattleEntity* PMaster);
    void  DespawnPet(CBattleEntity* PMaster);
    void  AttackTarget(CBattleEntity* PMaster, CBattleEntity* PTarget);
    void  RetreatToMaster(CBattleEntity* PMaster);
    int16 PerpetuationCost(uint32 id, uint8 level);
    void  Familiar(CBattleEntity* PPet);
    void  LoadPet(CBattleEntity* PMaster, uint32 PetID, bool spawningFromZone);
	void  ReloadAutomaton(CCharEntity* PMaster, CPetEntity* PPet);
    CPetEntity* LoadAlly(CBattleEntity* PMaster, uint32 PetID, bool spawningFromZone);
    void  LoadWyvernStatistics(CBattleEntity* PMaster, CPetEntity* PPet, bool finalize);
    void  FinalizePetStatistics(CBattleEntity* PMaster, CPetEntity* PPet);
    void RecalculatePetSpellContainer(CPetEntity* PPet);
};

#endif
