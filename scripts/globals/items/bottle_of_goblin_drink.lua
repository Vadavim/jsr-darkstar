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
    target:addMod(MOD_MEVA, 20);
    target:addMod(MOD_CHR, -10);
    target:delMod(MOD_VIRUSRES, 12);
    target:delMod(MOD_DEATHRES, 12);
    target:delMod(MOD_BLINDRES, 12);
    target:delMod(MOD_SILENCERES, 12);
    target:delMod(MOD_PARALYZERES, 12);
    target:delMod(MOD_CHARMRES, 12);
    target:delMod(MOD_SLOWRES, 12);
    target:delMod(MOD_BINDRES, 12);
    target:delMod(MOD_GRAVITYRES, 12);
    target:delMod(MOD_PETRIFYRES, 12);
    target:delMod(MOD_SLEEPRES, 12);
    target:delMod(MOD_STUNRES, 12);
    target:delMod(MOD_POISONRES, 12);
    target:delMod(MOD_CURSERES, 12);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_MPHEAL, 1);
    target:delMod(MOD_MEVA, 20);
    target:delMod(MOD_CHR, -10);
    target:delMod(MOD_VIRUSRES, 12);
    target:delMod(MOD_DEATHRES, 12);
    target:delMod(MOD_BLINDRES, 12);
    target:delMod(MOD_SILENCERES, 12);
    target:delMod(MOD_PARALYZERES, 12);
    target:delMod(MOD_CHARMRES, 12);
    target:delMod(MOD_SLOWRES, 12);
    target:delMod(MOD_BINDRES, 12);
    target:delMod(MOD_GRAVITYRES, 12);
    target:delMod(MOD_PETRIFYRES, 12);
    target:delMod(MOD_SLEEPRES, 12);
    target:delMod(MOD_STUNRES, 12);
    target:delMod(MOD_POISONRES, 12);
    target:delMod(MOD_CURSERES, 12);
end;
