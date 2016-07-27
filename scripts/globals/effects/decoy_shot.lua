-----------------------------------
--
--     EFFECT_MIGHTY_STRIKES
--     
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
target:addMod(MOD_ACC, -20)
target:addMod(MOD_EVASION, -20)
target:addMod(MOD_MEVA, -20)
target:addMod(MOD_ENEMYCRITRATE, 5)
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
    target:delMod(MOD_ACC, -20)
    target:delMod(MOD_EVASION, -20)
    target:delMod(MOD_MEVA, -20)
    target:delMod(MOD_ENEMYCRITRATE, 5)
end;