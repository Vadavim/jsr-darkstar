
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1.0;

    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*2.5,ELE_ICE,dmgmod,TP_MAB_BONUS,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_ICE,MOBPARAM_IGNORE_SHADOWS);

    mob:addStatusEffect(EFFECT_PHYSICAL_SHIELD, 1, 0, 20);
--    mob:setPendingMessage(279, EFFECT_PHYSICAL_SHIELD);


    target:delHP(dmg);


    return dmg;
end;
