-----------------------------------------
-- ID: 4155
-- Item: Remedy
-- Item Effect: This potion remedies status ailments.
--    Works on paralysis, silence, blindness, poison, and disease.
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return 0;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)

    target:delStatusEffect(EFFECT_SILENCE);
    target:delStatusEffect(EFFECT_BLINDNESS);
    target:delStatusEffect(EFFECT_POISON);
    target:delStatusEffect(EFFECT_PARALYSIS);
    target:delStatusEffect(EFFECT_AMNESIA);
    target:delStatusEffect(EFFECT_SLOW);
    target:delStatusEffect(EFFECT_ATTACK_DOWN);
    target:delStatusEffect(EFFECT_EVASION_DOWN);
    target:delStatusEffect(EFFECT_ACCURACY_DOWN);
    target:delStatusEffect(EFFECT_WEIGHT);
    target:delStatusEffect(EFFECT_BIND);
    target:delStatusEffect(EFFECT_SLEEP);
    target:delStatusEffect(EFFECT_CHARM_I);
    target:delStatusEffect(EFFECT_CHARM_II);
    target:delStatusEffect(EFFECT_PETRIFICATION);
    target:delStatusEffect(EFFECT_GRADUAL_PETRIFICATION);
    target:delStatusEffect(EFFECT_MAGIC_ACC_DOWN);
    target:delStatusEffect(EFFECT_MAGIC_ATK_DOWN);
    target:delStatusEffect(EFFECT_TERROR);
    target:delStatusEffect(EFFECT_DEFENSE_DOWN);
    target:delStatusEffect(EFFECT_MAGIC_DEF_DOWN);
    target:delStatusEffect(EFFECT_MAGIC_EVASION_DOWN);
    target:delStatusEffect(EFFECT_FLASH);
    target:delStatusEffect(EFFECT_BURN);
    target:delStatusEffect(EFFECT_RASP);
    target:delStatusEffect(EFFECT_FROST);
    target:delStatusEffect(EFFECT_CHOKE);
    target:delStatusEffect(EFFECT_DROWN);
    target:delStatusEffect(EFFECT_SHOCK);
    target:delStatusEffect(EFFECT_DIA);
    target:delStatusEffect(EFFECT_BIO);
    target:delStatusEffect(EFFECT_DISEASE);
    target:delStatusEffect(EFFECT_DOOM);
    target:delStatusEffect(EFFECT_CURSE);
end;

