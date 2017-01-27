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
    spellParams.V0 = 220;
    spellParams.V50 = 340;
    spellParams.V100 = 440;
    spellParams.V200 = 490;
    spellParams.M0 = 2.4;
    spellParams.M50 = 2.0;
    spellParams.M100 = 1.0;
    spellParams.M200 = 0.5;

    return doElementalNuke(caster, spell, target, spellParams);
end;
