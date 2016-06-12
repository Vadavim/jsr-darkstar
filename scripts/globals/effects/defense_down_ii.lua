-----------------------------------
--
-- EFFECT_DEFENSE_DOWN
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    if (effect:getPower()>100) then
        effect:setPower(50);
    end
    target:addMod(MOD_DEFP,-effect:getPower());
    target:addMod(MOD_SLASHRES, -effect:getSubPower());
    target:addMod(MOD_PIERCERES, -effect:getSubPower());
    target:addMod(MOD_IMPACTRES, -effect:getSubPower());
    target:addMod(MOD_HTHRES, -effect:getSubPower());
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
    target:delMod(MOD_DEFP,-effect:getPower());
    target:delMod(MOD_SLASHRES, -effect:getSubPower());
    target:delMod(MOD_PIERCERES, -effect:getSubPower());
    target:delMod(MOD_IMPACTRES, -effect:getSubPower());
    target:delMod(MOD_HTHRES, -effect:getSubPower());
end;