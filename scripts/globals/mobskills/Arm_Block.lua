---------------------------------------------------
-- Arm Block
-- Enhances defense.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_DEFENSE_BOOST;
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    skill:setMsg(MobBuffMove(mob, typeEffect, 15 + hard * 3, 0, 300));
    return typeEffect;
end;
