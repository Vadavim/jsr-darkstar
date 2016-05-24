-----------------------------------
--
--     EFFECT_WARDING_CIRCLE
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
   local power = effect:getPower();
   target:addMod(MOD_DEMON_KILLER,power);
   target:addMod(MOD_SKILLCHAINBONUS, power * 2 - 6);
   target:addMod(MOD_MEVA, power * 2 - 6);
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
   target:delMod(MOD_DEMON_KILLER,power);
   target:delMod(MOD_SKILLCHAINBONUS, power * 2 - 6);
   target:addMod(MOD_MEVA, power * 2 - 6);
end;
