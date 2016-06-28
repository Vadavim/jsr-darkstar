-----------------------------------
--    
--    EFFECT_MAMBO
--
-----------------------------------
require("scripts/globals/status");
-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_EVA, effect:getPower());
    target:addMod(MOD_MEVA, math.floor(effect:getPower() * 0.5));
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
    target:delMod(MOD_EVA, effect:getPower());
    target:delMod(MOD_MEVA, math.floor(effect:getPower() * 0.5));
end;