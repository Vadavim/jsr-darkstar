---------------------------------------------------
-- Mucus Spread
-- AOE Slow
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local typeEffect = EFFECT_SLOW;

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 150 + hard * 50, 0, 60));
    enmityStatusCheck(target, mob, skill, 15 + hard * 5);

    return typeEffect;
end;
