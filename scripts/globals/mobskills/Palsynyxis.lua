---------------------------------------------
--  Palsynyxis
--
--  Description: Single target damage. Additional effect: Paralysis
--  Type: Physical
--  Utsusemi/Blink absorb: 1 shadows
--  Range: Unknown radial
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
    local dmgmod = math.random(1,2) + hard / 5;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);

    local typeEffect = EFFECT_PARALYSIS;

    local success = MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 25 + hard * 3, 0, 120);
    if (success == 242) then
        target:setPendingMessage(277, EFFECT_PARALYSIS);
    end

    target:delHP(dmg);
    return dmg;
end;
