---------------------------------------------
--  Death Ray
--
--  Description: Deals dark damage to an enemy.
--  Type: Magical (Dark)
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
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3.5,ELE_DARK,dmgmod,TP_DMG_VARIES);

    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_IGNORE_SHADOWS);
    if (hard > 0 and dmg > 0) then
        local success = MobStatusEffectMove(mob, target, EFFECT_BIO, (1 + mob:getMainLvl() / 5) * (1 + hard / 5), 0, 60 + hard * 15);
        if (success == 242) then
            target:setPendingMessage(278, EFFECT_BIO);
        end
    end

    target:delHP(dmg);
    return dmg;
end;
