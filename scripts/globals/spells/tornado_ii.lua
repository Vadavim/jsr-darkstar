-----------------------------------------
-- Spell: Tornado II
-- Deals wind damage to an enemy and lowers its resistance against ice.
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
    spellParams.resistBonus = 30;
    spellParams.V0 = 800;
    spellParams.V50 = 900;
    spellParams.V100 = 1000;
    spellParams.V200 = 1200;
    spellParams.M0 = 2;
    spellParams.M50 = 2;
    spellParams.M100 = 2;
    spellParams.M200 = 2;

    target:addStatusEffect(EFFECT_MAGIC_DEF_DOWN_II, 5, 0, 60);
    local effect = target:getStatusEffect(EFFECT_MAGIC_DEF_DOWN_II)
    if (effect ~= nil) then
        effect:addMod(MOD_ICERES, -30);
        effect:addMod(MOD_ICEDEF, -25);
        target:addMod(MOD_ICERES, -30);
        target:addMod(MOD_ICEDEF, -25);
    end

    return doElementalNuke(caster, spell, target, spellParams);
end;
