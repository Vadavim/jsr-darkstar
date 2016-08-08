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
    target:addMod(MOD_POISONRES, 20);
    target:addMod(MOD_VIRUSRES, 20);
    target:addMod(MOD_PLANTOID_KILLER, 8);
    target:addMod(MOD_VERMIN_KILLER, 8);
    target:addMod(MOD_BEAST_KILLER, 8);
    target:addMod(MOD_BIRD_KILLER, 8);
    target:addMod(MOD_EARTHRES, 20);
    target:addMod(MOD_WATERRES, 20);
    target:addMod(MOD_WINDRES, 20);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_POISONRES, 20);
    target:delMod(MOD_VIRUSRES, 20);
    target:delMod(MOD_PLANTOID_KILLER, 8);
    target:delMod(MOD_VERMIN_KILLER, 8);
    target:delMod(MOD_BEAST_KILLER, 8);
    target:delMod(MOD_BIRD_KILLER, 8);
    target:delMod(MOD_EARTHRES, 20);
    target:delMod(MOD_WATERRES, 20);
    target:delMod(MOD_WINDRES, 20);
end;
