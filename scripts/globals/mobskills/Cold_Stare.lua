---------------------------------------------------
-- Cold Stare
-- Silences enemies in a line area of effect.
-- Notes: Only applies when face-to-face with the dhalmel.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    if (hard > 0) then
        skill:setActivationTime(750);
    else
        skill:setActivationTime(1500);
    end
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local tp = skill:getTP();
    local duration = 40 * fTP(tp, 1, 1.5, 2) * (1 + hard / 5)


    local typeEffect = EFFECT_SILENCE;
    skill:setMsg(MobGazeMove(mob, target, typeEffect, 1, 0, duration), MOD_CHR);
    enmityStatusCheck(target, mob, skill, 15 + hard * 5);

    if (hard > 0 and target:getStatusEffect(EFFECT_SILENCE)) then
        local success = MobStatusEffectMove(mob, target, EFFECT_AMNESIA, 1, 0, duration, MOD_CHR);
        if (success == 242) then
            target:setPendingMessage(277, EFFECT_AMNESIA);
        end
    end



    return typeEffect;
end;
