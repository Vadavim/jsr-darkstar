---------------------------------------------------
-- Blank Gaze
-- Gaze dispel
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Melee?
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

    local effect = 0;
    if (target:isFacing(mob)) then

        effect = target:dispelStatusEffect();

        if (effect == EFFECT_NONE) then
            skill:setMsg(MSG_NO_EFFECT); -- no effect
        else
            skill:setMsg(MSG_DISAPPEAR);
        end
    else
        skill:setMsg(MSG_NO_EFFECT); -- no effect
    end

    if (hard > 0) then
        target:delTP(3000);
    end


    return effect;
end
