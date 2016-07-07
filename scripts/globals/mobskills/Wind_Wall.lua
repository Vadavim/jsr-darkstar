---------------------------------------------
--  Wind Wall
--
--  Description: Invokes a protective wind barrier for increased evasion.
--  Type: Enhancing
--  Utsusemi/Blink absorb: N/A
--  Range: Self
--  Notes: Very sharp evasion increase.
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
    local typeEffect = EFFECT_EVASION_BOOST;
    skill:setMsg(MobBuffMove(mob, typeEffect, 50, 0, 60));
    if (hard > 0 ) then
        local effect = mob:getStatusEffect(EFFECT_EVASION_BOOST);
        if (effect ~= nil) then
            local power = 1 + (mob:getMainLvl() / 4) * (1 + hard / 5);
            effect:addMod(MOD_SPIKES, 7);
            target:addMod(MOD_SPIKES, 7);
            effect:addMod(MOD_SPIKES_DMG, power);
            target:addMod(MOD_SPIKES_DMG, power);
        end
    end

    return typeEffect;
end;
