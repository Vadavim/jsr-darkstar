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
#include "ai_utils.h"
#include "../../entities/petentity.h"
#include "../../lua/luautils.h"
#include "../../mobskill.h"
#include "../../utils/battleutils.h"
#include "../../mob_spell_container.h"
#include "../ai_container.h"
#include "../states/magic_state.h"
#include "../states/mobskill_state.h"
#include "../../enmity_container.h"
#include "../../spell.h"
#include "../../../common/utils.h"


namespace aiutils {

    bool notHave(CBattleEntity* target, EFFECT effect) {
        return !target->StatusEffectContainer->HasStatusEffect(effect);
    }

    int getEnmityDifference(CBattleEntity* PEntity, CMobEntity* PMob) {
        CBattleEntity* highest = PMob->PEnmityContainer->GetHighestEnmity();
        int highestEnmity = PMob->PEnmityContainer->GetCE(highest) + PMob->PEnmityContainer->GetVE(highest);
        int entityEnmity = PMob->PEnmityContainer->GetCE(PEntity) + PMob->PEnmityContainer->GetVE(PEntity);
        return highestEnmity - entityEnmity;
    }


    bool isCaster(CBattleEntity* target) {
        if (target->objtype != TYPE_MOB)
            return false;

        return ((CMobEntity*)target)->SpellContainer->HasSpells();
    }



    CBattleEntity* rankedBuff(CBattleEntity* caster, EFFECT buff, std::map<JOBTYPE, uint16> &ranking) {
        int highest = 0;
        CBattleEntity* curTarget = nullptr;
        std::vector<CBattleEntity*> party = getWholeParty(caster);
        for (CBattleEntity* member : party) {
            int jobRanking = ranking.find(member->GetMJob()) == ranking.end() ? 0 : ranking[member->GetMJob()];
            if (jobRanking > highest && notHave(member, buff)) {
                highest = jobRanking;
                curTarget = member;
            }
        }

        return curTarget;
    }


    CBattleEntity* getLowestHP(CBattleEntity* caster, int threshold, bool useRegen) {
        int lowest = threshold;
        CBattleEntity* curTarget = nullptr;
        std::vector<CBattleEntity*> party = getWholeParty(caster);
        for (CBattleEntity* member : party) {
            if (member->GetHPP() <= lowest) {
//        if ((member->objtype == TYPE_PET && member->GetHPP() <= lowest && caster->GetBattleTarget()->GetBattleTarget() == member)
//                || (member->GetHPP() <= lowest)) {
                if (useRegen && notHave(member, EFFECT_REGEN)) {
                    lowest = member->GetHPP();
                    curTarget = member;
                } else if (!useRegen) {
                    lowest = member->GetHPP();
                    curTarget = member;
                }
            }

        }

        return curTarget;
    }

    CBattleEntity* getByEffect(CBattleEntity* caster, EFFECT effect, bool mageOnly) {

        std::vector<CBattleEntity*> party = getWholeParty(caster);
        for (CBattleEntity* member : party) {
            if (mageOnly) {
                JOBTYPE  job = member->GetMJob();
                if (!(job == JOB_WHM || job == JOB_NIN || job == JOB_GEO || job == JOB_BLU || job == JOB_BRD
                      || job == JOB_BLM || job == JOB_SCH || job == JOB_PLD || job == JOB_DRK || job == JOB_RUN
                      || job == JOB_RDM || job == JOB_SMN))
                    continue;
            }

            if (member->StatusEffectContainer->HasStatusEffect(effect))
                return member;
        }

        return nullptr;
    }


    CBattleEntity* getByErasable(CBattleEntity* caster) {

        std::vector<CBattleEntity*> party = getWholeParty(caster);
        for (CBattleEntity* member : party)
            if (member->StatusEffectContainer->HasStatusEffectByFlag(EFFECTFLAG_ERASABLE))
                return member;

        return nullptr;
    }

    std::vector<CBattleEntity*> getWholeParty(CBattleEntity* caster, bool includeCaster, bool includePets) {
        std::vector<CBattleEntity* > party;
        float currentDistance = 100.f;
        CBattleEntity* origin = caster;
        if (includeCaster)
            party.push_back(caster);

        if (caster->PMaster != nullptr) {
            if (distance(caster->loc.p, caster->PMaster->loc.p) <= 20.0f)
                party.push_back(caster->PMaster);
            caster = caster->PMaster;
        }

        // iterate over allies
        if (!caster->PAlly.empty()) {
            for (CBattleEntity* PAlly : caster->PAlly) {
                if (distance(origin->loc.p, PAlly->loc.p) <= 20.0f)
                    party.push_back(PAlly);
            }
        }

        // iterate over party and their allies
        if (caster->PParty != nullptr && !caster->PParty->members.empty()) {
            for (CBattleEntity* PMember : caster->PParty->members) {
                if (distance(origin->loc.p, PMember->loc.p) <= 20.0f)
                    party.push_back(PMember);

                if (includePets && PMember->PPet != nullptr && distance(origin->loc.p, PMember->PPet->loc.p) <= 20.0f)
                    party.push_back(PMember->PPet);

                if (!PMember->PAlly.empty()) {
                    for (CBattleEntity* PAlly : PMember->PAlly) {
                        if (distance(origin->loc.p, PAlly->loc.p) <= 20.0f)
                            party.push_back(PAlly);
                    }
                }
            }
        }
        return party;
    }

    bool canMagicBurst(CBattleEntity* target, int element) {

        CStatusEffect* skillchain = target->StatusEffectContainer->GetStatusEffect(EFFECT_SKILLCHAIN);
        if (skillchain == nullptr || skillchain->GetTier() == 0)
            return false;
        int resonance = skillchain->GetPower();
        if (element < 0 || element > 12 || resonance < 0 || resonance > 16)
            return false;

        return resonanceMatches[element][resonance];
    }


    void queueJobAbility(CBattleEntity* PEntity, int abilityId, CBattleEntity* PTarget, uint32 milliseconds) {
        if (PTarget == nullptr)
            PTarget = PEntity;

        PEntity->PAI->QueueAction(queueAction_t(std::chrono::milliseconds(milliseconds), true, [PTarget, abilityId](auto PEntity) {
            if (PTarget)
                PEntity->PAI->Ability(PTarget->targid, abilityId);
        }));

    }


}



