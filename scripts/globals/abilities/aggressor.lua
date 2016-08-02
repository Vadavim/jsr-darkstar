-----------------------------------
-- Ability: Aggressor
-- Enhances accuracy but impairs evasion.
-- Obtained: Warrior Level 45
-- Recast Time: 5:00
-- Duration: 3:00
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    local merits = player:getMerit(MERIT_AGGRESSIVE_AIM);
    player:addStatusEffect(EFFECT_AGGRESSOR,merits,0,180);
--
--    if (player:hasStatusEffect(EFFECT_DEFENDER)) then
--        local effect = player:getStatusEffect(EFFECT_AGGRESSOR);
--        if (effect ~= nil) then
--            effect:addMod(MOD_ENMITY, 10);
--            target:addMod(MOD_ENMITY, 10);
--        end
--    elseif (player:hasStatusEffect(EFFECT_BERSERK)) then
--        local effect = player:getStatusEffect(EFFECT_AGGRESSOR);
--        if (effect ~= nil) then
--            effect:addMod(MOD_CRITHITRATE, 5);
--            target:addMod(MOD_CRITHITRATE, 5);
--        end
--    end
end;