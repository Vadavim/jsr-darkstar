---------------------------------------------
--  Poison Pick
--
--  Description: Deals damage to a single target. Additional effect: poison
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
    local duration = 60 * fTP(skill:getTP(), 1, 1.5, 2) * (1 + hard / 5)

    local numhits = 1;
    local accmod = 1;
    local dmgmod = 2;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_PIERCE,info.hitslanded);

    local typeEffect = EFFECT_POISON;
    local power = mob:getMainLvl()/5 + 3;

    local success = MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, power, 3, duration);
    if (success == 242) then
        target:setPendingMessage(277, typeEffect);
    end
    if (hard > 0) then
        local success2 = MobPhysicalStatusEffectMove(mob, target, skill, EFFECT_DISEASE, 1, 3, duration);
        if (success2 == 242) then
            target:setPendingMessage(277, EFFECT_DISEASE);
        end
    end

    target:delHP(dmg);
    return dmg;
end;
