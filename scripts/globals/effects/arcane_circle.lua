-----------------------------------
--
-- 	EFFECT_ARCANE_CIRCLE
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
   target:addMod(MOD_ARCANA_KILLER, effect:getPower());
   target:addMod(MOD_DARKRES, 40);
   target:addMod(MOD_CURSERES, 40);
   target:addMod(MOD_DARKDEF, 25);
   target:addMod(MOD_DARKACC, 20);
   target:addMod(MOD_MATT, 10);
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
   target:delMod(MOD_ARCANA_KILLER, effect:getPower());
   target:delMod(MOD_DARKRES, 40);
   target:delMod(MOD_CURSERES, 40);
   target:delMod(MOD_DARKDEF, 25);
   target:delMod(MOD_DARKACC, 20);
   target:delMod(MOD_MATT, 10);
end;
