---------------------------------------------------
-- Awful Ere
-- 15' Reduces STR of players in area of effect.
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

    local typeEffect = EFFECT_STR_DOWN;

    skill:setMsg(MobGazeMove(mob, target, typeEffect, 33, 3, 120, MOD_CHR));
    enmityStatusCheck(target, mob, skill, 15 + hard * 5);

    if (hard > 0 and skill:getMsg() == MSG_ENFEEB_IS) then
        target:delTP(150 * hard);
    end

    return typeEffect;
end;
