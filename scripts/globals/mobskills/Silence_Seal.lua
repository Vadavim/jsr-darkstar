---------------------------------------------
--  Silence Seal
--
--  Description: Silence Area of Effect (15.0')
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
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

    local typeEffect = EFFECT_SILENCE;

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 1, 0, 60));
    enmityStatusCheck(target, mob, skill, 15 + hard * 5);

    return typeEffect;
end;
