-----------------------------------
--
-- 	EFFECT_NONE
-- 	
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/jsr_utils");
-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    applyBarDurationReduction(target, effect, EFFECT_BARVIRUS);
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
end;