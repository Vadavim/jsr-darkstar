-----------------------------------
--
-- 	EFFECT_FROST
-- 	
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    if (target:getSystem() == SYSTEM_LIZARD) then
        target:addMod(MOD_HASTE_MAGIC, -150);
    elseif (target:getSystem() == SYSTEM_AMORPH) then
        target:addMod(MOD_ENEMYCRITRATE, 5);
        target:addMod(MOD_DEFP, -5);
    end
	target:addMod(MOD_REGEN_DOWN, effect:getPower());
	target:addMod(MOD_MND, -getElementalDebuffStatDownFromDOT(effect:getPower()));
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
	target:delMod(MOD_MND, -getElementalDebuffStatDownFromDOT(effect:getPower()));
    
    if (target:getSystem() == SYSTEM_LIZARD) then
        target:delMod(MOD_HASTE_MAGIC, -150);
    elseif (target:getSystem() == SYSTEM_AMORPH) then
        target:delMod(MOD_ENEMYCRITRATE, 5);
        target:delMod(MOD_DEFP, -5);
    end
end;