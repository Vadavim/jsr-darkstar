---------------------------------------------------
-- Sticky Thread
-- Inflicts slow on targets in a fan-shaped area of effect.
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
    local tp = skill:getTP();
    local duration = 60 * fTP(tp, 1, 1.5, 2) * (1 + hard / 5)


    local typeEffect = EFFECT_SLOW;

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 128 + hard * 15, 0, duration));
    enmityStatusCheck(target, mob, skill, 15 + hard * 5);

    if (hard > 0) then
        local success = MobStatusEffectMove(mob, target, EFFECT_WEIGHT, 35 + hard * 10, 0, duration);
        if (success == 242) then
            target:setPendingMessage(277, EFFECT_WEIGHT);
        end
    end


    return typeEffect;
end;
