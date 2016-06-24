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

#ifndef _CAUTOMATONENTITY_H
#define _CAUTOMATONENTITY_H

#include "petentity.h"
#include <array>
#include <map>


enum ATTACHMENT {
    ATTACHMENT_TACTICAL_PROCESSOR   = 8485,
    ATTACHMENT_SCANNER              = 8483,
    ATTACHMENT_DAMAGE_GAUGE         = 8643,
    ATTACHMENT_VIVI_VALVE           = 8649,
	ATTACHMENT_PERCOLATOR           = 8616,
	ATTACHMENT_HEATSINK             = 8610,
	ATTACHMENT_INHIBITOR            = 8451,
	ATTACHMENT_CONDENSER            = 8614,
	ATTACHMENT_MANA_BOOSTER         = 8481,
	ATTACHMENT_REPLICATOR           = 8519,
	ATTACHMENT_MANA_CONVERTER       = 8674,
	ATTACHMENT_REACTIVE_SHIELD      = 8454,
	ATTACHMENT_HEAT_CAPACITOR       = 8456,
	ATTACHMENT_BARRAGE_TURBINE      = 8520,
	ATTACHMENT_FLASHBULB            = 8642,
	ATTACHMENT_ECONOMIZER           = 8678,
	ATTACHMENT_ERASER               = 8645,
	ATTACHMENT_DISRUPTOR            = 8680,
	ATTACHMENT_STROBE               = 8449,
	ATTACHMENT_STROBE_II            = 8457,
	ATTACHMENT_SHOCK_ABSORBER       = 8545,
	ATTACHMENT_SHOCK_ABSORBER_II    = 8553
};


enum AUTOFRAMETYPE
{
    FRAME_HARLEQUIN  = 0x20,
    FRAME_VALOREDGE  = 0x21,
    FRAME_SHARPSHOT  = 0x22,
    FRAME_STORMWAKER = 0x23
};

enum AUTOHEADTYPE
{
    HEAD_HARLEQUIN    = 0x01,
    HEAD_VALOREDGE    = 0x02,
    HEAD_SHARPSHOT    = 0x03,
    HEAD_STORMWAKER   = 0x04,
    HEAD_SOULSOOTHER  = 0x05,
    HEAD_SPIRITREAVER = 0x06
};

struct automaton_equip_t
{
    uint8 Frame{ 0 };
    uint8 Head{ 0 };
    std::array<uint8, 12> Attachments{};
};

class CCharEntity;

class CAutomatonEntity : public CPetEntity
{
public:
	 CAutomatonEntity();
	~CAutomatonEntity();

    automaton_equip_t m_Equip;
    std::array<uint8, 8> m_ElementMax;
    std::array<uint8, 8> m_ElementEquip;

    void setFrame(AUTOFRAMETYPE frame);
    void setHead(AUTOHEADTYPE head);
    void setAttachment(uint8 slot, uint8 id);

    void setElementMax(uint8 element, uint8 max);
    void addElementCapacity(uint8 element, int8 value);

    AUTOFRAMETYPE getFrame();
    AUTOHEADTYPE getHead();
    uint8 getAttachment(uint8 slot);
    bool hasAttachment(uint8 attachment);

    uint8 getElementMax(uint8 element);
    uint8 getElementCapacity(uint8 element);

	uint8 m_healDelay;
	uint8 m_enhanceDelay;
	uint8 m_enfeebleDelay;
    uint8 m_statusDelay;
	uint8 m_nukeDelay;
	uint8 m_darkDelay;
	uint8 m_universalDelay;


    void burdenTick();
    void setInitialBurden();
    uint8 addBurden(uint8 element, uint8 burden);

    void PostTick() override;

    virtual void Die() override;

private:
    std::array<uint8, 8> m_Burden {};
};

#endif