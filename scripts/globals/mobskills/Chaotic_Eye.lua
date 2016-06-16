---------------------------------------------
--  Chaotic Eye
--
--  Description: Silences an enemy.
--  Type: Magical (Wind)
--
--
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------
function onMobSkillCheck(target,mob,skill)


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
    local tp = skill:getTP();
    local duration = 60 * fTP(tp, 1, 1.5, 2) * (1 + hard / 5)

    local typeEffect = EFFECT_SILENCE;

    skill:setMsg(MobGazeMove(mob, target, typeEffect, 1, 0, duration, MOD_CHR));
    enmityStatusCheck(target, mob, skill, 15 + hard * 5);

    if (hard > 0 and skill:getMsg() == MSG_ENFEEB_IS) then
        target:delTP(150 * hard);
    end

    return typeEffect;
end;
