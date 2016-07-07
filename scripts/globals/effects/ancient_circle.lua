-----------------------------------
--
--     EFFECT_ANCIENT_CIRCLE
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    local power = effect:getPower();
    target:addMod(MOD_DRAGON_KILLER,power);
    target:addMod(MOD_FIRERES, power * 5);
    target:addMod(MOD_THUNDERRES, power * 5);
    target:addMod(MOD_ICERES, power * 5);
    target:addMod(MOD_FIREATT, power);
    target:addMod(MOD_THUNDERATT, power);
    target:addMod(MOD_ICEATT, power);
    target:addMod(MOD_FIREACC, power);
    target:addMod(MOD_THUNDERACC, power);
    target:addMod(MOD_ICEACC, power);
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    local power = effect:getPower();
    target:delMod(MOD_DRAGON_KILLER,power);
    target:delMod(MOD_FIRERES, power * 5);
    target:delMod(MOD_THUNDERRES, power * 5);
    target:delMod(MOD_ICERES, power * 5);

    target:delMod(MOD_FIREATT, power);
    target:delMod(MOD_THUNDERATT, power);
    target:delMod(MOD_ICEATT, power);
    target:delMod(MOD_FIREACC, power);
    target:delMod(MOD_THUNDERACC, power);
    target:delMod(MOD_ICEACC, power);
end;
