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
    target:addMod(MOD_FIRERES, -10);
    target:addMod(MOD_FIREDEF, -10);
    target:addMod(MOD_ICERES, -10);
    target:addMod(MOD_ICEDEF, -10);
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
    target:delMod(MOD_FIRERES, -10);
    target:delMod(MOD_FIREDEF, -10);
    target:delMod(MOD_ICERES, -10);
    target:delMod(MOD_ICEDEF, -10);
end;