-----------------------------------
--
-- 	EFFECT_HOLY_CIRCLE
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
   target:addMod(MOD_UNDEAD_KILLER,8);
   target:addMod(MOD_LIGHTRES, 40);
   target:addMod(MOD_LIGHTDEF, 25);
   target:addMod(MOD_LIGHTACC, 20);
   target:addMod(MOD_CURE_POTENCY, 10);
   target:addMod(MOD_UDMGPHYS, -10);
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
   target:delMod(MOD_UNDEAD_KILLER,8);
   target:delMod(MOD_LIGHTRES, 40);
   target:delMod(MOD_LIGHTDEF, 25);
   target:delMod(MOD_LIGHTACC, 20);
   target:delMod(MOD_CURE_POTENCY, 10);
   target:delMod(MOD_UDMGPHYS, -10);
end;
