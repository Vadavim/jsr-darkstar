-----------------------------------
-- Ability: Focus
-- Enhances user's accuracy.
-- Obtained: Monk Level 25
-- Recast Time: 5:00
-- Duration: 2:00
-----------------------------------

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
    local power = 100;
--    local curMax = player:getMaxHP();
    player:addStatusEffect(EFFECT_INNER_STRENGTH,power,0,120);
--    local newMax = player:getMaxHP();
--    player:addHP(newMax - curMax);
end;