-----------------------------------------
-- Spell: Quake
-- Deals earth damage to an enemy and lowers its resistance against wind.
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
    spellParams.resistBonus = 20;
    spellParams.V0 = 700;
    spellParams.V50 = 800;
    spellParams.V100 = 900;
    spellParams.V200 = 1100;
    spellParams.M0 = 2;
    spellParams.M50 = 2;
    spellParams.M100 = 2;
    spellParams.M200 = 2;

    target:addStatusEffect(EFFECT_MAGIC_DEF_DOWN_II, 5, 0, 45);
    local effect = target:getStatusEffect(EFFECT_MAGIC_DEF_DOWN_II)
    if (effect ~= nil) then
        effect:addMod(MOD_WINDRES, -30);
        effect:addMod(MOD_WINDDEF, -25);
        target:addMod(MOD_WINDRES, -30);
        target:addMod(MOD_WINDDEF, -25);
    end

    return doElementalNuke(caster, spell, target, spellParams);
end;
