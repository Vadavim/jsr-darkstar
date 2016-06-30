-----------------------------------
--
--     EFFECT_LAST_RESORT
--     
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_ENMITY, -15);
    target:addMod(MOD_CONSERVE_MP, 25);
    target:addMod(MOD_FASTCAST, -50);
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
    target:delMod(MOD_ENMITY, -15);
    target:delMod(MOD_CONSERVE_MP, 25);
    target:delMod(MOD_FASTCAST, -50);
end;