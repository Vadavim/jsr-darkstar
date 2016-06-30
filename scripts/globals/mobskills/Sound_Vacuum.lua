---------------------------------------------
--  Sound Vacuum
--
--  Description: Silences opponents in a fan-shaped area of effect.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown cone
--  Notes: Worm version is single target rather than conical (except for Nightmare Worm). The Nightmare Cockatrice inflicts Mute with this ability.
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    if (hard > 1) then
        skill:setAoE(4);
        return 0
    end

    local job = target:getMainJob();
    if (target:getMP() < 30 and not (job == JOBS.BRD or job == JOBS.NIN)) then
        return 1;
    end

    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local typeEffect = EFFECT_SILENCE;
    mob:addTP(skill:getTP() * 0.5);
    enmityStatusCheck(target, mob, skill, 15 + hard * 5);

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 1, 0, 45));

    return typeEffect;
end;
