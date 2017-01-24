-----------------------------------------
-- Spell: Thundaga 
-- Deals thunder damage to enemies within area of effect.
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
    spellParams.V0 = 270;
    spellParams.V50 = 420;
    spellParams.V100 = 520;
    spellParams.V200 = 570;
    spellParams.M0 = 3.0;
    spellParams.M50 = 2.0;
    spellParams.M100 = 1.0;
    spellParams.M200 = 0.5;

    return doElementalNuke(caster, spell, target, spellParams);
end;
