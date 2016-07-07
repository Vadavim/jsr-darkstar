---------------------------------------------------
-- Spikeball
-- Additional effect: Poison.
-- Range is 13.5 yalms.
-- Additional Effect: Poison is 3 HP/tick.
-- Poison effect may not always process.
-- Removes all Shadow Images on the target.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_POISON;
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local duration = 120 * fTP(skill:getTP(), 1, 1.5, 2) * (1 + hard / 5)


    local power = (1 + mob:getMainLvl() / 10) * (1 + hard / 5);

    local numhits = 1;
    local accmod = 1;
    local dmgmod = 2.1 + hard / 8;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_RANGED,MOBPARAM_PIERCE,info.hitslanded);

    local success = MobPhysicalStatusEffectMove(mob, target, typeEffect, power, 3, duration, MOD_STR);
    target:delHP(dmg);
    return dmg;
end;
