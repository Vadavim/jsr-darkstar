---------------------------------------------
--  Scratch
--
--  Description: Strikes a single target in the face. Additional effect: Blind
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
    local dmgmod = 2.4 + hard / 6;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);

    local typeEffect = EFFECT_BLINDNESS;

    local success = MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 18 + hard * 4, 0, 120);
    if (success == 242) then
        target:setPendingMessage(277, EFFECT_BLINDNESS);
    end


    target:delHP(dmg);
    return dmg;
end;
