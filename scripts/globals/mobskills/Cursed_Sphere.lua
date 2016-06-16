---------------------------------------------
--  Cursed Sphere
--
--  Description: Deals water damage to enemies within area of effect.
--  Type: Magical Water (Element)
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


    local dmgmod = 1 + hard / 5;
    local accmod = 1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*2.2,ELE_WATER,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WATER,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);

    if (hard > 0) then
        local power = (1 + mob:getMainLvl() / 2) * (1 + hard / 5);
        local success = MobStatusEfectMove(mob, target, skill, EFFECT_DROWN, power, 0, 30 + hard * 15);
        if (success == 242) then
            target:setPendingMessage(277, EFFECT_DROWN);
        end
    end

    return dmg;
end;
