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

function onUseAbility(caster,target,ability,action)
    local bonus = caster:getLocalVar("winningStreak") / 2;
    if (bonus > 10) then
        bonus = 10;
    end

    local level = caster:getMainLvl();

    tryEffect(target, EFFECT_DEFENSE_BOOST, 10, bonus);
    tryEffect(target, EFFECT_ATTACK_BOOST, 10, bonus);
    tryEffect(target, EFFECT_ACCURACY_BOOST, 20, bonus);
    tryEffect(target, EFFECT_EVASION_BOOST, 20, bonus);
    tryEffect(target, EFFECT_MAGIC_ACC_BOOST_II, 20, bonus);
    tryEffect(target, EFFECT_MAGIC_ATK_BOOST, 10, bonus);
    tryEffect(target, EFFECT_MAGIC_DEF_BOOST, 20, bonus);
    tryEffect(target, EFFECT_MAGIC_EVASION_BOOST_II, 20, bonus);
    tryEffect(target, EFFECT_HASTE, 200, bonus);
    tryEffect(target, EFFECT_FLURRY, 30, bonus);
    tryEffect(target, EFFECT_REGEN, 1 + level / 3, bonus);
    tryEffect(target, EFFECT_REGAIN, 2, bonus);
    tryEffect(target, EFFECT_REFRESH, 1 + level / 20, bonus);
    tryEffect(target, EFFECT_BLINK, 6, bonus);
    tryEffect(target, EFFECT_STONESKIN, level * 8, bonus);
    tryEffect(target, EFFECT_PHALANX, 5 + level / 4, bonus);
    tryEffect(target, EFFECT_INT_BOOST_II, 10, bonus);
    tryEffect(target, EFFECT_STR_BOOST_II, 10, bonus);
    tryEffect(target, EFFECT_AGI_BOOST_II, 10, bonus);
    tryEffect(target, EFFECT_CHA_BOOST_II, 10, bonus);
    tryEffect(target, EFFECT_VIT_BOOST_II, 10, bonus);
    tryEffect(target, EFFECT_DEX_BOOST_II, 10, bonus);
    tryEffect(target, EFFECT_MND_BOOST_II, 10, bonus);
    tryEffect(target, EFFECT_MAX_HP_BOOST, 33, bonus);
    tryEffect(target, EFFECT_MAX_MP_BOOST, 33, bonus);
    tryEffect(target, EFFECT_RERAISE, 3, bonus);
end;


function tryEffect(target, effect, power, bonus)
--    if (target:hasStatusEffect(effect) or math.random(0, 99) - bonus >= 10) then
--        return;
--    end

    if (math.random(0, 99) - bonus <= 10) then
        target:addStatusEffect(effect, power, 3, 300);
    end
end
