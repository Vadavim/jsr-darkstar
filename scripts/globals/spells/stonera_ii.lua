-----------------------------------------
-- Spell: Stone
-- Deals earth damage to an enemy.
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
    spellParams.hasMultipleTargetReduction = false;
    spellParams.resistBonus = 1.0;
    spellParams.V0 = 350;
    spellParams.V50 = 550;
    spellParams.V100 = 700;
    spellParams.V200 = 700;
    spellParams.M0 = 4;
    spellParams.M50 = 3;
    spellParams.M100 = 2;
    spellParams.M200 = 0;

    return doElementalNuke(caster, spell, target, spellParams);
end;
