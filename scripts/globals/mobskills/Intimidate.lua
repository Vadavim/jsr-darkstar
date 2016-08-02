---------------------------------------------------
-- Intimidate
-- Inflicts slow on targets in a fan-shaped area of effect.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (target:hasStatusEffect(EFFECT_SLOW)) then
        return 1;
    end

    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    if (hard > 0) then
        skill:setActivationTime(750);
    else
        skill:setActivationTime(1500);
    end
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local duration = 90 * fTP(skill:getTP(), 1, 1.5, 2) * (1 + hard / 5)
    local typeEffect = EFFECT_SLOW;

    skill:setMsg(MobGazeMove(mob, target, typeEffect, 128 + hard * 15, 0, duration));
    enmityStatusCheck(target, mob, skill, 15 + hard * 5);
    if (skill:getMsg() == MSG_ENFEEB_IS and hard > 0) then
        target:delTP(200 + 150 * hard);
    end

    return typeEffect;
end;
