---------------------------------------------
--  Petrifactive Breath
--
--
--
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------
function onMobSkillCheck(target,mob,skill)
--    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
--    return hard == 0;
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local tp = skill:getTP();
    local duration = 90 * fTP(tp, 1, 1.5, 2) * (1 + hard / 5)
--    if (mob:hasStatusEffect(EFFECT_SILENCE)) then duration = duration * 0.5 end;
--    if (mob:hasStatusEffect(EFFECT_CHOKE)) then duration = duration * 0.8 end;
--    if (mob:hasStatusEffect(EFFECT_DROWN)) then duration = duration * 0.8 end;


    local success = MobStatusEffectMove(mob, target, EFFECT_GRADUAL_PETRIFICATION, 1, 3, duration, MOD_VIT);
    if (success == 242) then
        target:setPendingMessage(277, EFFECT_GRADUAL_PETRIFICATION);
    end

    local dmgmod = MobBreathMove(mob, target, 0.333, 0.625, ELE_EARTH, 500);
    dmgmod = dmgmod * (1 + hard / 5);

    local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_BREATH,MOBPARAM_EARTH,MOBPARAM_IGNORE_SHADOWS);

    target:delHP(dmg);
    return dmg;
end;
