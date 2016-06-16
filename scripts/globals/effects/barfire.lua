-----------------------------------
--
--  EFFECT_BARFIRE
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FIRERES,effect:getPower());
    target:addMod(MOD_FIRE_ABSORB,effect:getSubPower());
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
    target:delMod(MOD_FIRERES,effect:getPower());
    target:delMod(MOD_FIRE_ABSORB,effect:getSubPower());
end;