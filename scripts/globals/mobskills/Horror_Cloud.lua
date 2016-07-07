---------------------------------------------
--  Horror Cloud
--
--  Description: A debilitating cloud slows the attack speed of a single target.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Melee
--  Notes: Can be overwritten and blocked by Haste.
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
    local typeEffect = EFFECT_SLOW;
    local duration = 80 * fTP(skill:getTP(), 1, 1.5, 2) * (1 + hard / 5)
    enmityStatusCheck(target, mob, skill, 15 + hard * 5);

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 128 + hard * 25, 0, duration));
    if (hard > 0) then
        local success = MobStatusEffectMove(mob, target, EFFECT_TERROR, 1, 0, 5 + hard);
        if (success == 242) then
            target:setPendingMessage(277, EFFECT_TERROR);
        end
    end


    return typeEffect;
end;
