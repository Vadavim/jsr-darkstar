---------------------------------------------
--  Toxic Spit
--
--  Description: Spews a toxic glob at a single target. Additional effect: Poison
--  Type: Magical Water
--  Utsusemi/Blink absorb: Ignores shadows
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
    local duration = 90 * fTP(tp, 1, 1.5, 2) * (1 + hard / 5)


    local typeEffect = EFFECT_POISON;
    local power = (mob:getMainLvl()/5 + 3) * (1 + hard / 4);

    if (mob:isPet() and mob:getMaster():isPC()) then
        power = power * 1.33;
    end


    local success = MobStatusEffectMove(mob, target, typeEffect, power, 3, duration, MOD_VIT);
    if (success == 242) then
        target:setPendingMessage(277, EFFECT_POISON);
    end

    if (hard > 0 and success == 242) then
        target:addStatusEffect(EFFECT_DISEASE, 1, 0, 30 + 15 * hard);
        target:setPendingMessage(277, EFFECT_DISEASE);
    end


    local dmgmod = 1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*2.5,ELE_WATER,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WATER,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
