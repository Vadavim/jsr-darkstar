-----------------------------------
--
--     EFFECT_SHOCK
--     
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_REGEN_DOWN, effect:getPower());
    target:addMod(MOD_MND, -getElementalDebuffStatDownFromDOT(effect:getPower()));
    target:addMod(MOD_THUNDERRES, -15);
    target:addMod(MOD_THUNDERDEF, -20);
    target:addMod(MOD_WATERRES, -15);
    target:addMod(MOD_WATERDEF, -20);
    target:addMod(MOD_REGAIN_DOWN, 2);
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
    target:delMod(MOD_REGAIN_DOWN, 2);
    target:delMod(MOD_REGEN_DOWN, effect:getPower());
    target:delMod(MOD_MND, -getElementalDebuffStatDownFromDOT(effect:getPower()));
    target:delMod(MOD_THUNDERRES, -15);
    target:delMod(MOD_THUNDERDEF, -20);
    target:delMod(MOD_WATERRES, -15);
    target:delMod(MOD_WATERDEF, -20);
end;