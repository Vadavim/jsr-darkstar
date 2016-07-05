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
    target:addPetMod(MOD_UDMGMAGIC, 100);
    target:addPetMod(MOD_UDMGPHYS, 100);
    target:addPetMod(MOD_UDMGRANGE, 100);
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
    target:delPetMod(MOD_UDMGMAGIC, 100);
    target:delPetMod(MOD_UDMGPHYS, 100);
    target:delPetMod(MOD_UDMGRANGE, 100);
end;