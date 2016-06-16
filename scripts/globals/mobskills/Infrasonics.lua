---------------------------------------------------
-- Infrasonics
-- Reduces evasion of targets in area of effect.
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



    local typeEffect = EFFECT_EVASION_DOWN;
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 20 + hard * 2, 0, duration));
    enmityStatusCheck(target, mob, skill, 15 + hard * 5);

    if (hard > 0) then
        local effect = target:getStatusEffect(EFFECT_EVASION_DOWN);
        if (effect ~= nil) then
            target:addMod(MOD_ENEMYCRITRATE, 8 + hard * 2);
            effect:addMod(MOD_ENEMYCRITRATE, 8 + hard * 2);
        end

    end


    return typeEffect;
end