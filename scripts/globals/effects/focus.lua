-----------------------------------
--
--     EFFECT_FOCUS
--     
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
   target:addMod(MOD_ACC,effect:getPower());
   target:addMod(MOD_MACC,effect:getPower());
   target:addMod(MOD_MATT,15);
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
   target:delMod(MOD_ACC,effect:getPower());
   target:delMod(MOD_MACC,effect:getPower());
   target:delMod(MOD_MATT,15);
end;