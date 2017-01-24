-----------------------------------------
-- Spell: Stonaga
-- Deals earth damage to enemies within area of effect.
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
    spellParams.V0 = 80;
    spellParams.V50 = 255;
    spellParams.V100 = 380;
    spellParams.V200 = 530;
    spellParams.M0 = 3.5;
    spellParams.M50 = 2.5;
    spellParams.M100 = 1.5;
    spellParams.M200 = 0.5;

    return doElementalNuke(caster, spell, target, spellParams);
end;
