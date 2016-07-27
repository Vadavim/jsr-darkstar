---------------------------------------------
--  Howl
--
--  Description: Grants the effect of Warcry to user and any linked allies.
--  Type: Enhancing
--  Utsusemi/Blink absorb: N/A
--  Range: Self and nearby mobs of same family and/or force up to 20'.
-----------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local power = 25;
    local duration = 180;
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);



    local typeEffect = EFFECT_WARCRY;
    skill:setMsg(MobBuffMove(mob, typeEffect, power, 0, duration));

    if (hard > 0) then
        local effect = target:getStatusEffect(EFFECT_WARCRY);
        if (effect ~= nil) then
            effect:addMod(MOD_REGAIN, 1 + hard);
            target:addMod(MOD_REGAIN, 1 + hard);
        end

    end

    return typeEffect;
end;
