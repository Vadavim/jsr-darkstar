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
    target:addPetMod(MOD_MATT, effect:getPower());
    target:addPetMod(MOD_MACC, effect:getPower());
    target:addPetMod(MOD_REGEN, effect:getPower() / 2);
    target:addPetMod(MOD_REGAIN, effect:getPower() / 2);
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
    target:delPetMod(MOD_MATT, effect:getPower());
    target:delPetMod(MOD_MACC, effect:getPower());
    target:delPetMod(MOD_REGEN, effect:getPower() / 2);
    target:delPetMod(MOD_REGAIN, effect:getPower() / 2);
end;