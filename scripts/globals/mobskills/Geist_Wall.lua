---------------------------------------------
--  Geist Wall
--
--  Description: Dispels one effects from targets in an area of effect.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: 10' radial
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

    if (hard > 0) then
        skill:setMsg(MobDrainStatusEffectMove(mob, target));
    else
        skill:setMsg(target:dispelStatusEffect());
    end


--    if (dispel == EFFECT_NONE) then
--        -- no effect
--        skill:setMsg(MSG_NO_EFFECT); -- no effect
--    else
--        skill:setMsg(MSG_DISAPPEAR);
--    end

    return dispel;
end;