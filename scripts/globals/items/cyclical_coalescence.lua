-----------------------------------------
-- ID: 5710
-- Item: Berry Snowcone
-- Food Effect: 5 Min, All Races
-----------------------------------------
-- MP % 30 Cap 30
-- Intelligence 1
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
result = 0;
    if (target:hasStatusEffect(EFFECT_FOOD)) then
        result = 246;
    end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,5710);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_MPP, 30);
    target:addMod(MOD_FOOD_MP_CAP, 110);
    target:addMod(MOD_INT, 7);
    target:addMod(MOD_MND, 7);
    target:addMod(MOD_LIZARD_KILLER, 7);
    target:addMod(MOD_MATT, 15);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_MPP, 30);
    target:delMod(MOD_FOOD_MP_CAP, 110);
    target:delMod(MOD_INT, 7);
    target:delMod(MOD_MND, 7);
    target:delMod(MOD_LIZARD_KILLER, 7);
    target:delMod(MOD_MATT, 15);
end;
