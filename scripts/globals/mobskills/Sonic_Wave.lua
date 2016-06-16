---------------------------------------------------
-- Sonic Wave
-- Reduces defense of enemies in an area of effect.
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
    local duration = 45 * fTP(tp, 1, 1.5, 2) * (1 + hard / 5)
    if (mob:hasStatusEffect(EFFECT_SILENCE) and math.random(0, 100) < 50) then return 0 end;
    if (mob:hasStatusEffect(EFFECT_DROWN) and math.random(0, 100) < 15) then return 0 end;
    if (mob:hasStatusEffect(EFFECT_CHOKE) and math.random(0, 100) < 15) then return 0 end;


    local typeEffect = EFFECT_DEFENSE_DOWN;
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 30, 0, duration));
    enmityStatusCheck(target, mob, skill, 15 + hard * 5);

    if (hard > 0 and skill:getMsg() == MSG_ENFEEB_IS) then
        target:dispelStatusEffect();
    end


    return typeEffect;
end;
