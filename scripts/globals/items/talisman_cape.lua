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
        if (effect:getSubType() == 15485) then
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
        target:addStatusEffect(EFFECT_ENCHANTMENT,0,0,1800,15485);
    else
        target:addStatusEffect(EFFECT_ENCHANTMENT,0,0,1800,15485);
    end;
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_MP, 12);
    target:addMod(MOD_ENMITY, -2);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_MP, 12);
    target:delMod(MOD_ENMITY, -2);
end;