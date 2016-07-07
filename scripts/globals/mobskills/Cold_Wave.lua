---------------------------------------------
--  Cold Wave
--
--  Description: Deals ice damage that lowers Agility and gradually reduces HP of enemies within range.
--  Type: Magical (Ice)
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
    local typeEffect = EFFECT_FROST;

    local power = (mob:getMainLvl()/5 *.6 + 6) * (1 + hard / 5);

    local success = MobStatusEffectMove(mob, target, typeEffect, power, 3, 60);
    if (success == 242) then
        target:setPendingMessage(278, typeEffect);
    end
    if (hard > 0) then
        success = MobStatusEffectMove(mob, target, EFFECT_PARALYSIS, 15 + hard * 2, 3, 60);
        if (success == 242) then
            target:setPendingMessage(278, EFFECT_PARALYSIS);
        end
    end

    local dmgmod = 1 + hard / 10;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*2,ELE_ICE,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_ICE,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
