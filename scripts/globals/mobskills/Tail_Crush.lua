---------------------------------------------
--  Tail Crush
--
--  Description: Smashes a single target with its tail. Additional effect: Poison
--  Type: Physical
--  Utsusemi/Blink absorb: 1 shadow
--  Range: Melee
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
    local numhits = 1;
    local accmod = 1;
    local dmgmod = 2.5 + hard / 8;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);

    local typeEffect = EFFECT_POISON;
    local power = (mob:getMainLvl()/10 + 10) * (1 + hard / 3);
    local success = MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, power, 3, 60 + hard * 15);

    target:delHP(dmg);
    return dmg;
end;
