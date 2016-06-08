-----------------------------------
-- Ability: Fold
-- Erases one roll or bust effect. Targets self-cast effect with the longest remaining duration.
-- Obtained: Corsair Level 75
-- Recast Time: 00:05:00
-- Duration: Instant
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (target:hasCorsairEffect()) then
        return 0,0;
    else
        return MSGBASIC_CANNOT_PERFORM,0;
    end
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    target:fold();
    local win = player:getLocalVar("winningStreak");
    if (win > 0) then
        player:setLocalVar("storedStreak", win);
        player:addTP(win * 50);
    end
    player:setLocalVar("winningStreak", 0);

    local merit = target:getMerit(MERIT_FOLD);
    merit = merit;
    
    if (math.random(0, 99) < merit) then
        target:resetRecast(RECAST_ABILITY,193);
    end
    
    return EFFECT_FOLD;
end;