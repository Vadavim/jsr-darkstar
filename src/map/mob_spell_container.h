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

#ifndef _CMOBSPELLCONTAINER_H
#define _CMOBSPELLCONTAINER_H

#include <vector>
#include <map>

#include "../common/cbasetypes.h"
#include "../common/mmo.h"

#include "spell.h"
#include "status_effect.h"
#include "entities/mobentity.h"
#include "ai/states/state.h"


class CMobSpellContainer
{
public:

    CMobSpellContainer(CMobEntity* PMob);


    // These methods return a random spell
    int16 GetAggroSpell(); // -ga spell, dia, bio, paralyze, silence, blind
    int16 GetGaSpell(); // AoE damage spells, stonega, diaga
    int16 GetDamageSpell(); // Single target damage spells, stone
    int16 GetDebuffSpell(); // Debuffing spells (Dia, Poison, etc.)
    int16 GetCrowdControlSpell(); // Spells that stop a mob (Sleep, Stun, etc.)
    int16 GetDispelSpell(); // Spells that can dispel positive effects (Dispel, etc.)
    int16 GetBuffSpell(); // stoneskin, utsusemi, blink
    int16 GetHealSpell(); // cures, regen, armys paeon
    int16 GetNaSpell(); // silena, blindna etc
    int16 GetSpell(); // return a random spell

    bool HasSpells();
    bool HasMPSpells();
    bool HasNaSpell(int16 spellId);
    bool HasGaSpells();
    bool HasDamageSpells();
    bool HasCrowdControlSpells();
    bool HasDebuffSpells();
    bool HasDispelSpells();
    bool HasBuffSpells();
    bool HasHealSpells();
    bool HasNaSpells();

    bool HasDebuffType(EFFECT eType);
    bool HasCrowdControlType(EFFECT eType);


    void ClearSpells();
    void AddSpell(int16 spellId);
    // TODO:
    void RemoveSpell(int16 spellId);
    std::vector<int16> m_dispelList;
    std::vector<int16> m_ccList;
    std::vector<int16> m_debuffList;
    std::vector<int16> m_gaList;
    std::vector<int16> m_damageList;
    std::vector<int16> m_buffList;
    std::vector<int16> m_healList;
    std::vector<int16> m_naList;

private:
    CMobEntity* m_PMob;
    bool m_hasSpells;


//    struct _debuffSpell {
//        int16 spellid;
//        EFFECT effect;
//        _debuffSpell(int16 id, EFFECT etype) : spellid(id), effect(etype){};
//    };

    std::map<uint32, bool> dispelSpells = {
            {260, true},                            // Dispel
            {360, true},                            // Dispelga
            {462, true}                             // Magic Finale
    };


    std::map<uint32, EFFECT> crowdControlSpellList = {
            {258, EFFECT_BIND},              // Bind
            {362, EFFECT_BIND},              // Bindga


            {59, EFFECT_SILENCE},            // Silence
            {359, EFFECT_SILENCE},           // Silencega

            {253, EFFECT_SLEEP},             // Sleep
            {259, EFFECT_SLEEP},             // Sleep II
            {273, EFFECT_SLEEP},             // Sleepga
            {274, EFFECT_SLEEP},             // Sleepga II
            {98, EFFECT_SLEEP},              // Repose
            {376, EFFECT_LULLABY},           // Horde Lullaby
            {377, EFFECT_LULLABY},           // Horde Lullaby II
            {463, EFFECT_LULLABY},           // Foe Lullaby
            {471, EFFECT_LULLABY},           // Foe Lullaby II

            {252, EFFECT_STUN},            // Silence

    };

    std::map<uint32, EFFECT> debuffSpellList = {
            {254, EFFECT_BLINDNESS},         // Blind
            {276, EFFECT_BLINDNESS},         // Blind II
            {361, EFFECT_BLINDNESS},         // Blindga
            {347, EFFECT_BLINDNESS},         // Kurayami Ichi
            {348, EFFECT_BLINDNESS},         // Kurayami Ni
            {349, EFFECT_BLINDNESS},         // Kurayami San

            {255, EFFECT_PETRIFICATION},     // Break
            {365, EFFECT_PETRIFICATION},     // Breakga

            {58, EFFECT_PARALYSIS},          // Paralyze
            {80, EFFECT_PARALYSIS},          // Paralyze II
            {356, EFFECT_PARALYSIS},         // Paralyga
            {341, EFFECT_PARALYSIS},         // Jubaku Ichi
            {342, EFFECT_PARALYSIS},         // Jubaku Ni
            {343, EFFECT_PARALYSIS},         // Jubaku San

            {220, EFFECT_POISON},            // Poison
            {221, EFFECT_POISON},            // Poison II
            {222, EFFECT_POISON},            // Poison III
            {223, EFFECT_POISON},            // Poison IV
            {224, EFFECT_POISON},            // Poison V
            {225, EFFECT_POISON},            // Poisonga
            {226, EFFECT_POISON},            // Poisonga II
            {227, EFFECT_POISON},            // Poisonga III
            {228, EFFECT_POISON},            // Poisonga IV
            {229, EFFECT_POISON},            // Poisonga V
            {350, EFFECT_POISON},            // Dokumori Ichi
            {351, EFFECT_POISON},            // Dokumori Ni
            {352, EFFECT_POISON},            // Dokumori San

            {56, EFFECT_SLOW},               // Slow
            {79, EFFECT_SLOW},               // Slow II
            {357, EFFECT_SLOW},              // Slowga
            {357, EFFECT_SLOW},              // Slowga
            {344, EFFECT_SLOW},              // Hojo Ichi
            {345, EFFECT_SLOW},              // Hojo Ni
            {346, EFFECT_SLOW},              // Hojo San

            {421, EFFECT_ELEGY},             // Battlefield Elegy
            {422, EFFECT_ELEGY},             // Carnage Elegy
            {423, EFFECT_ELEGY},             // Massacre Elegy



            {216, EFFECT_WEIGHT},            // Gravity
            {217, EFFECT_WEIGHT},            // Gravity II
            {366, EFFECT_WEIGHT},            // Graviga

            {230, EFFECT_BIO},               // Bio
            {231, EFFECT_BIO},               // Bio II
            {232, EFFECT_BIO},               // Bio III
            {233, EFFECT_BIO},               // Bio IV
            {234, EFFECT_BIO},               // Bio V

            {23, EFFECT_DIA},                // Dia
            {24, EFFECT_DIA},                // Dia II
            {25, EFFECT_DIA},                // Dia III
            {26, EFFECT_DIA},                // Dia IV
            {27, EFFECT_DIA},                // Dia V
            {33, EFFECT_DIA},                // Diaga
            {34, EFFECT_DIA},                // Diaga II
            {35, EFFECT_DIA},                // Diaga III
            {36, EFFECT_DIA},                // Diaga IV
            {37, EFFECT_DIA},                // Diaga V

            {368, EFFECT_REQUIEM},           // Foe Requiem
            {369, EFFECT_REQUIEM},           // Foe Requiem II
            {370, EFFECT_REQUIEM},           // Foe Requiem III
            {371, EFFECT_REQUIEM},           // Foe Requiem IV
            {372, EFFECT_REQUIEM},           // Foe Requiem V
            {373, EFFECT_REQUIEM},           // Foe Requiem VI
            {374, EFFECT_REQUIEM},           // Foe Requiem VII
            {375, EFFECT_REQUIEM},           // Foe Requiem VIII

            {454, EFFECT_THRENODY},          // Fire Threnody
            {455, EFFECT_THRENODY},          // Ice Threnody
            {456, EFFECT_THRENODY},          // Wind Threnody
            {457, EFFECT_THRENODY},          // Earth Threnody
            {458, EFFECT_THRENODY},          // Lightning Threnody
            {459, EFFECT_THRENODY},          // Water Threnody
            {460, EFFECT_THRENODY},          // Light Threnody
            {461, EFFECT_THRENODY},          // Dark Threnody

            {242, EFFECT_ACCURACY_DOWN},     // Absorb Acc
            {266, EFFECT_STR_DOWN},          // Absorb Str
            {267, EFFECT_DEX_DOWN},          // Absorb Dex
            {268, EFFECT_VIT_DOWN},          // Absorb Vit
            {269, EFFECT_AGI_DOWN},          // Absorb Agi
            {270, EFFECT_INT_DOWN},          // Absorb Int
            {271, EFFECT_MND_DOWN},          // Absorb Mnd
            {266, EFFECT_CHR_DOWN},          // Absorb Chr

            {841, EFFECT_EVASION_DOWN},      // Distract
            {842, EFFECT_EVASION_DOWN},      // Distract II

            {466, EFFECT_CHARM},             // Maiden's Virelai
            {257, EFFECT_CURSE},             // Curse
            {112, EFFECT_FLASH},             // Flash
            {256, EFFECT_PLAGUE},            // Virus
            {286, EFFECT_ADDLE},             // Addle

            {235, EFFECT_BURN},              // Burn
            {236, EFFECT_FROST},             // Frost
            {237, EFFECT_CHOKE},             // Choke
            {238, EFFECT_RASP},              // Rasp
            {239, EFFECT_SHOCK},             // Shock
            {240, EFFECT_DROWN},             // Drown

            {278, EFFECT_HELIX},              // Geohelix
            {279, EFFECT_HELIX},              // Hydrohelix
            {280, EFFECT_HELIX},              // Anemohelix
            {281, EFFECT_HELIX},              // Pyrohelix
            {282, EFFECT_HELIX},              // Cryohelix
            {283, EFFECT_HELIX},              // Ioohelix
            {284, EFFECT_HELIX},              // Noctohelix
            {285, EFFECT_HELIX},              // Luminohelix

    };


};

#endif