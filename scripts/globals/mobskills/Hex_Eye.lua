---------------------------------------------
--  Hex Eye
--
--  Description: Paralyzes with a gaze.
--  Type: Gaze
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Line of sight
--  Notes:
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
    local typeEffect = EFFECT_PARALYSIS;

    skill:setMsg(MobGazeMove(mob, target, typeEffect, 25, 0, 120));
    enmityStatusCheck(target, mob, skill, 15 + hard * 5);
    if (hard > 0 and skill:getMsg() == 242) then
        local success = MobStatusEffectMove(mob, target, EFFECT_CURSE_I, 30, 0, 60 + hard * 15);
        if (success == 242) then
            target:setPendingMessage(277, EFFECT_CURSE_I);
        end
    end

    return typeEffect;

end;