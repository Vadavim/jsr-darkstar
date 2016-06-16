---------------------------------------------
--  Venom
--
--  Description: Deals damage in a fan shaped area. Additional effect: poison
--  Type: Magical Water
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: 10' cone
--  Notes: Additional effect can be removed with Poisona.
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
    local tp = skill:getTP();
    local duration = 30 * fTP(tp, 1, 1.5, 2) * (1 + hard / 5)

    local typeEffect = EFFECT_POISON;
    local power = (mob:getMainLvl()/8 + 10) * (1 + hard / 5);


    MobStatusEffectMove(mob, target, typeEffect, power, 3, duration);

    local dmgmod = 1 + (hard / 5);
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*1.8,ELE_WATER,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WATER,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
