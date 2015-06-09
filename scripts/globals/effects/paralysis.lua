-----------------------------------
--
-- EFFECT_PARALISIS
--
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/jsr_utils");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_PARALYZE,effect:getPower());
    applyBarDurationReduction(target, effect, EFFECT_BARPARALYZE);
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
	target:delMod(MOD_PARALYZE,effect:getPower());
end;