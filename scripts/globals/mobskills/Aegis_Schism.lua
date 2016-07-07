---------------------------------------------
--  Aegis Schism
--
--  Description: Damage varies with TP. Additional effect: defense down
--  Type: Physical (Blunt)
--
--
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
    local duration = 40 * fTP(skill:getTP(), 1, 1.5, 2) * (1 + hard / 5)

    local numhits = 1;
    local accmod = 1;
    local dmgmod = 1.5 + hard / 8;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,info.hitslanded);

    local typeEffect = EFFECT_DEFENSE_DOWN;
    local power = 75 + hard * 2;
    local success = MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, power, 0, duration);
    if (success == 242) then
        target:setPendingMessage(278, typeEffect);
    end

    target:delHP(dmg);
    return dmg;
end;
