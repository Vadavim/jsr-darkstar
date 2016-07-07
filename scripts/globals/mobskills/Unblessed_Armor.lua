---------------------------------------------
--  Unblessed Armor
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
    if (mob:hasStatusEffect(EFFECT_SHELL)) then
        return 1;
    end

    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local duration = 80 * fTP(skill:getTP(), 1, 1.5, 2) * (1 + hard / 5)
    local typeEffect = EFFECT_SHELL;
    local power = 50;

    skill:setMsg(MobBuffMove(mob, typeEffect, power, 0, duration));
    local effect = mob:getStatusEffect(EFFECT_SHELL);
    if (effect ~= nil) then
        mob:addMod(MOD_LIGHTDEF, -255);
        effect:addMod(MOD_LIGHTDEF, -255);


        if (hard > 0 ) then
            local power = 1 + (mob:getMainLvl() / 4) * (1 + hard / 5);
            effect:addMod(MOD_SPIKES, 10);
            target:addMod(MOD_SPIKES, 10);
            effect:addMod(MOD_SPIKES_DMG, power);
            target:addMod(MOD_SPIKES_DMG, power);
        end

    end


    return typeEffect;
end;
