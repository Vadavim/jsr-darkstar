---------------------------------------------------
-- Spore
-- Emits a cloud of spores that inflict paralysis.
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Melee?
-- Duration: 9:00
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/jsr_utils");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_PARALYSIS;
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local tp = skill:getTP();
    local duration =  60 * fTP(tp, 1, 1.5, 2) * (1 + hard / 5)
    local power = 25 + hard * 2;

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, power, 0, duration));
    enmityStatusCheck(target, mob, skill, 15 + hard * 5);

    if (hard > 0) then
        local regenPower = 2 + (mob:getMainLvl() / 4) * reduced_healing_factor(mob);
        mob:setPendingMessage(279, EFFECT_REGEN);

        mob:addStatusEffect(EFFECT_REGEN, regenPower * (1 + (hard - 1) / 3), 0, duration);
    end
    return typeEffect;
end
