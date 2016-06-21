-----------------------------------------
-- Spell: Death
-- Instant K.O.
-----------------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/utils");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    if (target:isPC()) then
        if (target:hasStatusEffect(EFFECT_MAGIC_SHIELD) or math.random(0,99) < target:getMod(MOD_DEATHRES)) then
            spell:setMsg(75);
            return 0;
        end

        -- falls to the ground
        spell:setMsg(20);
        target:setHP(0);

        return 0;
    else
        local spellParams = {};
        spellParams.hasMultipleTargetReduction = false;
        spellParams.resistBonus = utils.clamp(1.0 - target:getMod(MOD_DEATHRES) / 100.0, 0.1, 3.0);
        spellParams.V0 = 650;
        spellParams.V50 = 830;
        spellParams.V100 = 1050;
        spellParams.V200 = 1280;
        spellParams.M0 = 3.8;
        spellParams.M50 = 3.6;
        spellParams.M100 = 2.9;
        spellParams.M200 = 2.4;

        return doElementalNuke(caster, spell, target, spellParams);

    end

end;