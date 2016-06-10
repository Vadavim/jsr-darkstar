-----------------------------------
--
--
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_RATTP,effect:getPower());
    target:addMod(MOD_RACC,-10);
    target:addMod(MOD_ENMITY,20);
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
    target:delMod(MOD_RATTP,effect:getPower());
    target:delMod(MOD_RACC,-10);
    target:delMod(MOD_ENMITY,20);
end;