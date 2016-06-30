---------------------------------------------------
-- Palsy Pollen
-- Conal paralyze
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Melee?
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_PARALYSIS;

    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local tp = skill:getTP();
    local duration = 45 * fTP(tp, 1, 1.5, 2) * (1 + hard / 5)

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 30 + hard * 2, 0, duration));
    enmityStatusCheck(target, mob, skill, 15 + hard * 5);

    if (hard > 0) then
        local power = 1 + (mob:getMainLvl() / 5) * (1 + hard / 4);
        local success = MobStatusEffectMove(mob, target, typeEffect, power, 3, duration);
        if (success == 242) then
            target:setPendingMessage(277, EFFECT_POISON);
        end
    end



    return typeEffect;
end
