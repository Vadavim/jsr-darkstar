---------------------------------------------------
-- Gravity Field
-- Entangles all targets in an area of effect.
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
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 128 + hard * 15, 0, 120));
    enmityStatusCheck(target, mob, skill, 15 + hard * 5);
    if (hard > 0) then
        local success = MobStatusEffectMove(mob, target, typeEffect, 40 + hard * 10, 0, 60 + hard * 15);
        if (success == 242) then
            target:setPendingMessage(277, EFFECT_WEIGHT);
        end

    end


    return typeEffect;
end;
