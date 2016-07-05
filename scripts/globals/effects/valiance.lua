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
    applyValianceMask(effect);
    effect:addMod(MOD_ABSORB_MAGDMG_TO_MP, 20);
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