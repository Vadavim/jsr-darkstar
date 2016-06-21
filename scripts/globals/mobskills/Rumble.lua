---------------------------------------------
--  Rumble
--
--  Description: A disorienting vibration lowers evasion of targets in an area of effect.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown radial
--  Notes:
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


    local typeEffect = EFFECT_EVASION_DOWN;
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 50, 0, duration, MOD_STR));
    enmityStatusCheck(target, mob, skill, 15 + hard * 5);

    if (hard > 0) then
        local power = (1 + mob:getMainLvl() / 2) * (1 + hard / 5);
        mob:addStatusEffect(EFFECT_ENSTONE, power, 0, 60);
        mob:setPendingMessage(279, EFFECT_ENSTONE);
    end

    return typeEffect;
end;
