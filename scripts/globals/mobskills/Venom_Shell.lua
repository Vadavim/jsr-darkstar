---------------------------------------------
--  Gas Shell
--
--  Description: Releases a toxic gas from its shell, poisoning targets in an area of effect.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown radial
--  Notes: Poison is about 24/tic. The Nightmare Uragnite uses an enhanced version that also inflicts Plague.
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
    local power = (3 + mob:getMainLvl() / 4) * (hard / 4);
    local typeEffect = EFFECT_POISON;
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 12, 0, 180));
    enmityStatusCheck(target, mob, skill, 15 + hard * 5);

    return typeEffect;
end;
