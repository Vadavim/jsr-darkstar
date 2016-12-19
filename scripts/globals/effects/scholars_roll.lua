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
    target:addMod(MOD_CONSERVE_MP, effect:getPower() * 2);
    target:addMod(MOD_CONSERVE_INT, effect:getPower());
    target:addMod(MOD_CONSERVE_CHR, effect:getPower());
    target:addMod(MOD_CONSERVE_MND, effect:getPower());
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
    target:delMod(MOD_CONSERVE_INT, effect:getPower());
    target:delMod(MOD_CONSERVE_CHR, effect:getPower());
    target:delMod(MOD_CONSERVE_MND, effect:getPower());
end;