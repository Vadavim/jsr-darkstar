-----------------------------------
--
-- 	EFFECT_WARDING_CIRCLE
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
   target:addMod(MOD_DEMON_KILLER,8);
   target:addMod(MOD_SKILLCHAINBONUS, 10);
   target:addMod(MOD_MEVA, 10);
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
   target:delMod(MOD_DEMON_KILLER,8);
   target:delMod(MOD_SKILLCHAINBONUS, 10);
   target:addMod(MOD_MEVA, 10);
end;
