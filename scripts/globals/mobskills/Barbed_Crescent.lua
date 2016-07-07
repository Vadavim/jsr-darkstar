---------------------------------------------------
-- Barbed Crescent
-- Damage. Additional Effect: Accuracy Down.
-- Area of Effect is centered around caster.
-- The Additional Effect: Accuracy Down may not always process.
-- Duration: Three minutes ?
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
    local dmgmod = 2.2;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,info.hitslanded);
    local duration = 60 * fTP(skill:getTP(), 1, 1.5, 2) * (1 + hard / 5)

    local typeEffect = EFFECT_ACCURACY_DOWN;

    local success = MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 50 + hard * 5, 0, duration);
    if (success == 242) then
        target:setPendingMessage(278, typeEffect);
    end

    target:delHP(dmg);
    return dmg;
end;
