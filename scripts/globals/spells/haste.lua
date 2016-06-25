-----------------------------------------
-- Spell: Haste
-- Composure increases duration 3x
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

    local duration = 300;

    if (caster:hasStatusEffect(EFFECT_COMPOSURE) == true and caster:getID() == target:getID()) then
       duration = duration * 3;
    end

    local power = 150; -- 150/1024

    if ((caster:getID() == target:getID()) and target:getEffectsCount(EFFECT_FLABRA) >= 1) then
        power = power * 1.25;
    end
    power, duration = applyEmbolden(caster, power, duration);

    if (target:addStatusEffect(EFFECT_HASTE,power,0,duration) == false) then
        spell:setMsg(75);
    end

    return EFFECT_HASTE;
end;
