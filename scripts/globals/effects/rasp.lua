-----------------------------------
--
--     EFFECT_RASP
--     
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_REGEN_DOWN, effect:getPower());
    target:addMod(MOD_DEX, -getElementalDebuffStatDownFromDOT(effect:getPower()));
    target:addMod(MOD_THUNDERRES, -10);
    target:addMod(MOD_THUNDERDEF, -10);
    target:addMod(MOD_EARTHRES, -10);
    target:addMod(MOD_EARTHDEF, -10);
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
    target:delMod(MOD_DEX, -getElementalDebuffStatDownFromDOT(effect:getPower()));
    target:delMod(MOD_THUNDERRES, -10);
    target:delMod(MOD_THUNDERDEF, -10);
    target:delMod(MOD_EARTHRES, -10);
    target:delMod(MOD_EARTHDEF, -10);
end;