---------------------------------------------
--  Plague Breath
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
    local duration = 45 * fTP(tp, 1, 1.5, 2) * (1 + hard / 5)
    if (mob:hasStatusEffect(EFFECT_SILENCE)) then duration = duration * 0.5 end;
    if (mob:hasStatusEffect(EFFECT_CHOKE)) then duration = duration * 0.8 end;
    if (mob:hasStatusEffect(EFFECT_DROWN)) then duration = duration * 0.8 end;


    local typeEffect = EFFECT_POISON;
    local power = (mob:getMainLvl() / 4 + 1) * (1 + hard / 4);

    local success = MobStatusEffectMove(mob, target, typeEffect, power, 3, duration);
    if (success == 242) then
        target:setPendingMessage(277, EFFECT_POISON);
    end

    if (hard > 0) then
        local success2 = MobStatusEffectMove(mob, target, EFFECT_PLAGUE, 1 + hard, 3, duration);
        if (success2 == 242) then
            target:setPendingMessage(277, EFFECT_PLAGUE);
        end
    end

    local dmgmod = MobBreathMove(mob, target, 0.1, 2, ELE_WATER, 250);

    local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_BREATH,MOBPARAM_WATER,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
