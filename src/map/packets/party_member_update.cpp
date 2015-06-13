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

#include "../../common/socket.h"

#include <string.h>

#include "party_member_update.h"

#include "../entities/charentity.h"
#include "../alliance.h"
#include "../party.h"
#include <stdio.h>

CPartyMemberUpdatePacket::CPartyMemberUpdatePacket(CCharEntity* PChar, uint8 MemberNumber, uint16 ZoneID)
{
    this->type = 0xDD;
    this->size = 0x20;

    DSP_DEBUG_BREAK_IF(PChar == nullptr);

    WBUFL(data, (0x04) ) = PChar->id;

    if (PChar->PParty != nullptr)
    {
        WBUFW(data, (0x14) ) = PChar->PParty->GetMemberFlags(PChar);
    }

    if (PChar->getZone() != ZoneID)
    {
        WBUFW(data, (0x20) ) = PChar->getZone();
    }
    else
    {
        WBUFL(data, (0x08) ) = PChar->health.hp;
        WBUFL(data, (0x0C) ) = PChar->health.mp;
        WBUFW(data, (0x10) ) = PChar->health.tp;
        WBUFW(data, (0x18) ) = PChar->targid;
        WBUFB(data, (0x1A) ) = MemberNumber;
        WBUFB(data, (0x1D) ) = PChar->GetHPP();
        WBUFB(data, (0x1E) ) = PChar->GetMPP();
        printf("MemberID: %d", MemberNumber);

        if (!(PChar->nameflags.flags & FLAG_ANON))
        {
            WBUFB(data, (0x22) ) = PChar->GetMJob();
            WBUFB(data, (0x23) ) = PChar->GetMLevel();
            WBUFB(data, (0x24) ) = PChar->GetSJob();
            WBUFB(data, (0x25) ) = PChar->GetSLevel();
        }
    }

    memcpy(data + (0x26) , PChar->GetName(), PChar->name.size());
}

CPartyMemberUpdatePacket::CPartyMemberUpdatePacket(CBattleEntity* PAlly, uint8 MemberNumber, uint16 ZoneID)
{
    this->type = 0xDD;
    this->size = 0x20;

    DSP_DEBUG_BREAK_IF(PAlly == nullptr);

    WBUFL(data, (0x04) ) = PAlly->id;
    printf("AllyMember: %d \n", MemberNumber);
    printf("Ally HP: %d \n", PAlly->health.hp);

    printf("Ally targid: %d \n", PAlly->targid);
    printf("Ally id: %d \n", PAlly->id);

    WBUFL(data, (0x08) ) = PAlly->health.hp;
    WBUFL(data, (0x0C) ) = PAlly->health.mp;
    WBUFW(data, (0x10) ) = PAlly->health.tp;
    WBUFW(data, (0x18) ) = PAlly->targid;
	WBUFB(data, (0x1A)) = MemberNumber;
    WBUFB(data, (0x1D) ) = PAlly->GetHPP();
    WBUFB(data, (0x1E) ) = PAlly->GetMPP();
    WBUFB(data, (0x22) ) = PAlly->GetMJob();
    WBUFB(data, (0x23) ) = PAlly->GetMLevel();
    WBUFB(data, (0x24) ) = PAlly->GetSJob();
    WBUFB(data, (0x25) ) = PAlly->GetSLevel();


	
	memcpy(data + (0x26) , PAlly->GetName(), PAlly->name.size());
}

CPartyMemberUpdatePacket::CPartyMemberUpdatePacket(uint32 id, const int8* name, uint16 memberFlags, uint8 ZoneID)
{

	this->type = 0xDD;
	this->size = 0x20;
	WBUFL(data, (0x04) ) = id;

	WBUFW(data, (0x14) ) = memberFlags;
	WBUFW(data, (0x20) ) = ZoneID;

	memcpy(data + (0x26) , name, strlen(name));
}
