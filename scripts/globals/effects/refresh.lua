-----------------------------------
--
--  EFFECT_REGEN
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_REFRESH, effect:getPower());
    target:addMod(MOD_CONSERVE_MP, effect:getSubPower());
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
    target:delMod(MOD_REFRESH, effect:getPower());
    target:delMod(MOD_CONSERVE_MP, effect:getSubPower());
end;