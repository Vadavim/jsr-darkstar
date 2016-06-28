-----------------------------------
--    
--    EFFECT_MINUET
--
-----------------------------------
require("scripts/globals/status");
-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_ATT, effect:getPower());
    target:addMod(MOD_RATT, effect:getPower());
    target:addMod(MOD_MATT, effect:getPower() / 3);
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
    target:delMod(MOD_ATT, effect:getPower());
    target:delMod(MOD_RATT, effect:getPower());
    target:delMod(MOD_MATT, effect:getPower() / 3);
end;
