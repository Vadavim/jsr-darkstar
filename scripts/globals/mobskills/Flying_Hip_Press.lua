---------------------------------------------
--  Flying Hip Press
--
--  Description: Deals Wind damage to enemies within area of effect.
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: 15' radial
--  Notes:
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

    local dmgmod = MobBreathMove(mob, target, 0.333, 1, ELE_WIND, 300);

    local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_BREATH,MOBPARAM_WIND,MOBPARAM_IGNORE_SHADOWS);
    dmg = dmg * (1 + hard / 10);
    target:delHP(dmg);
    return dmg;
end;
