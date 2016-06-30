---------------------------------------------------
-- Poison Sting
-- Induces poison
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local power = (5 + mob:getMainLvl() / 2) * (1 + hard / 5);
    local typeEffect = EFFECT_POISON;
    local duration = 60 * (skill:getTP() / 1000);

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, power, 3, duration));
    enmityStatusCheck(target, mob, skill, 15 + hard * 5);
    if (hard > 0) then
        local tpDrain = target:getTP() * (0.2 + hard / 10);
        target:delTP(tpDrain);
        mob:addTP(tpDrain);
    end

    return typeEffect;
end;
