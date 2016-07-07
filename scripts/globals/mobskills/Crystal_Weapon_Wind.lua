---------------------------------------------
--  Crystal Weapon
--
--  Description: Invokes the power of a crystal to deal magical damage of a random element to a single target.
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown
--  Notes: Can be Fire, Earth, Wind, or Water element.  Functions even at a distance (outside of melee range).
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
    local dmgmod = 1 + hard / 10;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg() * 4,ELE_WIND,dmgmod,TP_MAB_BONUS,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WIND,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    if (hard > 0) then
        mob:addStatusEffect(EFFECT_ENAERO, (mob:getMainLvl() / 1.5) + (1 + hard / 5), 0, 60);
        mob:setPendingMessage(280, EFFECT_ENAERO);
    end
    return dmg;
end;
