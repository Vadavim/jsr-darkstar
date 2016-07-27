---------------------------------------------
--  Lateral Slash
--
--  Description: Laterally slashes a single target. Additional effect: Defense Down
--  Type: Physical
--  Utsusemi/Blink absorb: 1 shadow
--  Range: Melee
--  Notes: Reduces defense by 75%.  Can be removed with Monk Job Ability Counterstance.
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
    local duration = 45 * fTP(skill:getTP(), 1, 1.5, 2) * (1 + hard / 4)


    local numhits = 1;
    local accmod = 1.2;
    local dmgmod = 2.3 + hard / 6;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);

    local typeEffect = EFFECT_DEFENSE_DOWN;
    local success = MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 75, 0, duration);
    if (success == 242) then
        target:setPendingMessage(278, EFFECT_DEFENSE_DOWN);
    end



    target:delHP(dmg);
    return dmg;
end;
