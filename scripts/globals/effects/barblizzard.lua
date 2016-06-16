-----------------------------------
--
--  EFFECT_BARBLIZZARD
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_ICERES,effect:getPower());
    target:addMod(MOD_ICE_ABSORB,effect:getSubPower());
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
    target:delMod(MOD_ICERES,effect:getPower());
    target:delMod(MOD_ICE_ABSORB,effect:getSubPower());
end;