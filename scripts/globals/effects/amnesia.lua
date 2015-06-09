-----------------------------------
--
--
--
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/jsr_utils");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_PARALYZE,effect:getPower());
    applyBarDurationReduction(target, effect, EFFECT_BARAMNESIA);
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