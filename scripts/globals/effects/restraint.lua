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
    target:addMod(MOD_STORETP, 50);
    target:addMod(MOD_ATTP, -35);
    target:addMod(MOD_ACC, 20);
    target:addMod(MOD_SUBTLE_BLOW, 50);
    target:addMod(MOD_CRITHITRATE, -10);
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
    target:delMod(MOD_STORETP, 50);
    target:delMod(MOD_ACC, 20);
    target:delMod(MOD_ATTP, -35);
    target:delMod(MOD_CRITHITRATE, -10);
    target:delMod(MOD_SUBTLE_BLOW, 50);
end;