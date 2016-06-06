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
    target:addMod(MOD_DMG, -effect:getPower());
    target:addMod(MOD_SHIELD, effect:getPower() / 2);
    target:addMod(MOD_SHIELD_MASTERY_TP, effect:getPower() * 2);
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
    target:delMod(MOD_DMG, -effect:getPower());
    target:delMod(MOD_SHIELD, effect:getPower() / 2);
    target:delMod(MOD_SHIELD_MASTERY_TP, effect:getPower() * 2);
end;