-----------------------------------------
-- Spell: Blink
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
    local subPower = caster:getSkillLevel(ENHANCING_MAGIC_SKILL) / 15;

    local shadows = 2;
    shadows, duration = applyEmbolden(caster, shadows, duration);

    if (caster:hasStatusEffect(EFFECT_PERPETUANCE)) then
        duration = duration * 2;
    end

    if (caster:hasStatusEffect(EFFECT_RAPTURE)) then
        shadows = shadows + 1;
    end


    if ((caster:getID() == target:getID()) and target:getEffectsCount(EFFECT_FLABRA) >= 1) then
        shadows = shadows + 1;
        subPower = subPower + 10;
    end

    if (target:addStatusEffect(EFFECT_BLINK, shadows, 0, duration, 0, subPower)) then
        spell:setMsg(230);
    else
        spell:setMsg(75);
    end

    return EFFECT_BLINK;
end;