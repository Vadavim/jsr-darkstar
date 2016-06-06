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
    target:addMod(MOD_CRITHITRATE, effect:getPower());
    target:addMod(MOD_PARRY, effect:getPower());
    target:addMod(MOD_TACTICAL_PARRY, effect:getPower() * 2);
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
    target:delMod(MOD_CRITHITRATE, effect:getPower());
    target:delMod(MOD_PARRY, effect:getPower());
    target:delMod(MOD_TACTICAL_PARRY, effect:getPower() * 2);
end;