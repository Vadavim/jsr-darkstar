-----------------------------------
--
--
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_RATTP, -10);
    target:addMod(MOD_ENMITY, -20);
    target:addMod(MOD_SUBTLE_BLOW, effect:getSubPower());
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
    target:delMod(MOD_RATTP, -10);
    target:delMod(MOD_ENMITY, -20);
    target:delMod(MOD_SUBTLE_BLOW, effect:getSubPower());
end;