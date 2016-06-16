---------------------------------------------
--  Blaster
--
--  Description: Paralyzes enemy.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows.
--  Range: Melee?
--  Notes: Very potent paralysis effect. Is NOT a Gaze Attack, unlike Chaotic Eye.
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
    local typeEffect = EFFECT_PARALYSIS;


    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 50 + hard * 2, 0, duration, MOD_MND));
    enmityStatusCheck(target, mob, skill, 15 + hard * 5);

    return typeEffect;
end;
