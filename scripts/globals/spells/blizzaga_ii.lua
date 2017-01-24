-----------------------------------------
-- Spell: Blizzaga II
-- Deals ice damage to enemies within area of effect.
-----------------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0;
end;

function onSpellCast(caster, target, spell)
    local spellParams = {};
    spellParams.hasMultipleTargetReduction = true;
    spellParams.resistBonus = 1.0;
    spellParams.V0 = 410;
    spellParams.V50 = 550;
    spellParams.V100 = 680;
    spellParams.V200 = 860;
    spellParams.M0 = 2.8;
    spellParams.M50 = 2.6;
    spellParams.M100 = 1.8;
    spellParams.M200 = 1;

    return doElementalNuke(caster, spell, target, spellParams);
end;
