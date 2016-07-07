---------------------------------------------------
-- Shadow Claw
-- Deals damage to a single target. Additional effect: Blindness
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
    local dmgmod = 2.7 + hard / 10;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);

    local typeEffect = EFFECT_BLINDNESS;

    local success = MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 20 + hard * 4, 0, 120);
    if (success == 242) then
        target:setPendingMessage(277, typeEffect);
    end
    if (hard > 0) then
        success = MobPhysicalStatusEffectMove(mob, target, skill, EFFECT_CURSE_I, 20 + hard * 5, 0, 120);
        if (success == 242) then
            target:setPendingMessage(277, EFFECT_CURSE_I);
        end
    end

    target:delHP(dmg);
    return dmg;
end;
