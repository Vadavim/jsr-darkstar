-----------------------------------
--
-- 	EFFECT_POISON
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    
    if (target:getSystem() == SYSTEM_BEASTMEN) then
        effect:setPower(math.floor(effect:getPower() * 1.5));
    end;

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
	target:delMod(MOD_REGEN_DOWN, effect:getPower());
end;