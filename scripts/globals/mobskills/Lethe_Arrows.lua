---------------------------------------------
--  Lethe Arrows
--
--  Description: Deals a ranged attack to target. Additional effect: Knockback, Bind, and Amnesia
--  Type: Ranged
--  Utsusemi/Blink absorb: Ignores Utsusemi
--  Range: Unknown
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
    local success = MobStatusEffectMove(mob, target, EFFECT_BIND, 1, 0, 20);
    if (success == 242) then
        target:setPendingMessage(277, EFFECT_BIND);
    end

    success = MobStatusEffectMove(mob, target, EFFECT_AMNESIA, 1, 0, 60);
    if (success == 242) then
        target:setPendingMessage(277, EFFECT_AMNESIA);
    end


    local numhits = 1;
    local accmod = 3;
    local dmgmod = 2;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_RANGED,MOBPARAM_PIERCE,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
