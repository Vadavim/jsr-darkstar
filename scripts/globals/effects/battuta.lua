-----------------------------------
--
--
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/jsr_utils");


-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    effect:addMod(MOD_COUNTER, 30);
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