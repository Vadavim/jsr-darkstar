---------------------------------------------------
-- Queasyshroom
-- Additional effect: Poison. Duration of effect varies with TP.
-- Range is 13.5 yalms.
-- Piercing damage Ranged Attack.
-- Secondary modifiers: INT: 20%.
-- Additional Effect: Poison is 3 HP/tick.
-- Poison effect may not always process.
-- Removes all Shadow Images on the target.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (mob:getMobMod(MOBMOD_VAR) == 0) then
        return 0;
    end
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
    mob:setMobMod(MOBMOD_VAR, 1);
    local numhits = 1;
    local accmod = 1.25;
    local dmgmod = 1.5;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_PIERCE,MOBPARAM_WIPE_SHADOWS);
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local tp = skill:getTP();
    local duration = 45 * fTP(tp, 1, 1.5, 2) * (1 + hard / 5)
    


    local typeEffect = EFFECT_POISON;
    local power = (mob:getMainLvl() / 3 + 1) * (1 + hard / 4);

    local success = MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, power, 3, duration);
    if (success == 242) then
        target:setPendingMessage(277, EFFECT_POISON);
    end


    target:delHP(dmg);
    return dmg;
end;
