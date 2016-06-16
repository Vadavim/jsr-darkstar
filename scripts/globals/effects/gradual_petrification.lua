-----------------------------------
--
--
--
-----------------------------------
require("scripts/globals/status");


-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    if (effect:getSubPower() == 0) then effect:setSubPower(20) end;
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
    local power = effect:getPower();
    if (power > effect:getSubPower()) then
        print("deleted");
        target:addStatusEffect(EFFECT_PETRIFICATION, 1, 0, 8);
        target:delStatusEffect(EFFECT_GRADUAL_PETRIFICATION);
        return;
    end

    effect:setPower(power + 1);
    effect:addMod(MOD_MOVE, -4);
    effect:addMod(MOD_EVASION, -2);
    effect:addMod(MOD_HASTE_MAGIC, -8);
    target:addMod(MOD_MOVE, -4);
    target:addMod(MOD_EVASION, -2);
    target:addMod(MOD_HASTE_MAGIC, -8);

end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
end;