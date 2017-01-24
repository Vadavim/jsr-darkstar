-----------------------------------------
-- Spell: Thundaga II
-- Deals lightning damage to enemies within area of effect.
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
    spellParams.V0 = 450;
    spellParams.V50 = 575;
    spellParams.V100 = 700;
    spellParams.V200 = 875;
    spellParams.M0 = 2.5;
    spellParams.M50 = 2.5;
    spellParams.M100 = 1.75;
    spellParams.M200 = 1;

    return doElementalNuke(caster, spell, target, spellParams);
end;
