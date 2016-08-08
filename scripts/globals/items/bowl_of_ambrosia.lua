-----------------------------------------
-- ID: 4511
-- Item: Bowl of Ambrosia
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Health 7
-- Magic 7
-- Strength 7
-- Dexterity 7
-- Agility 7
-- Vitality 7
-- Intelligence 7
-- Mind 7
-- Charisma 7
-- Health Regen While Healing 7
-- Magic Regen While Healing 7
-- Attack 7
-- defense 7
-- Accuracy 7
-- Evasion 7
-- Store TP 7
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
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,4511);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HPP, 7);
    target:addMod(MOD_MPP, 7);

    target:addMod(MOD_STR, 7);
    target:addMod(MOD_DEX, 7);
    target:addMod(MOD_AGI, 7);
    target:addMod(MOD_VIT, 7);
    target:addMod(MOD_INT, 7);
    target:addMod(MOD_MND, 7);
    target:addMod(MOD_CHR, 7);

    target:addMod(MOD_HPHEAL, 7);
    target:addMod(MOD_MPHEAL, 7);

    target:addMod(MOD_RATT, 7);
    target:addMod(MOD_RACC, 7);
    target:addMod(MOD_ATT, 7);
    target:addMod(MOD_DEF, 7);

    target:addMod(MOD_MACC, 7);
    target:addMod(MOD_MATT, 7);
    target:addMod(MOD_MAGIC_CRITHITRATE, 7);
    target:addMod(MOD_MAGIC_CRIT_DMG_INCREASE, 7);

    target:addMod(MOD_FASTCAST, 7);

    target:addMod(MOD_CONSERVE_MP, 7);
    target:addMod(MOD_CONSERVE_TP, 7);

    target:addMod(MOD_MDEF, 7);
    target:addMod(MOD_MEVA, 7);
    target:addMod(MOD_EVA, 7);

    target:addMod(MOD_STORETP, 7);

    target:addMod(MOD_CRIT_DMG_INCREASE, 7);
    target:addMod(MOD_CRITHITRATE, 7);

    target:addMod(MOD_SUBTLE_BLOW, 7);

    target:addMod(MOD_UDMGMAGIC, -7);
    target:addMod(MOD_UDMGPHYS, -7);
    target:addMod(MOD_UDMGRANGE, -7);
    target:addMod(MOD_UDMGBREATH, -7);

    target:addMod(MOD_VIRUSRES, 7);
    target:addMod(MOD_DEATHRES, 7);
    target:addMod(MOD_BLINDRES, 7);
    target:addMod(MOD_SILENCERES, 7);
    target:addMod(MOD_PARALYZERES, 7);
    target:addMod(MOD_CHARMRES, 7);
    target:addMod(MOD_SLOWRES, 7);
    target:addMod(MOD_BINDRES, 7);
    target:addMod(MOD_GRAVITYRES, 7);
    target:addMod(MOD_PETRIFYRES, 7);
    target:addMod(MOD_SLEEPRES, 7);
    target:addMod(MOD_STUNRES, 7);
    target:addMod(MOD_POISONRES, 7);
    target:addMod(MOD_CURSERES, 7);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HPP, 7);
    target:delMod(MOD_MPP, 7);

    target:delMod(MOD_STR, 7);
    target:delMod(MOD_DEX, 7);
    target:delMod(MOD_AGI, 7);
    target:delMod(MOD_VIT, 7);
    target:delMod(MOD_INT, 7);
    target:delMod(MOD_MND, 7);
    target:delMod(MOD_CHR, 7);

    target:delMod(MOD_HPHEAL, 7);
    target:delMod(MOD_MPHEAL, 7);

    target:delMod(MOD_RATT, 7);
    target:delMod(MOD_RACC, 7);
    target:delMod(MOD_ATT, 7);
    target:delMod(MOD_DEF, 7);

    target:delMod(MOD_MACC, 7);
    target:delMod(MOD_MATT, 7);
    target:delMod(MOD_MAGIC_CRITHITRATE, 7);
    target:delMod(MOD_MAGIC_CRIT_DMG_INCREASE, 7);

    target:delMod(MOD_FASTCAST, 7);

    target:delMod(MOD_CONSERVE_MP, 7);
    target:delMod(MOD_CONSERVE_TP, 7);

    target:delMod(MOD_MDEF, 7);
    target:delMod(MOD_MEVA, 7);
    target:delMod(MOD_EVA, 7);

    target:delMod(MOD_STORETP, 7);

    target:delMod(MOD_CRIT_DMG_INCREASE, 7);
    target:delMod(MOD_CRITHITRATE, 7);

    target:delMod(MOD_SUBTLE_BLOW, 7);

    target:delMod(MOD_UDMGMAGIC, -7);
    target:delMod(MOD_UDMGPHYS, -7);
    target:delMod(MOD_UDMGRANGE, -7);
    target:delMod(MOD_UDMGBREATH, -7);

    target:delMod(MOD_VIRUSRES, 7);
    target:delMod(MOD_DEATHRES, 7);
    target:delMod(MOD_BLINDRES, 7);
    target:delMod(MOD_SILENCERES, 7);
    target:delMod(MOD_PARALYZERES, 7);
    target:delMod(MOD_CHARMRES, 7);
    target:delMod(MOD_SLOWRES, 7);
    target:delMod(MOD_BINDRES, 7);
    target:delMod(MOD_GRAVITYRES, 7);
    target:delMod(MOD_PETRIFYRES, 7);
    target:delMod(MOD_SLEEPRES, 7);
    target:delMod(MOD_STUNRES, 7);
    target:delMod(MOD_POISONRES, 7);
    target:delMod(MOD_CURSERES, 7);
end;
