---------------------------------------------
--  Cold Breath
--
--  Description: Deals ice damage to enemies within a fan-shaped area originating from the caster. Additional effect: Bind.
--  Type: Magical Ice (Element)
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


    local typeEffect = EFFECT_BIND;

    local success = MobStatusEffectMove(mob, target, typeEffect, 1, 0, 20);
    if (success == 242) then
        target:setPendingMessage(277, EFFECT_BIND);
    end

    if (hard > 0) then
        local power = (1 + mob:getMainLvl() / 4) * (1 + hard / 5);
        local duration = 60;
        if (mob:hasStatusEffect(EFFECT_SILENCE)) then duration = duration * 0.5 end;
        if (mob:hasStatusEffect(EFFECT_CHOKE)) then duration = duration * 0.8 end;
        if (mob:hasStatusEffect(EFFECT_DROWN)) then duration = duration * 0.8 end;
        local success2 = MobStatusEffectMove(mob, target, EFFECT_FROST, power, 0, duration);
        if (success2 == 242) then
            target:setPendingMessage(277, EFFECT_FROST);
        end
    end


    local dmgmod = MobBreathMove(mob, target, 0.2, 0.75, ELE_ICE, 600);

    local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_BREATH,MOBPARAM_ICE,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
