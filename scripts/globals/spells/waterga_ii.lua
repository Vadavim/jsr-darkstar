-----------------------------------------
-- Spell: Waterga II
-- Deals water damage to enemies within area of effect.
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
    spellParams.V0 = 290;
    spellParams.V50 = 475;
    spellParams.V100 = 620;
    spellParams.V200 = 815;
    spellParams.M0 = 3.7;
    spellParams.M50 = 2.9;
    spellParams.M100 = 1.95;
    spellParams.M200 = 1;

    return doElementalNuke(caster, spell, target, spellParams);
end;
