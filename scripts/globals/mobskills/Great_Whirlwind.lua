---------------------------------------------
--  Great Whirlwind
--
--  Description: Deals Wind damage to targets in front. Additional effect: Choke
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown cone
--  Notes:
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    if (mob:getMobMod(MOBMOD_VAR) == 0) then
        mob:setMobMod(MOBMOD_VAR, 1);
        return 0;
    end
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local tp = skill:getTP();
    local duration = 45 * fTP(tp, 1, 1.5, 2) * (1 + hard / 5)


    local typeEffect = EFFECT_CHOKE;
    local power = (mob:getMainLvl()/4*.6 + 4) * (1 + hard / 5);

    local success = MobStatusEffectMove(mob, target, typeEffect, power, 3, duration);
    if (success == 242) then
        target:setPendingMessage(277, typeEffect);
    end

    if (hard > 0) then
        mob:addStatusEffect(EFFECT_FOIL, 50 + hard * 10, 0, 30);
        mob:setPendingMessage(279, EFFECT_FOIL);
    end

    local dmgmod = 1 + hard / 8;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*2,ELE_WIND,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WIND,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
