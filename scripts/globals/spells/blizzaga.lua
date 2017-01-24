-----------------------------------------
-- Spell: Blizzaga
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
    spellParams.V0 = 220;
    spellParams.V50 = 375;
    spellParams.V100 = 480;
    spellParams.V200 = 590;
    spellParams.M0 = 3.1;
    spellParams.M50 = 2.1;
    spellParams.M100 = 1.1;
    spellParams.M200 = 0.5;

    return doElementalNuke(caster, spell, target, spellParams);
end;
