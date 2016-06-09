-----------------------------------
--
--     EFFECT_CAMOUFLAGE
--     
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_ENMITY,-25);
    target:addMod(MOD_SUBTLE_BLOW, 15);
    target:addMod(MOD_STORETP,effect:getSubPower());
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
    target:delMod(MOD_ENMITY,-25);
    target:delMod(MOD_SUBTLE_BLOW, 15);
    target:delMod(MOD_STORETP,effect:getSubPower());
end;
