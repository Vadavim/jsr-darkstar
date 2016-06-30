-----------------------------------
--
--     EFFECT_BURN
--     
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_REGEN_DOWN, effect:getPower());
    target:addMod(MOD_INT, -getElementalDebuffStatDownFromDOT(effect:getPower()));
    target:addMod(MOD_FIRERES, -15);
    target:addMod(MOD_FIREDEF, -20);
    target:addMod(MOD_ICERES, -15);
    target:addMod(MOD_ICEDEF, -20);
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
    target:delMod(MOD_REGEN_DOWN, effect:getPower());
    target:delMod(MOD_INT, -getElementalDebuffStatDownFromDOT(effect:getPower()));
    target:delMod(MOD_FIRERES, -15);
    target:delMod(MOD_FIREDEF, -20);
    target:delMod(MOD_ICERES, -15);
    target:delMod(MOD_ICEDEF, -20);
end;