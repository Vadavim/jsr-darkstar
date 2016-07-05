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
    spellParams.V0 = 430;
    spellParams.V50 = 600;
    spellParams.V100 = 740;
    spellParams.V200 = 740;
    spellParams.M0 = 3.4;
    spellParams.M50 = 2.8;
    spellParams.M100 = 1.9;
    spellParams.M200 = 0;

    return doElementalNuke(caster, spell, target, spellParams);
end;
