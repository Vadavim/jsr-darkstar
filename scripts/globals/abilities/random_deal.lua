-----------------------------------
-- Ability: Random Deal
-- Has a random effect on each party member.
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/ability");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0;
end;

-----------------------------------
-- onUseAbilityRoll
-----------------------------------


local function tryEffect(target, effect, power, bonus)
    --    if (target:hasStatusEffect(effect) or math.random(0, 99) - bonus >= 10) then
    --        return;
    --    end

    if (math.random(0, 99) - bonus <= 5) then
        target:addStatusEffect(effect, power, 0, 300);
    end
end


function onUseAbility(caster,target,ability,action)
    local bonus = caster:getLocalVar("winningStreak") / 2;
    if (bonus > 5) then
        bonus = 5;
    end

    local level = caster:getMainLvl();

    tryEffect(target, EFFECT_DEFENSE_BOOST, 12, bonus);
    tryEffect(target, EFFECT_ATTACK_BOOST, 12, bonus);
    tryEffect(target, EFFECT_ACCURACY_BOOST, 25, bonus);
    tryEffect(target, EFFECT_EVASION_BOOST, 25, bonus);
    tryEffect(target, EFFECT_MAGIC_ACC_BOOST_II, 25, bonus);
    tryEffect(target, EFFECT_MAGIC_ATK_BOOST, 20, bonus);
    tryEffect(target, EFFECT_MAGIC_DEF_BOOST, 20, bonus);
    tryEffect(target, EFFECT_MAGIC_EVASION_BOOST_II, 30, bonus);
    tryEffect(target, EFFECT_HASTE, 300, bonus);
    tryEffect(target, EFFECT_FLURRY, 30, bonus);
    tryEffect(target, EFFECT_REGEN, 1 + level / 3, bonus);
    tryEffect(target, EFFECT_REGAIN, 2, bonus);
    tryEffect(target, EFFECT_REFRESH_II, 1 + level / 20, bonus);
    tryEffect(target, EFFECT_BLINK, 6, bonus);
    tryEffect(target, EFFECT_STONESKIN, level * 10, bonus);
    tryEffect(target, EFFECT_PHALANX, 5 + level / 4, bonus);
    tryEffect(target, EFFECT_MULTI_STRIKES, 10, bonus);
    tryEffect(target, EFFECT_STORE_TP, 25, bonus);
    tryEffect(target, EFFECT_INT_BOOST_II, 10, bonus);
    tryEffect(target, EFFECT_STR_BOOST_II, 10, bonus);
    tryEffect(target, EFFECT_AGI_BOOST_II, 10, bonus);
    tryEffect(target, EFFECT_CHA_BOOST_II, 10, bonus);
    tryEffect(target, EFFECT_VIT_BOOST_II, 10, bonus);
    tryEffect(target, EFFECT_DEX_BOOST_II, 10, bonus);
    tryEffect(target, EFFECT_MND_BOOST_II, 10, bonus);
    tryEffect(target, EFFECT_MAX_HP_BOOST, 33, bonus);
    tryEffect(target, EFFECT_MAX_MP_BOOST, 33, bonus);
    tryEffect(target, EFFECT_RERAISE, 4, bonus);
end;


