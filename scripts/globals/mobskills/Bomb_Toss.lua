require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1;
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    if (hard > 0) then
        local power = (1 + mob:getMainLvl() / 10) * (1 + hard / 5);
        local success = MobStatusEffectMove(mob, target, EFFECT_BURN, power, 0, 60);
        print("I got here");
        if (success == 242) then
            target:setPendingMessage(277, EFFECT_BURN);
        end
    end


    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,ELE_FIRE,dmgmod,TP_MAB_BONUS,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_FIRE,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
