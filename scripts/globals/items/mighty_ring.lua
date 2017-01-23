-----------------------------------------
-- ID: 15486
-- Item: Breath Mantle
-- Item Effect: HP+18 / Enmity+3
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    local effect = target:getStatusEffect(EFFECT_ENCHANTMENT);
    if (effect ~= nil) then
        if (effect:getSubType() == 15558) then
            target:delStatusEffect(EFFECT_ENCHANTMENT);
        end;
    end;
    return 0;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    if (target:hasStatusEffect(EFFECT_ENCHANTMENT) == true) then
        target:delStatusEffect(EFFECT_ENCHANTMENT);
        target:addStatusEffect(EFFECT_ENCHANTMENT,0,0,1800,15558);
    else
        target:addStatusEffect(EFFECT_ENCHANTMENT,0,0,1800,15558);
    end;
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_ATT, 5);
    target:addMod(MOD_RATT, 5);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_ATT, 5);
    target:delMod(MOD_RATT, 5);
end;