---------------------------------------------
--  Gloeosuccus
--
--  Description: Additional effect: Slow.  Duration of effect varies with TP.
--  Type: Physical (Blunt)
--
--
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_SLOW;
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local tp = skill:getTP();
    local duration = 90 * fTP(tp, 1, 1.5, 2) * (1 + hard / 5)

    if (hard > 0) then
        local targTP = target:getTP();
        local drain = 250 + 50 * hard;
        if (targTP < drain) then drain = targTP end
        target:delTP(drain);
        mob:addTP(drain);
    end

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 128 + hard * 15, 0, duration));
    enmityStatusCheck(target, mob, skill, 15 + hard * 5);

    return typeEffect;
end;
