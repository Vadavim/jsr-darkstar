---------------------------------------------
--  Earth Pounder
--
--  Description: Deals Earth damage to enemies within area of effect. Additional effect: Dexterity Down
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: 15' radial
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
    local tp = skill:getTP();
    local duration = 120 * fTP(tp, 1, 1.5, 2) * (1 + hard / 5)

    local typeEffect = EFFECT_DEX_DOWN;
    local success = MobStatusEffectMove(mob, target, typeEffect, 10 + hard * 5, 3, duration, MOD_STR);
    if (success == 242) then
        target:setPendingMessage(277, EFFECT_DEX_DOWN);
    end

    local dmgmod = 1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,ELE_EARTH,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_EARTH,MOBPARAM_WIPE_SHADOWS);
    target:delHP(dmg);

    if (hard > 0 and dmg > 0) then
        local success = MobStatusEfectMove(mob, target, skill, EFFECT_PETRIFICATION, 4 + hard * 2);
    end

    return dmg;
end;
