---------------------------------------------
--  Mow
--
--  Description: Deals damage in an area of effect. Additional effect: Poison
--  Type: Physical
--  Utsusemi/Blink absorb: 2-3 shadows
--  Range: Unknown radial
--  Notes: Poison can take around 10HP/tick
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
    local numhits = math.random(2,3);
    local accmod = 1;
    local dmgmod = 0.7 + hard / 10;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);

    local typeEffect = EFFECT_POISON;
    local power = mob:getMainLvl()/4 + 3;

    local success = MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, power * (1 + hard / 5), 3, 60 + hard * 15);
    if (success == 242) then
        target:setPendingMessage(277, typeEffect);
    end

    target:delHP(dmg);
    return dmg;
end;
