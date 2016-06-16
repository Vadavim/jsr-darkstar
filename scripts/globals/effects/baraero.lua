-----------------------------------
--
--  EFFECT_BARAERO
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_WINDRES,effect:getPower());
    target:addMod(MOD_WIND_ABSORB,effect:getSubPower());
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
    target:delMod(MOD_WINDRES,effect:getPower());
    target:delMod(MOD_WIND_ABSORB,effect:getSubPower());
end;