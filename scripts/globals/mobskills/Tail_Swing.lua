---------------------------------------------
--  Tail Swing
--
--  Description: Deals damage to a single target. Additional effect: Bind
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
    local accmod = 1.2;
    local dmgmod = 1 + hard / 6;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);

    local typeEffect = EFFECT_BIND;
    local success = MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, 30);
    if (success == 242) then
        target:setPendingMessage(277, typeEffect);
    end

    if (hard > 0) then
        mob:addTP(250 + 100 * hard);

    end


    target:delHP(dmg);
    return dmg;
end;
