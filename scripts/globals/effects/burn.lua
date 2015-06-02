-----------------------------------
--
-- 	EFFECT_BURN
-- 	
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    if (target:getSystem() == SYSTEM_PLANTOID) then
        effect:setPower(math.floor(effect:getPower() * 1.5));
    end;
	target:addMod(MOD_REGEN_DOWN, effect:getPower());
	target:addMod(MOD_MND, -getElementalDebuffStatDownFromDOT(effect:getPower()));

	target:addMod(MOD_REGEN_DOWN, effect:getPower());
	target:addMod(MOD_INT, -getElementalDebuffStatDownFromDOT(effect:getPower()));
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
end;