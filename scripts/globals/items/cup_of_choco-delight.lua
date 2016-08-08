-----------------------------------------
-- ID: 4283
-- Item: cup_of_choco-delight
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Magic Regen While Healing 5
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
local result = 0;
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,4283);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_MPHEAL, 1);
    target:addMod(MOD_CONSERVE_MP, 10);
    target:addMod(MOD_CONSERVE_TP, 10);
    target:addMod(MOD_CURSERES, 20);
    target:addMod(MOD_DARKRES, 20);
    target:addMod(MOD_LIGHTRES, 20);
    target:addMod(MOD_DEATHRES, 20);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_MPHEAL, 1);
    target:delMod(MOD_CONSERVE_MP, 10);
    target:delMod(MOD_CONSERVE_TP, 10);
    target:delMod(MOD_CURSERES, 20);
    target:delMod(MOD_DARKRES, 20);
    target:delMod(MOD_LIGHTRES, 20);
    target:delMod(MOD_DEATHRES, 20);
end;
