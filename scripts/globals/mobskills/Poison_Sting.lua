---------------------------------------------------
-- Poison Sting
-- Deals Water damage to targets in a fan-shaped area of effect. Additional effect: Poison
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local tp = skill:getTP();
    local duration = 60 * fTP(tp, 1, 1.5, 2) * (1 + hard / 5)


    local numhits = 1;
    local accmod = 1;
    local dmgmod = 2.5;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);

    local typeEffect = EFFECT_POISON;
    local power = (mob:getMainLvl()/10 + 3) * (1 + hard / 3);
    local success = MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, power, 3, duration, MOD_STR);
    if (success == 242) then
        target:setPendingMessage(277, EFFECT_POISON);
    end

    target:delHP(dmg);
    return dmg;
end;
