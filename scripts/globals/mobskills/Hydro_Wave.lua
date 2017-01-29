
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
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*2,ELE_WATER,dmgmod,TP_MAB_BONUS,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WATER,MOBPARAM_IGNORE_SHADOWS);

    local success = MobStatusEffectMove(mob, target, EFFECT_DROWN, 1 + mob:getMainLvl() / 5, 0, 30);
    if (success == 242) then
        target:setPendingMessage(278, EFFECT_DROWN);
    end

    success = MobStatusEffectMove(mob, target, EFFECT_STR_DOWN, 30, 0, 30);
    if (success == 242) then
        target:setPendingMessage(278, EFFECT_STR_DOWN);
    end

    target:delHP(dmg);


    return dmg;
end;
