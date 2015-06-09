-----------------------------------
--
-- EFFECT_BLINDNESS
--
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/jsr_utils");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_ACC,-effect:getPower());
    applyBarDurationReduction(target, effect, EFFECT_BARBLIND);
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
	target:delMod(MOD_ACC,-effect:getPower());
end;