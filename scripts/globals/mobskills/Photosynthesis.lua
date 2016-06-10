---------------------------------------------
--  Photosynthesis
--
--  Description: Adds a Regen effect.
--  Type: Enhancing
--  Utsusemi/Blink absorb: N/A
--  Range: Self
--  Notes: Only available during daytime.
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/globals/jsr_utils");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    -- only used during daytime
    local currentTime = VanadielHour();
    if (currentTime >= 6 and currentTime <= 18) then
        return 0;
    end
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
    local tpMod = tpModifier(skill);
    local power = (mob:getMainLvl()/10 * 6 + 5) * tpMod;
    local duration = 30 * tpMod;

    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    if (hard > 0) then
        power = power * (1 + hard / 4);
        duration = duration * (hard * 3);
    end

    power = reduce_healing_factor(target) * power;


    local typeEffect = EFFECT_REGEN;
    skill:setMsg(MobBuffMove(mob, typeEffect, power, 0, duration));
    return typeEffect;
end;
