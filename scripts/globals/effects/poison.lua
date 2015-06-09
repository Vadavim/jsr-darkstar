-----------------------------------
--
-- 	EFFECT_POISON
--
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/jsr_utils");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    
    if (target:isMob() and target:getSystem() == SYSTEM_BEASTMEN) then
        effect:setPower(math.floor(effect:getPower() * 1.5));
    end;

	target:addMod(MOD_REGEN_DOWN, effect:getPower());
    applyBarDurationReduction(target, effect, EFFECT_BARPOISON);
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