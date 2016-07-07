---------------------------------------------
--  Circle of Flames
--
--  Description: Deals damage to targets in an area of effect. Additional effect: Weight
--  Type: Physical
--  Utsusemi/Blink absorb: 1-3 shadows
--  Range: 10' radial
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

    local dmgmod = 1 + hard / 5;
    local accmod = 1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*2.2,ELE_FIRE,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_FIRE,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);

    local typeEffect = EFFECT_WEIGHT;

    local success = MobStatusEffectMove(mob, target, skill, typeEffect, 50, 0, 60);
    if (success == 242) then
        target:setPendingMessage(277, typeEffect);
    end
    if (hard > 0) then
        mob:addStatusEffect(EFFECT_BLAZE_SPIKES, (1 + mob:getMainLvl() / 4) * (1 + hard / 5), 30 + hard * 15);
        mob:setPendingMessage(280, typeEffect);
    end


    return dmg;
end;
