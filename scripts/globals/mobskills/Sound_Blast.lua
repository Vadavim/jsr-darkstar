---------------------------------------------------
-- Sound Blast
-- 15' Reduces INT of players in area of effect.
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
    local duration = 90 * fTP(skill:getTP(), 1, 1.5, 2) * (1 + hard / 5)
    if (mob:hasStatusEffect(EFFECT_SILENCE)) then duration = duration * 0.5 end;
    if (mob:hasStatusEffect(EFFECT_CHOKE)) then duration = duration * 0.8 end;
    if (mob:hasStatusEffect(EFFECT_DROWN)) then duration = duration * 0.8 end;
    local typeEffect = EFFECT_INT_DOWN;
    local power = (5 + mob:getMainLvl() / 3) * (1 + hard / 5);

    if (target:hasStatusEffect(EFFECT_INT_DOWN)) then
        target:delHP(target:getHP() * (0.33 + hard / 10));
    end

    if (hard > 0) then
        local success = MobStatusEffectMove(mob, target, EFFECT_STUN, 1, 3, 5 + hard);
        if (success == 242) then
            target:setPendingMessage(277, EFFECT_STUN);
        end
    end

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, power, 3, duration));
    enmityStatusCheck(target, mob, skill, 15 + hard * 5);

    return typeEffect;
end;
