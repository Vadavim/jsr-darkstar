---------------------------------------------
--  Stone Throw
--
--  Description: Damages a single target. Additional effect: Paralysis
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
    local duration = 45 * fTP(tp, 1, 1.5, 2) * (1 + hard / 5)



    local numhits = 1;
    local accmod = 0.8;
    local dmgmod = 2.5 + hard / 8;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_RANGED,MOBPARAM_BLUNT,info.hitslanded);

    local typeEffect = EFFECT_PARALYSIS;

    local success = MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 20 + hard * 2, 0, duration, MOD_STR);
    if (success == 242) then
        target:setPendingMessage(277, typeEffect);
    end

    if (hard > 0) then
        local power = (1 + mob:getMainLvl() / 10) * (1 + hard / 5);
        local success2 = MobPhysicalStatusEffectMove(mob, target, EFFECT_RASP, power, 0, duration, MOD_STR);
        if (success2 == 242) then
            target:setPendingMessage(277, EFFECT_RASP);
        end
    end


    target:delHP(dmg);
    return dmg;
end;
