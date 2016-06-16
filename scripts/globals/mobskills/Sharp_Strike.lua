---------------------------------------------
--  Sharp Strike
--
--  Description: Scorpion goes crazy
--  Type: Enhancing
--  Utsusemi/Blink absorb: N/A
--  Range: Self
--  Notes: 50% Attack Boost.
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

    local power = 50;
    local duration = 180;

    local typeEffect = EFFECT_ATTACK_BOOST;

    if (hard > 0) then
        mob:addStatusEffect(EFFECT_ENSTONE, (1 + mob:getMainLvl() / 3) * (1 + hard / 4), 0, 180);
    end


    skill:setMsg(MobBuffMove(mob, typeEffect, power, 0, duration));
    return typeEffect;
end;
