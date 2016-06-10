---------------------------------------------
--  Wild Oats
--
--  Description: Additional effect: Vitality Down. Duration of effect varies on TP.
--  Type: Physical (Piercing)
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
    local typeEffect = EFFECT_VIT_DOWN;
    local tpMod = tpModifier(skill);
    local power = 10 * tpMod;
    mob:addTP(500);
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    print(hard);
    if (hard > 0) then
        power = power * (1 + hard / 2);
    end

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, power, 3, 120 * tpMod));

    return typeEffect;
end;