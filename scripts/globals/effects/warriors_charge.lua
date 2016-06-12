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
    target:addMod(MOD_DOUBLE_ATTACK, effect:getPower());
    target:addMod(MOD_PARRY, effect:getSubPower());
    target:addMod(MOD_SHIELD, effect:getSubPower());
    target:addMod(MOD_TACTICAL_PARRY, effect:getSubPower() * 2);
    target:addMod(MOD_SHIELD_MASTERY_TP, effect:getSubPower() * 2);
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
    target:delMod(MOD_DOUBLE_ATTACK, effect:getPower());
    target:delMod(MOD_PARRY, effect:getSubPower());
    target:delMod(MOD_SHIELD, effect:getSubPower());
    target:delMod(MOD_TACTICAL_PARRY, effect:getSubPower() * 2);
    target:delMod(MOD_SHIELD_MASTERY_TP, effect:getSubPower() * 2);
end;