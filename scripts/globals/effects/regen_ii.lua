-----------------------------------
--
--     EFFECT_REGEN
--     
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_REGEN, effect:getPower());
    target:addMod(MOD_CURE_POTENCY_RCVD, effect:getSubPower());
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
    target:delMod(MOD_REGEN, effect:getPower());
    target:delMod(MOD_CURE_POTENCY_RCVD, effect:getSubPower());
end;