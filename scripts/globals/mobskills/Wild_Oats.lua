---------------------------------------------
--  Wild Oats
--
--  Description: Additional effect: Vitality Down. Duration of effect varies on TP.
--  Type: Physical (Piercing)
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
    local typeEffect = EFFECT_VIT_DOWN;
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local tp = skill:getTP();
    local duration = 120 * fTP(tp, 1, 1.5, 2) * (1 + hard / 5)
    local power = 10 * fTP(1, 1.5, 2);

    mob:addTP(500);
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    if (hard > 0) then
        power = power * (1 + hard / 2)
        local success = MobStatusEffectMove(mob, target, EFFECT_DEFENSE_DOWN, 13 + hard * 2, 0, duration);
        if (success == 242) then
            target:setPendingMessage(277, EFFECT_DEFENSE_DOWN);
        end
    end

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, power, 3, duration));

    return typeEffect;
end;