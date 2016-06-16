---------------------------------------------
--  Frost Breath
--
--  Description: Deals ice damage to enemies within a fan-shaped area originating from the caster. Additional effect: Paralysis.
--  Type: Magical (Ice)
--
--
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    -- only used in Uleguerand_Range
    if (mob:getZoneID() == 5) then
        return 0;
    end
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local tp = skill:getTP();
    local duration = 30 * fTP(tp, 1, 1.5, 2) * (1 + hard / 5)
    if (mob:hasStatusEffect(EFFECT_SILENCE)) then duration = duration * 0.5 end;
    if (mob:hasStatusEffect(EFFECT_CHOKE)) then duration = duration * 0.8 end;
    if (mob:hasStatusEffect(EFFECT_DROWN)) then duration = duration * 0.8 end;

    local typeEffect = EFFECT_FROST;

    local power = (1 + mob:getMainLvl() / 8) * (1 + hard / 4);

    local success = MobStatusEffectMove(mob, target, typeEffect, power, 0, duration, MOD_VIT);
    if (success == 242) then
        target:setPendingMessage(277, typeEffect);
    end

    if (hard > 0) then
        target:addStatusEffect(EFFECT_PARALYSIS, 20 + hard * 2, 0, duration);
        target:setPendingMessage(277, EFFECT_PARALYSIS);
    end


    local dmgmod = MobBreathMove(mob, target, 0.333, 0.625, ELE_ICE, 500);

    local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_BREATH,MOBPARAM_ICE,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
