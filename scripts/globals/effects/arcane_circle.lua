-----------------------------------
--
--     EFFECT_ARCANE_CIRCLE
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
   local power = effect:getPower();
   target:addMod(MOD_ARCANA_KILLER, power);
   target:addMod(MOD_DARKRES, power * 5);
   target:addMod(MOD_CURSERES, power * 5);
   target:addMod(MOD_DARKDEF, 60);
   target:addMod(MOD_DARKACC, 4 + power * 2);
   target:addMod(MOD_MATT, 2 + power);
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
   target:delMod(MOD_ARCANA_KILLER, power);
   target:delMod(MOD_DARKRES, power * 5);
   target:delMod(MOD_CURSERES, power * 5);
   target:delMod(MOD_DARKDEF, 60);
   target:delMod(MOD_DARKACC, 4 + power * 2);
   target:delMod(MOD_MATT, 2 + power);
end;
