---------------------------------------------------
-- Demonic Howl
-- 10' AoE +50%. Slow (weaker than Haste)
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
    local duration = 80 * fTP(skill:getTP(), 1, 1.5, 2) * (1 + hard / 5)
    if (mob:hasStatusEffect(EFFECT_SILENCE)) then duration = duration * 0.5 end;
    if (mob:hasStatusEffect(EFFECT_CHOKE)) then duration = duration * 0.8 end;
    if (mob:hasStatusEffect(EFFECT_DROWN)) then duration = duration * 0.8 end;

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 128 + hard * 25, 0, duration));
    enmityStatusCheck(target, mob, skill, 15 + hard * 5);
    if (hard > 0) then
        local success = MobStatusEffectMove(mob, target, EFFECT_TERROR, 1, 0, 5 + hard);
        if (success == 242) then
            target:setPendingMessage(278, EFFECT_TERROR);
        end
    end


    return typeEffect;
end;
