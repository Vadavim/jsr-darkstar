---------------------------------------------
--  Radiant Breath
--
--  Description: Deals light damage to enemies within a fan-shaped area of effect originating from the caster. Additional effect: Slow and Silence.
--  Type: Magical (Light)
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
    local typeEffectOne = EFFECT_SLOW;
    local typeEffectTwo = EFFECT_SILENCE;
    local duration = 60 + hard * 15;
    if (mob:hasStatusEffect(EFFECT_SILENCE)) then duration = duration * 0.5 end;
    if (mob:hasStatusEffect(EFFECT_CHOKE)) then duration = duration * 0.8 end;
    if (mob:hasStatusEffect(EFFECT_DROWN)) then duration = duration * 0.8 end;

    local success = MobStatusEffectMove(mob, target, typeEffectOne, 128, 0, 60 + hard * 15);
    if (success == 242) then
        target:setPendingMessage(277, typeEffectOne);
    end

    success = MobStatusEffectMove(mob, target, typeEffectTwo, 1, 0, 60 + hard * 15);
    if (success == 242) then
        target:setPendingMessage(277, typeEffectTwo);
    end

    local dmgmod = MobBreathMove(mob, target, 0.2, 0.75, ELE_LIGHT, 700);

    local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_BREATH,MOBPARAM_LIGHT,MOBPARAM_WIPE_SHADOWS);
    dmg = dmg * (1 + hard / 10);
    target:delHP(dmg);
    return dmg;
end;
