-----------------------------------
--
--  EFFECT_BARSTONE
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_EARTHRES,effect:getPower());
    target:addMod(MOD_EARTH_ABSORB,effect:getSubPower());
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
    target:delMod(MOD_EARTHRES,effect:getPower());
    target:delMod(MOD_EARTH_ABSORB,effect:getSubPower());
end;