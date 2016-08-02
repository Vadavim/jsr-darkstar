-----------------------------------
--
--
--
-----------------------------------

require("scripts/globals/status");
-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_SUBTLE_BLOW, 40);
    target:addMod(MOD_ACC, 15);
    target:addMod(MOD_RACC, 15);
    target:addMod(MOD_MACC, 15);
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
    target:delMod(MOD_SUBTLE_BLOW, 40);
    target:delMod(MOD_ACC, 15);
    target:delMod(MOD_RACC, 15);
    target:delMod(MOD_MACC, 15);
end;