---------------------------------------------
--  Suction
--
--  Description: Deals damage to a single target. Additional effect: Stun
--  Type: Physical
--  Utsusemi/Blink absorb: 1 shadow
--  Range: Melee
--  Notes: Stun doesn't always occur.
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
    local numhits = 1;
    local accmod = 1;
    local dmgmod = 2.2 + hard / 5;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,info.hitslanded);

    local typeEffect = EFFECT_STUN;

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, 4 + skill:getTP() / 1000);
    if (dmg > 0 and hard > 0) then
        local effect = target:stealStatusEffect();

        if (effect ~= nil) then
            mob:addStatusEffect(effect:getType(), effect:getPower(), effect:getTickCount(), effect:getDuration());
        end
    end



    target:delHP(dmg);
    return dmg;
end;
