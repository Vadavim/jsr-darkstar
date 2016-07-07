---------------------------------------------
--  Acid Breath
--
--  Description: Deals Water damage to enemies in a fan-shaped area of effect. Additional effect: STR Down
--  Type: Breath
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown cone
--  Notes:
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_STR_DOWN;
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local power = 20 + hard * 5;
    local tick = 3;
    local duration = power * tick;
    if (mob:hasStatusEffect(EFFECT_SILENCE)) then duration = duration * 0.5 end;
    if (mob:hasStatusEffect(EFFECT_CHOKE)) then duration = duration * 0.8 end;
    if (mob:hasStatusEffect(EFFECT_DROWN)) then duration = duration * 0.8 end;

    local success = MobStatusEffectMove(mob, target, typeEffect, power, tick, duration);
    if (success == 242) then
        target:setPendingMessage(278, EFFECT_STR_DOWN);
        if (hard > 0) then
            success = MobStatusEffectMove(mob, target, EFFECT_POISON, (1 + mob:getMainLvl() / 6) * (1 + hard / 6), tick, 60 + hard * 15);
            if (success == 242) then
                target:setPendingMessage(277, EFFECT_POISON);
            end
        end

    end


    local dmgmod = MobBreathMove(mob, target, 0.1, 1, ELE_WATER, 200);

    local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_BREATH,MOBPARAM_WATER,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
