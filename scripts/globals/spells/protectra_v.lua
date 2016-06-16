-----------------------------------------
-- Spell: Protectra V
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
    local meritBonus = caster:getMerit(MERIT_PROTECTRA_V);
    local duration = 1800;
    
    local power = 175 + meritBonus;
    if (meritBonus > 0) then -- certain mobs can cast this spell, so don't apply the -5 for having 0 merits.
        power = power + meritBonus - 5;
    end
    --printf("Protectra V Power: %d", power);
    
    duration = calculateDurationForLvl(duration, 75, target:getMainLvl());

    local typeEffect = EFFECT_PROTECT;
    local subPower = 0;
    if ((caster:getID() == target:getID()) and target:getEffectsCount(EFFECT_TELLUS) >= 1) then
        power = power * 1.25;
        subPower = 10;
    end
    power, duration = applyEmbolden(caster, power, duration);
    if (target:addStatusEffect(typeEffect, power, 0, duration, subPower)) then
        spell:setMsg(230);
    else
        spell:setMsg(75); -- no effect
    end

    return typeEffect;
end;
