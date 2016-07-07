---------------------------------------------------
-- Mind Drain
-- Steals mnd from target
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
    local typeEffect = EFFECT_MND_DOWN;

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 20 + hard * 5, 3, 120));
    enmityStatusCheck(target, mob, skill, 15 + hard * 5);
    if (hard > 0) then
        target:addStatusEffect(EFFECT_MAGIC_DEF_DOWN, 30 + hard * 5, 0, 60);
        target:setPendingMessage(278, EFFECT_MAGIC_DEF_DOWN);
        mob:addStatusEffect(EFFECT_MAGIC_DEF_BOOST, 30 + hard * 5, 0, 60);
        target:setPendingMessage(280, EFFECT_MAGIC_DEF_BOOST);
    end

    return typeEffect;
end;
