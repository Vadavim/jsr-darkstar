---------------------------------------------
--  Blitzstrahl
--
--  Description: Deals lightning damage to an enemy. Additional effect: "Stun."
--  Type: Magical (Lightning)
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
    local typeEffect = EFFECT_STUN;
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);

    MobStatusEffectMove(mob, target, typeEffect, 1, 0, 4);

    local dmgmod = 1 + hard / 10;
    local accmod = 1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*5,ELE_THUNDER,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_THUNDER,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    if (hard > 0) then
        local success = MobStatusEffectMove(mob, target, EFFECT_SHOCK, (1 + mob:getMainLvl() / 3) * (1 + hard / 5), 0, 60 + hard * 15);
        if (success == 242) then
            target:setPendingMessage(277, EFFECT_SHOCK);
        end
    end

    return dmg;
end;
