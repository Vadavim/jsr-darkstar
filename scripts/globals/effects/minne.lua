-----------------------------------
--    
--    EFFECT_MINNE
--
-----------------------------------
require("scripts/globals/status");
-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_DEF, effect:getPower());
    target:addMod(MOD_UDMGMAGIC, effect:getPower() / 5);
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
    target:delMod(MOD_DEF, effect:getPower());
    target:delMod(MOD_UDMGMAGIC, effect:getPower() / 5);
end;