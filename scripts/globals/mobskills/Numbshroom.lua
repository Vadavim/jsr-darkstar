---------------------------------------------------
-- Queasyshroom
-- Additional effect: Fires a mushroom cap, dealing damage to a single target. Additional effect: paralysis.
-- Range is 14.7 yalms.
-- Piercing damage Ranged Attack.
-- Secondary modifiers: INT: 20%.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (mob:getMobMod(MOBMOD_VAR) == 1) then
        return 0;
    end
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)

    mob:setMobMod(MOBMOD_VAR, 2);
    local numhits = 1;
    local accmod = 1.25;
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local dmgmod = 2 + hard / 4;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_PIERCE,info.hitslanded);
    local tp = skill:getTP();
    local duration = 90 * fTP(tp, 1, 1.5, 2) * (1 + hard / 5)
    

    local typeEffect = EFFECT_PARALYSIS;

    local success = MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 35 + hard * 2, 0, duration);
    if (success == 242) then
        target:setPendingMessage(277, EFFECT_PARALYSIS);
    end

    target:delHP(dmg);
    return dmg;
end;
