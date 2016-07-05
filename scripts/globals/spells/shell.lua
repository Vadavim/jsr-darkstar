-----------------------------------------
-- Spell: Shell
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local power = 9;
    local duration = 1800;

    duration = calculateDurationForLvl(duration, 18, target:getMainLvl());
    if (caster:hasStatusEffect(EFFECT_PERPETUANCE)) then
        duration = duration * 2;
    end

   local subPower = 0
    if ((caster:getID() == target:getID()) and target:getEffectsCount(EFFECT_GELUS) >= 1) then
        power = power * 1.25;
        subPower = 10;
    end
    power, duration = applyEmbolden(caster, power, duration);

    local typeEffect = EFFECT_SHELL;
    if (target:addStatusEffect(typeEffect, power, 0, duration, 0, subPower)) then
        spell:setMsg(230);
    else
        spell:setMsg(75); -- no effect
    end

    return typeEffect;
end;
