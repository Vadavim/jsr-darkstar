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

#include "automatonentity.h"
#include "../ai/ai_container.h"
#include "../ai/controllers/automaton_controller.h"
#include "../utils/puppetutils.h"
#include "../packets/entity_update.h"
#include "../packets/pet_sync.h"
#include "../packets/char_job_extra.h"
#include "../status_effect_container.h"
#include "../packets/chat_message.h"

    CAutomatonEntity::CAutomatonEntity()
            : CPetEntity(PETTYPE_AUTOMATON)
    {
        PAI->SetController(nullptr);
        m_universalDelay = 10;
        m_enhanceDelay = 100;
        m_enfeebleDelay = 100;
        m_nukeDelay = 100;
        m_healDelay = 100;
        m_darkDelay = 100;
        m_statusDelay = 100;
    }

    CAutomatonEntity::~CAutomatonEntity()
    {}

    void CAutomatonEntity::setFrame(AUTOFRAMETYPE frame)
    {
        m_Equip.Frame = frame;
    }

    AUTOFRAMETYPE CAutomatonEntity::getFrame()
    {
        return (AUTOFRAMETYPE)m_Equip.Frame;
    }

    void CAutomatonEntity::setHead(AUTOHEADTYPE head)
    {
        m_Equip.Head = head;
    }

    AUTOHEADTYPE CAutomatonEntity::getHead()
    {
        return (AUTOHEADTYPE)m_Equip.Head;
    }

    void CAutomatonEntity::setAttachment(uint8 slotid, uint8 id)
    {
        m_Equip.Attachments[slotid] = id;
    }

    uint8 CAutomatonEntity::getAttachment(uint8 slotid)
    {
        return m_Equip.Attachments[slotid];
    }

    bool CAutomatonEntity::hasAttachment(uint8 attachment)
    {
        for (auto&& attachmentid : m_Equip.Attachments)
        {
            if (attachmentid == attachment)
            {
                return true;
            }
        }
        return false;
    }

    void CAutomatonEntity::setElementMax(uint8 element, uint8 max)
    {
        m_ElementMax[element] = max;
    }

    uint8 CAutomatonEntity::getElementMax(uint8 element)
    {
        return m_ElementMax[element];
    }

    void CAutomatonEntity::addElementCapacity(uint8 element, int8 value)
    {
        m_ElementEquip[element] += value;
    }

    uint8 CAutomatonEntity::getElementCapacity(uint8 element)
    {
        return m_ElementEquip[element];
    }

    void CAutomatonEntity::burdenTick()
    {
        for (auto&& burden : m_Burden)
    {
        if (burden > 0)
        {
            --burden;

            // check to see if Percolator reduces burden by an additional tic
            if (burden > 0 && hasAttachment(ATTACHMENT_HEATSINK)) {
                maneuverList mList = PMaster->StatusEffectContainer->GetManeuverList();
                if (dsprand::GetRandomNumber(100) < 10 + mList.water * 25)
                    --burden;
            }
        }

    }
}

void CAutomatonEntity::setInitialBurden()
{
    m_Burden.fill(0);
}

uint8 CAutomatonEntity::addBurden(uint8 element, uint8 burden)
{
    //TODO: tactical processor attachment
    uint8 thresh = 30 + PMaster->getMod(MOD_OVERLOAD_THRESH);
    maneuverList mList = PMaster->StatusEffectContainer->GetManeuverList();

    if (hasAttachment(ATTACHMENT_PERCOLATOR))
        thresh += 5 + mList.water * 10;

    ShowDebug("Initial burden: %d\n", m_Burden[element]);
    int8 burdenMod = 0;
//    if (element == 0) // Fire
//        burdenMod += mList.ice * 4 - mList.water * 2 - mList.dark;
//    else if (element == 1) // Earth
//        burdenMod += mList.thunder * 4 - mList.wind * 2 - mList.light;
//    else if (element == 2) // Water
//        burdenMod += mList.fire * 4 - mList.earth * 2 - mList.light;
//    else if (element == 3) // Wind
//        burdenMod += mList.earth * 4 - mList.ice * 2 - mList.light;
//    else if (element == 4) // Ice
//        burdenMod += mList.wind * 4 - mList.fire * 2 - mList.dark;
//    else if (element == 5) // Thunder
//        burdenMod += mList.water * 4 - mList.earth * 2 - mList.dark;

    if (element == 0) // Fire
        burdenMod -= (mList.water * 2 + mList.dark);
    else if (element == 1) // Earth
        burdenMod -= (mList.wind * 2 + mList.light);
    else if (element == 2) // Water
        burdenMod -= (mList.earth * 2 + mList.light);
    else if (element == 3) // Wind
        burdenMod -= (mList.ice * 2 + mList.light);
    else if (element == 4) // Ice
        burdenMod -= (mList.fire * 2 + mList.dark);
    else if (element == 5) // Thunder
        burdenMod -= (mList.earth * 2 + mList.dark);

    int finalBurden = (int)burden + burdenMod + (hasAttachment(ATTACHMENT_TACTICAL_PROCESSOR) ? 5 : 0);
    ShowDebug("Burden Mod: %d\n", burdenMod);
    m_Burden[element] += finalBurden < 0 ? 0 : finalBurden;
    ShowDebug("After Maneuver: %d\n", m_Burden[element]);
    int8 bonusString[80];
    sprintf(bonusString, "F[%d], I[%d], Wnd[%d], E[%d], T[%d], Wtr[%d], L[%d], D[%d]",
        m_Burden[0], m_Burden[4], m_Burden[3], m_Burden[1], m_Burden[5], m_Burden[2], m_Burden[6], m_Burden[7]);
    ((CCharEntity*)PMaster)->pushPacket(new CChatMessagePacket(MESSAGE_SAY, bonusString));

    //check for overload
    if (m_Burden[element] > thresh)
    {
        if (dsprand::GetRandomNumber(100) < (m_Burden[element] - thresh + 5))
        {
            // Condenser might save the day
            if (mList.water > 0 && dsprand::GetRandomNumber(100) < 20 + mList.water * 20) {
                PMaster->StatusEffectContainer->DelStatusEffectSilent(EFFECT_WATER_MANEUVER);
                return 0;
            }

            //return overload duration
            return m_Burden[element] - thresh;
        }
    }
    return 0;
}

void CAutomatonEntity::PostTick()
{
    auto pre_mask = updatemask;
    CPetEntity::PostTick();
    if (pre_mask && status != STATUS_DISAPPEAR)
    {
        if (PMaster && PMaster->objtype == TYPE_PC)
        {
            ((CCharEntity*)PMaster)->pushPacket(new CCharJobExtraPacket((CCharEntity*)PMaster, PMaster->GetMJob() == JOB_PUP));
        }
    }
}

void CAutomatonEntity::Die()
{
    PMaster->StatusEffectContainer->RemoveAllManeuvers();
    CPetEntity::Die();
}
