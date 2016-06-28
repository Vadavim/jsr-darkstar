-----------------------------------
--
--    EFFECT_MADRIGAL
-- getPower returns the TIER (e.g. 1,2,3,4)
-----------------------------------
require("scripts/globals/status");
-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_ACC, effect:getPower());
    target:addMod(MOD_RACC, effect:getPower());
    target:addMod(MOD_MACC, math.floor(effect:getPower() * 0.75));
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
    target:delMod(MOD_ACC, effect:getPower());
    target:delMod(MOD_RACC, effect:getPower());
    target:delMod(MOD_MACC, math.floor(effect:getPower() * 0.75));
end;