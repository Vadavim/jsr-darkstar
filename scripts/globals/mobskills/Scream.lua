---------------------------------------------------
-- Scream
-- 15' Reduces MND of players in area of effect.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_MND_DOWN;
    local power = 10;
    local duration = math.random(4, 10);

    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    if (hard > 0) then
        power = power * (1 + hard / 2);
        duration = duration * (1 + hard / 2);
    end

    skill:setMsg(MobRoarMove(mob, target, typeEffect, 10, 3, 120, MOD_MND));
    enmityStatusCheck(target, mob, skill, 15 + hard * 5);

    --JSR: also inflicts terror momentarily
    MobStatusEffectMove(mob, target, EFFECT_TERROR, 1, 3, math.random(4, 10));




    return typeEffect;
end;
