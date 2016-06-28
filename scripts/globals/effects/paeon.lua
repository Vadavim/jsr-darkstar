-----------------------------------
--
--  EFFECT_PAEON
--
-----------------------------------
require("scripts/globals/status");
-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_REGEN, effect:getPower());
    target:addMod(MOD_HPHEAL, effect:getPower() * 20);
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
    target:delMod(MOD_REGEN, effect:getPower());
    target:delMod(MOD_HPHEAL, effect:getPower() * 20);
end;