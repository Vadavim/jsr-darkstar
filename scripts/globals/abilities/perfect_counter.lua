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
    local boost = player:getStatusEffect(EFFECT_BOOST);
    local bonus = 0;
    if (boost ~= nil) then
        bonus = boost:getSubPower() / 40;
        player:delStatusEffect(EFFECT_BOOST);
    end

   player:addStatusEffect(EFFECT_PERFECT_COUNTER,power,0,15 + bonus);
end;