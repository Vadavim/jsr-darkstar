---------------------------------------------
--  Whirlwind
--
--  Description: Deals wind damage to enemies within range. Additional effect: VIT Down.
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
    local typeEffect = EFFECT_VIT_DOWN;

    MobStatusEffectMove(mob, target, typeEffect, 10, 3, 120);

    local dmgmod = 1 + hard / 6;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*4,ELE_WIND,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WIND,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    if (hard > 0) then
        mob:addStatusEffect(EFFECT_BLINK, 2 + hard, 0, 60);
    end

    return dmg;
end;
