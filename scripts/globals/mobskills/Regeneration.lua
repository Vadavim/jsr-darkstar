---------------------------------------------
--  Regeneration
--
--  Description: Adds a Regen effect.
--  Type: Enhancing
--  Utsusemi/Blink absorb: N/A
--  Range: Self
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    if (mob:hasStatusEffect(EFFECT_REGEN)) then
        return 1;
    end
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local power = (mob:getMainLvl()/10 * 4 + 5) * (1 + hard / 5);
    power = reduced_healing_factor(target) * power;
    local duration = 60 * (skill:getTP() / 1000);

    local typeEffect = EFFECT_REGEN;

    skill:setMsg(MobBuffMove(mob, typeEffect, power, 3, duration));
    if (hard > 0) then
        local effect = mob:getStatusEffect(EFFECT_REGEN);
        if (effect ~= nil) then
            effect:addMod(MOD_REGAIN, 3 + hard);
            target:addMod(MOD_REGAIN, 3 + hard);
        end
    end

    return typeEffect;
end;
