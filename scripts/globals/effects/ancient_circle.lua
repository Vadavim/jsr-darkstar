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
end;
