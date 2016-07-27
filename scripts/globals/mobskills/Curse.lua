---------------------------------------------
--  Curse
--
--  Description: Inflicts a curse on all targets in an area of effect.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: 15' radial
--  Notes: Curse has a very long duration.
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);

    local typeEffect = EFFECT_CURSE_I;

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 25, 0, 480));
    enmityStatusCheck(target, mob, skill, 15 + hard * 5);

    return typeEffect;
end;
