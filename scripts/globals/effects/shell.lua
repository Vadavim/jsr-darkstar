-----------------------------------
--
--  EFFECT_SHELL
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
   target:addMod(MOD_DMGMAGIC,-effect:getPower());
   target:addMod(MOD_DARK_NULL,effect:getSubPower());
   target:addMod(MOD_LIGHT_NULL,effect:getSubPower());
   target:addMod(MOD_FIRE_NULL,effect:getSubPower());
   target:addMod(MOD_ICE_NULL,effect:getSubPower());
   target:addMod(MOD_LTNG_NULL,effect:getSubPower());
   target:addMod(MOD_WIND_NULL,effect:getSubPower());
   target:addMod(MOD_EARTH_NULL,effect:getSubPower());
   target:addMod(MOD_WATER_NULL,effect:getSubPower());
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
   target:delMod(MOD_DMGMAGIC,-effect:getPower());
   target:addMod(MOD_DARK_NULL,effect:getSubPower());
   target:addMod(MOD_LIGHT_NULL,effect:getSubPower());
   target:addMod(MOD_FIRE_NULL,effect:getSubPower());
   target:addMod(MOD_ICE_NULL,effect:getSubPower());
   target:addMod(MOD_LTNG_NULL,effect:getSubPower());
   target:addMod(MOD_WIND_NULL,effect:getSubPower());
   target:addMod(MOD_EARTH_NULL,effect:getSubPower());
   target:addMod(MOD_WATER_NULL,effect:getSubPower());
end;