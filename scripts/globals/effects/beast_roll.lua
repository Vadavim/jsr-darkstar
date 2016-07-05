-----------------------------------
--
--
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addPetMod(MOD_ATTP, effect:getPower());
    target:addPetMod(MOD_DEFP, effect:getPower());
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
    target:delPetMod(MOD_ATTP, effect:getPower());
    target:delPetMod(MOD_DEFP, effect:getPower());
end;