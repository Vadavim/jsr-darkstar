-----------------------------------------
-- Spell: Water
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
    spellParams.V0 = 110;
    spellParams.V50 = 280;
    spellParams.V100 = 400;
    spellParams.V200 = 540;
    spellParams.M0 = 3.4;
    spellParams.M50 = 2.4;
    spellParams.M100 = 1.4;
    spellParams.M200 = 0.5;

    return doElementalNuke(caster, spell, target, spellParams);
end;
