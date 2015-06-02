-----------------------------------
--
-- 	EFFECT_CHOKE
-- 	
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    --Worms
    if (target:getFamily() == 258) then
        effect:setPower(math.floor(effect:getPower() * 1.5));
        target:addMod(MOD_FASTCAST, -25);
    end
	target:addMod(MOD_VIT, -getElementalDebuffStatDownFromDOT(effect:getPower()));
	target:addMod(MOD_REGEN_DOWN, effect:getPower());
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
	target:delMod(MOD_VIT, -getElementalDebuffStatDownFromDOT(effect:getPower()));
	target:delMod(MOD_REGEN_DOWN, effect:getPower());
    
    --Worms
    if (target:getFamily() == 258) then
        target:delMod(MOD_FASTCAST, -25);
    end
end;