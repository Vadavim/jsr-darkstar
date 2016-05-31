-----------------------------------
--
--     EFFECT_HOLY_CIRCLE
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
   local power = effect:getPower();
   target:addMod(MOD_UNDEAD_KILLER,power);
   target:addMod(MOD_LIGHTRES, power * 5);
   target:addMod(MOD_LIGHTDEF, 60);
   target:addMod(MOD_LIGHTACC, 4 + power * 2);
   target:addMod(MOD_LIGHTATT, 2 + power);
   target:addMod(MOD_CURE_POTENCY, 2 + power);
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
   target:delMod(MOD_UNDEAD_KILLER,power);
   target:delMod(MOD_LIGHTRES, power * 5);
   target:delMod(MOD_LIGHTDEF, 60);
   target:delMod(MOD_LIGHTACC, 4 + power * 2);
   target:delMod(MOD_LIGHTATT, 2 + power);
   target:delMod(MOD_CURE_POTENCY, 2 + power);

end;
