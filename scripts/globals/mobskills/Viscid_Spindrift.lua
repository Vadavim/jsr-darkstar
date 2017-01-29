
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/globals/magic");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1.0;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*2,ELE_WATER,dmgmod,TP_MAB_BONUS,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WATER,MOBPARAM_IGNORE_SHADOWS);

    local success = MobStatusEffectMove(mob, target, EFFECT_WEIGHT, 80, 0, 45);
    if (success == 242) then
        target:setPendingMessage(277, EFFECT_WEIGHT);
    end
    success = MobStatusEffectMove(mob, target, EFFECT_SLOW, 200, 0, 45);
    if (success == 242) then
        target:setPendingMessage(277, EFFECT_SLOW);
    end


    target:delHP(dmg);
    return dmg;
end;
