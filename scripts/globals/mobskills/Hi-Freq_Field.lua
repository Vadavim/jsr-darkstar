---------------------------------------------------
-- Hi-Freq Field
-- Lowers the evasion of enemies in a fan-shaped area of effect.
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
    local duration = 90 * fTP(tp, 1, 1.5, 2) * (1 + hard / 5)
    if (mob:hasStatusEffect(EFFECT_SILENCE)) then duration = duration * 0.5 end;
    if (mob:hasStatusEffect(EFFECT_CHOKE)) then duration = duration * 0.8 end;
    if (mob:hasStatusEffect(EFFECT_DROWN)) then duration = duration * 0.8 end;

    local typeEffect = EFFECT_EVASION_DOWN;

    local power = 50;
    if (mob:isPet() and mob:getMaster():isPC()) then
        power = 35;
    end

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 50, 0, duration));
    enmityStatusCheck(target, mob, skill, 15 + hard * 5);

    if (hard > 0) then
        local power = (1 + mob:getMainLvl() / 2) * (1 + hard / 5);
        mob:addStatusEffect(EFFECT_ENAERO, power, 0, duration);
        mob:setPendingMessage(279, EFFECT_ENAERO);
    end


    return typeEffect;
end;
