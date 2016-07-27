---------------------------------------------
--  Bubble Armor
--
--  Description: Reduces magical damage received by 50%
--  Type: Enhancing
--  Utsusemi/Blink absorb: N/A
--  Range: Self
--  Notes:Nightmare Crabs use an enhanced version that applies a Magic Defense Boost that cannot be dispelled.
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_SHELL;
    local power = 50;
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local duration = 60 * fTP(skill:getTP(), 1, 1.5, 2) * (1 + hard / 5)

    local effect = mob:getStatusEffect(EFFECT_SHELL);
    if (effect ~= nil) then
        effect:addMod(MOD_FIREDEF, 60);
        target:addMod(MOD_FIREDEF, 60);
        effect:addMod(MOD_THUNDERDEF, -175);
        target:addMod(MOD_THUNDERDEF, -175);
    end

    if (hard > 0 and effect ~= nil) then
        local power = 1 + (mob:getMainLvl() / 4) * (1 + hard / 5);
        effect:addMod(MOD_SPIKES, 9);
        target:addMod(MOD_SPIKES, 9);
        effect:addMod(MOD_SPIKES_DMG, power);
        target:addMod(MOD_SPIKES_DMG, power);
    end


    skill:setMsg(MobBuffMove(mob, typeEffect, power, 0, duration));


    return typeEffect;
end;
