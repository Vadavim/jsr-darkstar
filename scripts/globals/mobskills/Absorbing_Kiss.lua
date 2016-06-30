---------------------------------------------------
-- Voracious Trunk
-- Steal one effect
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);

    -- str down - chr down
    local effectType = math.random(136, 142);
    local power = (10 + mob:getMainLvl() / 5) * (1 + hard / 5);
    mob:addTP(skill:getTP() * 0.5);

    skill:setMsg(MobDrainAttribute(mob, target, effectType, 10, 3, 120));
    if (skill:getMsg() == 242 and hard > 0) then
        local power = 0; local posEffect = 0; local negEffect = 0;
        if (effectType == EFFECT_STR_DOWN) then
            negEffect = EFFECT_ATTACK_DOWN; posEffect = EFFECT_ATTACK_BOOST; power = 12 + hard * 3;
        elseif (effectType == EFFECT_VIT_DOWN) then
            negEffect = EFFECT_DEFENSE_DOWN; posEffect = EFFECT_DEFENSE_BOOST; power = 12 + hard * 3;
        elseif (effectType == EFFECT_AGI_DOWN) then
            negEffect = EFFECT_EVASION_DOWN; posEffect = EFFECT_EVASION_BOOST; power = 20 + hard * 5;
        elseif (effectType == EFFECT_DEX_DOWN) then
            negEffect = EFFECT_ACCURACY_DOWN; posEffect = EFFECT_ACCURACY_BOOST; power = 20 + hard * 5;
        elseif (effectType == EFFECT_INT_DOWN) then
            negEffect = EFFECT_MAGIC_ATK_DOWN; posEffect = EFFECT_MAGIC_ATK_BOOST; power = 20 + hard * 5;
        elseif (effectType == EFFECT_MND_DOWN) then
            negEffect = EFFECT_MAGIC_DEF_DOWN; posEffect = EFFECT_MAGIC_DEF_BOOST; power = 20 + hard * 5;
        elseif (effectType == EFFECT_CHR_DOWN) then
            negEffect = EFFECT_MAGIC_ACC_DOWN; posEffect = EFFECT_MAGIC_ACC_BOOST_II; power = 20 + hard * 5;
        end

        target:addStatusEffect(negEffect, power, 0, 60);
        target:setPendingMessage(278, negEffect);
        mob:addStatusEffect(posEffect, power, 0, 60);
        mob:setPendingMessage(280, posEffect);
    end

    return 1;
end;
