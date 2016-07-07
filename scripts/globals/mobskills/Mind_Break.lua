---------------------------------------------
--  Mind Break
--
--  Description: Reduces maximum MP in an area of effect.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: 15' radial
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
    local message = MSG_MISS;
    local typeEffect = EFFECT_MAX_MP_DOWN;
    local duration = 120;
    if (mob:hasStatusEffect(EFFECT_BLINDNESS)) then duration = duration * 0.75 end;
    if (mob:hasStatusEffect(EFFECT_FLASH)) then duration = duration * 0.5 end;

    skill:setMsg(MobGazeMove(mob, target, typeEffect, 50 + hard * 8, 0, 120));
    enmityStatusCheck(target, mob, skill, 15 + hard * 5);
    if (hard > 0) then
        local success = MobStatusEffectMove(mob, target, skill, EFFECT_MAGIC_ACC_DOWN, 15 + hard * 5, 0, duration / 2);
        if (success == 242) then
            target:setPendingMessage(278, EFFECT_MAGIC_ACC_DOWN);
        end
        success = MobStatusEffectMove(mob, target, skill, EFFECT_MAGIC_ATK_DOWN, 15 + hard * 5, 0, duration / 2);
        if (success == 242) then
            target:setPendingMessage(278, EFFECT_MAGIC_ATK_DOWN);
        end
        success = MobStatusEffectMove(mob, target, skill, EFFECT_MAGIC_DEF_DOWN, 15 + hard * 5, 0, duration / 2);
        if (success == 242) then
            target:setPendingMessage(278, EFFECT_MAGIC_DEF_DOWN);
        end
    end


    return typeEffect;
end;
