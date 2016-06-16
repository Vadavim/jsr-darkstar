---------------------------------------------
--  Silence Gas
--
--  Description: Emits a noxious cloud in a fan-shaped area of effect, dealing Wind damage to all targets. Additional effect: silence
--  Type: Magical Wind (Element)
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
    local typeEffect = EFFECT_SILENCE;
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local tp = skill:getTP();
    local duration =  30 * fTP(tp, 1, 1.5, 2) * (1 + hard / 5)



    MobStatusEffectMove(mob, target, typeEffect, 1, 0, duration, MOD_VIT);


    local dmgmod = MobBreathMove(mob, target, 0.25, 2, ELE_WIND, 800);
    if (hard > 0) then
        dmgmod = dmgmod * (1 + hard / 4);
        local success = MobStatusEffectMove(mob, target, EFFECT_AMNESIA, 1, 0, 10 * hard, MOD_VIT);
        if (success == 242) then
            target:setPendingMessage(277, EFFECT_AMNESIA);
        end
    end


    local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_BREATH,MOBPARAM_WIND,MOBPARAM_IGNORE_SHADOWS);

    target:delHP(dmg);
    return dmg;
end;
