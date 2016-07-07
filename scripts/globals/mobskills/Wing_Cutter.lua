---------------------------------------------------
-- Wing Cutter
-- Deals Wind damage to targets in a fan-shaped area of effect.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local dmgmod = 1 + hard / 6;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg() * 3,ELE_WIND,dmgmod,TP_MAB_BONUS,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WIND,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    if (dmg > 0 and hard > 0) then
        skill:setKnockback(5);
    end
    return dmg;
end;
