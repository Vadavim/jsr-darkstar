---------------------------------------------
--  Rot Gas
--
--  Description: Inflicts enemies in an area of effect with a disease.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: 10' radial
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_DISEASE;
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    if (hard > 0) then
        typeEffect = EFFECT_PLAGUE;
    end

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 1 + hard, 0, 180));
    enmityStatusCheck(target, mob, skill, 15 + hard * 5);

    return typeEffect;
end;
