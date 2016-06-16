---------------------------------------------
--  Chomp Rush
--
--  Description: Deals damage in a threefold attack to a single target. Additional effect: slow (25%)
--  Type: Physical
--  Utsusemi/Blink absorb: 3 shadows
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


    local numhits = 3;
    local accmod = 1;
    local dmgmod = 1.1 + hard / 10;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);
    if (hard > 0) then
        if (target:hasStatusEffect(EFFECT_SLOW)) then dmg = dmg * 1.25 end;
        if (target:hasStatusEffect(EFFECT_DISEASE)) then dmg = dmg * 1.25 end;
        if (target:hasStatusEffect(EFFECT_PLAGUE)) then dmg = dmg * 1.25 end;
    end

    target:delHP(dmg);

    local typeEffect = EFFECT_SLOW;

    local success = MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 128 + hard * 25, 0, duration, MOD_VIT);
    if (success == 242) then
        target:setPendingMessage(277, typeEffect);
    end

    return dmg;
end;
