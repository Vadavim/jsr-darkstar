---------------------------------------------
--  Words of Bane
--
--  Description: Curses a single target.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Single Target
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
    local typeEffect = EFFECT_CURSE_I;
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 25 + hard * 5, 0, 360));
    enmityStatusCheck(target, mob, skill, 30 + hard * 5);
    if (hard > 0) then
        local success = MobStatusEffectMove(mob, target, EFFECT_ENMITY_DOWN, 20 + hard * 5, 0, 60 + hard * 30);
    end

    return typeEffect;
end;
