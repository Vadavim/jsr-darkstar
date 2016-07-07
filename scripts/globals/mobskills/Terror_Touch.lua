---------------------------------------------------
-- Terror Touch
-- Additional effect: Weakens attacks. Accuracy varies with TP.
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
    local numhits = 1;
    local accmod = 1;
    local dmgmod = 1;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_ACC_VARIES,1,2,3);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,info.hitslanded);

    local typeEffect = EFFECT_ATTACK_DOWN;

    local success = MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 75, 0, 30 + hard * 5);
    if (success == 242) then
        target:setPendingMessage(278, typeEffect);
        if (hard > 0) then
            target:addStatusEffect(EFFECT_TERROR, 1, 0, 5 + hard * 2);
            target:setPendingMessage(277, EFFECT_TERROR);
        end
    end



    target:delHP(dmg);
    return dmg;
end;
