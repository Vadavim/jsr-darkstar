---------------------------------------------------
-- Scutum
-- Enhances defense.
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
    local tp = skill:getTP();
    local duration = 60 * fTP(tp, 1, 1.5, 2) * (1 + hard / 5)


    local typeEffect = EFFECT_DEFENSE_BOOST;
    skill:setMsg(MobBuffMove(mob, typeEffect, 30, 0, duration));

    if (hard > 0) then
        mob:addStatusEffect(EFFECT_FOIL, 50, 0, 30);
        mob:setPendingMessage(279, EFFECT_FOIL);
    end

    return typeEffect;
end;
