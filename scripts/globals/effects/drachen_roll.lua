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
    target:addPetMod(MOD_ACC, effect:getPower());
    target:addPetMod(MOD_FIRERES, effect:getPower());
    target:addPetMod(MOD_FIREACC, effect:getPower());
    target:addPetMod(MOD_FIREATT, effect:getPower() / 2);
    target:addPetMod(MOD_ICERES, effect:getPower());
    target:addPetMod(MOD_ICEACC, effect:getPower());
    target:addPetMod(MOD_ICEATT, effect:getPower() / 2);
    target:addPetMod(MOD_THUNDERRES, effect:getPower());
    target:addPetMod(MOD_THUNDERACC, effect:getPower());
    target:addPetMod(MOD_THUNDERATT, effect:getPower() / 2);
    target:addPetMod(MOD_FIREDEF, effect:getPower());
    target:addPetMod(MOD_ICEDEF, effect:getPower() * 2);
    target:addPetMod(MOD_THUNDERDEF, effect:getPower() * 2);
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
    target:delPetMod(MOD_ACC, effect:getPower());
    target:delPetMod(MOD_FIRERES, effect:getPower());
    target:delPetMod(MOD_FIREACC, effect:getPower());
    target:delPetMod(MOD_FIREATT, effect:getPower() / 2);
    target:delPetMod(MOD_ICERES, effect:getPower());
    target:delPetMod(MOD_ICEACC, effect:getPower());
    target:delPetMod(MOD_ICEATT, effect:getPower() / 2);
    target:delPetMod(MOD_THUNDERRES, effect:getPower());
    target:delPetMod(MOD_THUNDERACC, effect:getPower());
    target:delPetMod(MOD_THUNDERATT, effect:getPower() / 2);
    target:delPetMod(MOD_FIREDEF, effect:getPower());
    target:delPetMod(MOD_ICEDEF, effect:getPower() * 2);
    target:delPetMod(MOD_THUNDERDEF, effect:getPower() * 2);
end;