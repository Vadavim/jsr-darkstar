---------------------------------------------------
-- Ultrasonics
-- Reduces evasion of targets in area of effect.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_EVASION_DOWN;
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local duration = 90 * fTP(skill:getTP(), 1, 1.5, 2) * (1 + hard / 5)
    if (mob:hasStatusEffect(EFFECT_SILENCE)) then duration = duration * 0.5 end;
    if (mob:hasStatusEffect(EFFECT_CHOKE)) then duration = duration * 0.8 end;
    if (mob:hasStatusEffect(EFFECT_DROWN)) then duration = duration * 0.8 end;

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 25, 0, 180));
    enmityStatusCheck(target, mob, skill, 15 + hard * 5);
    if (skill:getMsg() == 242) then
        local effect = target:getStatusEffect(EFFECT_EVASION_DOWN);
        if (effect ~= nil and hard > 0) then
            target:addMod(MOD_ENEMYCRITRATE, 7 + hard * 3);
            effect:addMod(MOD_ENEMYCRITRATE, 7 + hard * 3);
        end

    end



        return typeEffect;
end;
