---------------------------------------------
--  Eyes on Me
--  Deals dark damage to an enemy.
--  Spell Type: Magical (Dark)
--  Range: Casting range 13'
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
    local dmgmod = mob:getWeaponDmg() * 4;

    if (mob:hasStatusEffect(EFFECT_BLINDNESS)) then dmgmod = dmgmod * 0.77; end;
    local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_SPECIAL,MOBPARAM_DARK,MOBPARAM_IGNORE_SHADOWS);
    if (hard > 0) then
        mob:lowerEnmity(target, 20 + hard * 15);
    end


    target:delHP(dmg);

    return dmg;
end;
