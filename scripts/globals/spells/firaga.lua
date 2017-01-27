-----------------------------------------
-- Spell: Firaga
-- Deals fire damage to enemies within area of effect.
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
    spellParams.V0 = 140;
    spellParams.V50 = 290;
    spellParams.V100 = 400;
    spellParams.V200 = 520;
    spellParams.M0 = 3.00;
    spellParams.M50 = 2.2;
    spellParams.M100 = 1.2;
    spellParams.M200 = 0.5;

    return doElementalNuke(caster, spell, target, spellParams);
end;
