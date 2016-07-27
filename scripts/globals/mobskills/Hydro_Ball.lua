---------------------------------------------
--  Hydroball
--  Deals Water damage to targets in a fan-shaped area of effect. Additional effect: STR Down
--  Type: Breath
--  Utsusemi/Blink absorb: Ignores shadows
--  Notes: STR reduced by 15%.
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_STR_DOWN;
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);


    MobStatusEffectMove(mob, target, typeEffect, 10 + hard * 5, 3, 120);
    if (hard > 0) then
        local success2 = MobStatusEffectMove(mob, target, EFFECT_DROWN, 1 + mob:getMainLvl() / 5, 0, 30 + hard * 15);
        if (success2 == 242) then
            target:setPendingMessage(278, EFFECT_DROWN);
        end
    end

    local dmgmod = 1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg() * 3.5,ELE_WATER,dmgmod,TP_DMG_VARIES,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WATER,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
