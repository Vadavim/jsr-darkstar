---------------------------------------------
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (mob:hasStatusEffect(EFFECT_ATTACK_BOOST)) then
        return 1;
    end

    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local typeEffect = EFFECT_TERROR;
    local duration = 45 * fTP(skill:getTP(), 1, 1.5, 2) * (1 + hard / 5)

    if (hard > 0) then
        mob:addTP(skill:getTP() * 0.5);
    end

    skill:setMsg(MSG_BUFF);
    mob:addStatusEffect(EFFECT_ATTACK_BOOST, 20 + hard * 5, 0, duration);
    local effect = mob:getStatusEffect(EFFECT_ATTACK_BOOST);
    if (effect ~= nil) then
        mob:addMod(MOD_STORETP, 300 + hard * 100);
        effect:addMod(MOD_STORETP, 300 + hard * 100);
    end



    return EFFECT_ATTACK_BOOST;
end;