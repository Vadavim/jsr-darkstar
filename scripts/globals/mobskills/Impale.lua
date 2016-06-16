---------------------------------------------
--  Impale
--
--  Description: Deals damage to a single target. Additional effect: Paralysis
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
    local tp = skill:getTP();
    local duration =  90 * fTP(tp, 1, 1.5, 2) * (1 + hard / 5)


    local numhits = 1;
    local accmod = 1;
    local dmgmod = 2.3;

    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES);

    local shadows = info.hitslanded;
    local power = 20 + hard * 2;

    if (hard > 0) then
        shadows = MOBPARAM_IGNORE_SHADOWS;
    end

    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_PIERCE,shadows);

    local typeEffect = EFFECT_PARALYSIS;



    local success = MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, power, 0, duration);

    if (success == 242) then
        target:setPendingMessage(277, typeEffect);
    end

    if (hard > 0) then
        local success2 = MobPhysicalStatusEffectMove(mob, target, skill, EFFECT_POISON, 1 + (mob:getMainLvl() / 6) * (1 + hard / 4), 0, duration);
        if (success2 == 242) then
            target:setPendingMessage(277, EFFECT_POISON);
        end
    end

    target:delHP(dmg);
    return dmg;
end;
