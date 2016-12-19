-----------------------------------------
-- ID: 4172
-- Item: Reraiser
-- Item Effect: +100% HP
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
    local effectList = {
        {EFFECT_POTENCY, 15},
        {EFFECT_ATTACK_BOOST_II, 20},
        {EFFECT_DEFENSE_BOOST_II, 20},
        {EFFECT_ACCURACY_BOOST_II, 40},
        {EFFECT_HASTE_II, 200},
        {EFFECT_REFRESH_II, 2},
        {EFFECT_REGAIN, 5},
        {EFFECT_EVASION_BOOST_II, 40},
        {EFFECT_MAGIC_EVASION_BOOST_II, 40},
        {EFFECT_MAGIC_DEF_BOOST_II, 35},
        {EFFECT_MULTI_STRIKES, 20},
        {EFFECT_MAX_HP_BOOST, 100},
        {EFFECT_MAX_MP_BOOST, 100},
        {EFFECT_STORE_TP, 35},
        {EFFECT_MAGIC_ACC_BOOST_II, 40},
        {EFFECT_BLINK, 10}
    };
    local duration = 900;
    target:delStatusEffect(EFFECT_POTENCY);
    target:addStatusEffect(EFFECT_POTENCY,10,0,duration);
end;
