---------------------------------------------
--  Rhino Guard
--
--  Description: Enhances evasion.
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
    local tp = skill:getTP();
    local duration = 45 * fTP(tp, 1, 1.5, 2) * (1 + hard / 5)
    

    local typeEffect = EFFECT_EVASION_BOOST;
    skill:setMsg(MobBuffMove(mob, typeEffect, 30, 0, duration));

    if (hard > 0) then
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
