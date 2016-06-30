---------------------------------------------------
-- Sand Breath
-- Deals Earth damage to enemies within a fan-shaped area. Additional effect: Blind
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_BLINDNESS;
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local duration = 80 * (skill:getTP() / 1000) * (1 + hard / 5);

    local successBlind = MobStatusEffectMove(mob, target, typeEffect, 20 + hard * 3, 0, duration);
    if (successBlind == 242) then
        target:setPendingMessage(277, EFFECT_BLINDNESS);
    end

    local dmgmod = MobBreathMove(mob, target, 0.2, 0.75, ELE_EARTH, 800);

    if (hard > 0) then
        local duration = 60;
        if (mob:hasStatusEffect(EFFECT_SILENCE)) then duration = duration * 0.5 end;
        if (mob:hasStatusEffect(EFFECT_CHOKE)) then duration = duration * 0.8 end;
        if (mob:hasStatusEffect(EFFECT_DROWN)) then duration = duration * 0.8 end;
        local power = (1 + mob:getMainLvl() / 10) * (1 + hard / 5);
        local success = MobStatusEffectMove(mob, target, EFFECT_RASP, power, 0, duration);
        if (success == 242) then
            target:setPendingMessage(278, EFFECT_RASP);
        end
    end

    local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_BREATH,MOBPARAM_EARTH,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end
