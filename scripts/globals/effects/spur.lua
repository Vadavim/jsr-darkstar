-----------------------------------
--
--
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_STORETP, effect:getPower());
    target:addMod(MOD_ATTP, effect:getSubPower());
    target:addMod(MOD_MATT, effect:getSubPower());
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
    target:delMod(MOD_STORETP, effect:getPower());
    target:delMod(MOD_ATTP, effect:getSubPower());
    target:delMod(MOD_MATT, effect:getSubPower());
end;