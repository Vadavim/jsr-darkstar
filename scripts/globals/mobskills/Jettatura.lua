---------------------------------------------
--  Jettatura
--  Family: Hippogryph
--  Description: Enemies within a fan-shaped area originating from the caster are frozen with fear.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows 
--  Range: Cone gaze
--  Notes:
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
    local typeEffect = EFFECT_TERROR;
    local duration = 10 + hard * 2;

    skill:setMsg(MobGazeMove(mob, target, typeEffect, 1, 0, duration));
    enmityStatusCheck(target, mob, skill, 15 + hard * 5);

    return typeEffect;
end;