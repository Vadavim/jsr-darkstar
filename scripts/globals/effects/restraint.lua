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
    target:addMod(MOD_ATTP, -25);
    target:addMod(MOD_SUBTLE_BLOW, 25);
    target:addMod(MOD_CRITHITRATE, -5);
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
    target:delMod(MOD_ATTP, -25);
    target:delMod(MOD_CRITHITRATE, -5);
    target:delMod(MOD_SUBTLE_BLOW, 25);
end;