---------------------------------------------------
-- Blank Gaze
-- Powerful Paralyze Gaze Attack.
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Melee?
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_PARALYSIS;
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    if (hard > 0 and target:hasStatusEffect(EFFECT_PARALYSIS)) then
        target:addStatusEffect(EFFECT_TERROR, 1, 0, 10 * (1 + (hard - 1) / 2));
        return EFFECT_TERROR;
    end

    local tp = skill:getTP();
    local power = math.floor(30 + (5 * tp / 1000));
    skill:setMsg(MobGazeMove(mob, target, typeEffect, power, 0, 60 * (1 + hard / 4), MOD_CHR));


    return typeEffect;
end
