---------------------------------------------------
-- Slumber Powder
-- 10' Conal sleep
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
    local typeEffect = EFFECT_SLEEP_I;

    skill:setMsg(MobGazeMove(mob, target, typeEffect, 1, 0, 30));
    enmityStatusCheck(target, mob, skill, 15 + hard * 5);

    if (hard > 0) then
        local effect = target:getStatusEffect(EFFECT_SLEEP_I);
        if (effect ~= nil) then
            effect:addMod(MOD_REGAIN_DOWN, hard * 2);
            effect:addMod(MOD_REFRESH_DOWN, hard * 2);
            target:addMod(MOD_REGAIN_DOWN, hard * 2);
            target:addMod(MOD_REFRESH_DOWN, hard * 2);
        end
    end

    return typeEffect;
end;
