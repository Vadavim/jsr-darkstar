---------------------------------------------------
-- Beatdown
-- Deals damage to a single target. Additional effect: bind
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

    local numhits = 1;
    local accmod = 0.8;

    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local tp = skill:getTP();
    local duration = 15 * (tp / 3000) * (1 + hard / 5)

    local dmgmod = 3.8 + hard / 5;

    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,info.hitslanded);
    target:delHP(dmg);

    local typeEffect = EFFECT_BIND;

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, duration, MOD_STR);
    if (hard > 0) then
        MobPhysicalStatusEffectMove(mob, target, skill, EFFECT_STUN, 1, 0, 4 + (hard / 4), MOD_STR);
    end

    return dmg;
end;
