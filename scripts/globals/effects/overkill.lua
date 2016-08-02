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
    target:addMod(MOD_SNAP_SHOT, 33);
    target:addMod(MOD_RAPID_SHOT, 33);
    target:addMod(MOD_CRITHITRATE, 15);
    target:addMod(MOD_RACC, -40);
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
    target:delMod(MOD_SNAP_SHOT, 33);
    target:delMod(MOD_RAPID_SHOT, 33);
    target:delMod(MOD_CRITHITRATE, 15);
    target:delMod(MOD_RACC, -40);
end;
