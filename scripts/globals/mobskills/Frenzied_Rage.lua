---------------------------------------------------
-- Berserk
-- Berserk Ability.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (target:hasStatusEffect(EFFECT_ATTACK_BOOST)) then
        return 1;
    end

    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local tp = skill:getTP();
    local duration = 45 * fTP(tp, 1, 1.5, 2) * (1 + hard / 5)


    local typeEffect = EFFECT_ATTACK_BOOST;
    skill:setMsg(MobBuffMove(mob, typeEffect, 20 + hard * 4, 0, duration));

    if (hard > 0) then
        mob:addStatusEffect(EFFECT_BLOOD_WEAPON, 1, 0, duration);
    end


    return typeEffect;
end;
