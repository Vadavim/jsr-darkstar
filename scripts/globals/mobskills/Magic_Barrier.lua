---------------------------------------------
--  Magic Barrier
--
--  Description: Ranged shield
--  Type: Enhancing
--  Utsusemi/Blink absorb: N/A
--  Range: Self
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
        mob:addTP(skill:getTP() * 0.5);
    end

    local typeEffect = EFFECT_MAGIC_SHIELD;

    skill:setMsg(MobBuffMove(mob, typeEffect, 1, 0, 60));

    return typeEffect;
end;
