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
    target:addMod(MOD_SUBTLE_BLOW, effect:getPower());
    target:addMod(MOD_GUARD, effect:getPower() / 2);
    target:addMod(MOD_HPP, effect:getPower() / 2);
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
    target:delMod(MOD_SUBTLE_BLOW, effect:getPower());
    target:delMod(MOD_GUARD, effect:getPower() / 2);
    target:delMod(MOD_HPP, effect:getPower() / 2);
end;