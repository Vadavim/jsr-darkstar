-----------------------------------
--
-- EFFECT_ATTACK_DOWN
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_ATTP,-effect:getPower());
    target:addMod(MOD_ACC,-effect:getPower() * 2);
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
    target:delMod(MOD_ATTP,-effect:getPower());
    target:delMod(MOD_ACC,-effect:getPower() * 2);
end;