-----------------------------------------
-- ID: 5594
-- Item: cup_of_chai_+1
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Vitality -3
-- Charisma 3
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
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,5594);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_CHR, 10);
    target:addMod(MOD_MPP, 10);
    target:addMod(MOD_SILENCERES, 20);
    target:addMod(MOD_CHARMRES, 20);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_CHR, 10);
    target:delMod(MOD_MPP, 10);
    target:delMod(MOD_SILENCERES, 20);
    target:delMod(MOD_CHARMRES, 20);
end;
