---------------------------------------------
--  Great Sandstorm
--
--  Description: Deals Earth damage to single target. Additional effect: Blind
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Single target
--  Notes:
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    if (mob:getMobMod(MOBMOD_VAR) == 1) then
        mob:setMobMod(MOBMOD_VAR, 0);
        return 0;
    end
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local tp = skill:getTP();
    local duration =  90 * fTP(tp, 1, 1.5, 2) * (1 + hard / 5)

    local typeEffect = EFFECT_BLINDNESS;

    local success = MobStatusEffectMove(mob, target, typeEffect, 15 + hard * 3, 0, duration);
    if (success == 242) then
        target:setPendingMessage(277, typeEffect);
    end

    if (hard > 0) then
        local power = (50 + target:getMainLvl() * 1.5) * (1 + hard / 2);
        mob:addStatusEffect(EFFECT_STONESKIN, power, 0, 30);
        mob:setPendingMessage(279, EFFECT_STONESKIN);
    end


    local dmgmod = 1 + hard / 8;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*2.5,ELE_EARTH,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_EARTH,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
