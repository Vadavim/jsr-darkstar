-----------------------------------
--
--  EFFECT_PAEON
--
-----------------------------------
require("scripts/globals/status");
-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_REGEN, effect:getPower() * 2);
    target:addMod(MOD_HPP, effect:getPower() * 20);
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
    target:delMod(MOD_REGEN, effect:getPower() * 2);
    target:delMod(MOD_HPP, effect:getPower() * 20);
end;