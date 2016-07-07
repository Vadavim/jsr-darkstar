---------------------------------------------
--  Mysterious Light
--
--  Description: Deals wind damage to enemies within range. Additional effect: Weight.
--  Type: Magical (Wind)
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
    local typeEffect = EFFECT_WEIGHT;

    local success = MobStatusEffectMove(mob, target, typeEffect, 50 + hard * 10, 0, 60 + hard * 15);
    if (success == 242) then
        target:setPendingMessage(277, EFFECT_WEIGHT);
    end

    local dmgmod = 1 + hard / 10;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3.5,ELE_WIND,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WIND,MOBPARAM_WIPE_SHADOWS);
    target:delHP(dmg);
    if (hard > 0 and dmg > 0) then
        success = MobStatusEffectMove(mob, target, EFFECT_FLASH, 100, 0, 10 + hard * 3);
        if (success == 242) then
            target:setPendingMessage(277, EFFECT_FLASH);
        end
    end

    return dmg;
end;
