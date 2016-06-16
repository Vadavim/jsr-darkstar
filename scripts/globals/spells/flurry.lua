-----------------------------------------
-- Spell: Flurry
-----------------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)

    local power = 15;
    local duration = 180;

    if ((caster:getID() == target:getID()) and target:getEffectsCount(EFFECT_FLABRA) >= 1) then
        power = power * 1.25;
    end
    power, duration = applyEmbolden(caster, power, duration);

    if target:addStatusEffect(EFFECT_FLURRY, power, 0, duration) then
        spell:setMsg(236);
    else
        spell:setMsg(75);
    end;

    return EFFECT_FLURRY;
end;