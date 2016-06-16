---------------------------------------------
--  Sweet Breath
--
--  Description: Deals water damage to enemies within a fan-shaped area originating from the caster. Additional effect: Poison.
--  Type: Magical Water (Element)
--
--
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local tp = skill:getTP();
    local duration = 20 * fTP(tp, 1, 1.5, 2) * (1 + hard / 5)

    if (mob:hasStatusEffect(EFFECT_SILENCE)) then duration = duration * 0.5 end;
    if (mob:hasStatusEffect(EFFECT_CHOKE)) then duration = duration * 0.8 end;
    if (mob:hasStatusEffect(EFFECT_DROWN)) then duration = duration * 0.8 end;



    local dmgmod = MobBreathMove(mob, target, 0.125, 3, ELE_WATER, 500);
    dmgmod = dmgmod * (1 + hard / 5);

    local typeEffect = EFFECT_SLEEP_I;
    if (hard > 0) then typeEffect = EFFECT_CHARM_I end;

    local success = MobStatusEffectMove(mob, target, typeEffect, 1, 0, duration, MOD_VIT);
    if (success == 242) then
        target:setPendingMessage(277, typeEffect);
    end

    local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_BREATH,MOBPARAM_WATER,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
