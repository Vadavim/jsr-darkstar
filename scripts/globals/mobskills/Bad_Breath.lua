---------------------------------------------
--  Bad Breath
--
--  Description: Deals earth damage that inflicts multiple status ailments on enemies within a fan-shaped area originating from the caster.
--  Type: Magical (Earth)
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
    local duration = 45 * fTP(tp, 1, 1.5, 2) * (1 + hard / 5)
    if (mob:hasStatusEffect(EFFECT_SILENCE)) then duration = duration * 0.5 end;
    if (mob:hasStatusEffect(EFFECT_CHOKE)) then duration = duration * 0.8 end;
    if (mob:hasStatusEffect(EFFECT_DROWN)) then duration = duration * 0.8 end;



    MobStatusEffectMove(mob, target, EFFECT_SLOW, 128 + hard * 25, 0, 60, MOD_VIT);
    MobStatusEffectMove(mob, target, EFFECT_POISON, (mob:getMainLvl()/10) * (1 + hard / 4), 3, duration, MOD_VIT);
    MobStatusEffectMove(mob, target, EFFECT_SILENCE, 1, 0, duration, MOD_VIT);
    MobStatusEffectMove(mob, target, EFFECT_PARALYSIS, 15 + hard * 2, 0, duration, MOD_VIT);
    MobStatusEffectMove(mob, target, EFFECT_BIND, 1, 0, 30, MOD_VIT);
    MobStatusEffectMove(mob, target, EFFECT_BLINDNESS, 15 + hard * 3, 0, duration, MOD_VIT);
    MobStatusEffectMove(mob, target, EFFECT_WEIGHT, 50, 0, duration, MOD_VIT);

    local dmgmod = MobBreathMove(mob, target, 0.15, 3, ELE_EARTH, 500);
    dmgmod = dmgmod * (1 + hard / 5);

    local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_BREATH,MOBPARAM_EARTH,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
