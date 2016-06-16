---------------------------------------------
--  Leafstorm
--
--  Description: Deals wind damage within area of effect.
--  Type: Magical Wind
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
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*math.random(4,5),ELE_WIND,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WIND,MOBPARAM_WIPE_SHADOWS);
    if (hard > 0) then
        mob:lowerEnmity(target, 25 + hard * 5);
    end

    target:delHP(dmg);
    return dmg;
end;
