---------------------------------------------
--  Drill Branch
--
--  Description: Drills a single target with a branch. Additional effect: Blind
--  Type: Physical
--  Utsusemi/Blink absorb: 2-3 shadows
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
    local tp = skill:getTP();
    local duration = 60 * fTP(tp, 1, 1.5, 2) * (1 + hard / 5)


    local numhits = 1;
    local accmod = 1;
    local dmgmod = 2.5 + hard / 3;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_PIERCE,info.hitslanded*math.random(2,3));

    local typeEffect = EFFECT_BLINDNESS;

    local success = MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 15 + hard * 2, 0, duration, MOD_STR);
    if (success == 242) then
        target:setPendingMessage(277, EFFECT_BLINDNESS);
    end

    target:delHP(dmg);
    return dmg;
end;
