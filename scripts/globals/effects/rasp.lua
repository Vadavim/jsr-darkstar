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
    target:addMod(MOD_REFRESH_DOWN, effect:getPower() * 0.75);
    target:addMod(MOD_DEX, -getElementalDebuffStatDownFromDOT(effect:getPower()));
    target:addMod(MOD_THUNDERRES, -15);
    target:addMod(MOD_THUNDERDEF, -20);
    target:addMod(MOD_EARTHRES, -15);
    target:addMod(MOD_EARTHDEF, -20);
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
    target:delMod(MOD_REFRESH_DOWN, effect:getPower() * 0.75);
    target:delMod(MOD_DEX, -getElementalDebuffStatDownFromDOT(effect:getPower()));
    target:delMod(MOD_THUNDERRES, -15);
    target:delMod(MOD_THUNDERDEF, -20);
    target:delMod(MOD_EARTHRES, -15);
    target:delMod(MOD_EARTHDEF, -20);
end;