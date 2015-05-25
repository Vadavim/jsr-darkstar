-----------------------------------
-- Ability: Scavenge
-- Searches the ground around user for items.
-- Obtained: Ranger Level 10
-- Recast Time: 3:00
-- Duration: Instant
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

function onUseAbility(user,target,ability)

    -- RNG AF2 quest check
    local FireAndBrimstoneCS = user:getVar("fireAndBrimstone");

    if (user:getZoneID() == 151 and FireAndBrimstoneCS == 5 and -- zone + quest match
        user:getYPos() > -43 and user:getYPos() < -38 and -- Y match
        user:getXPos() > -85 and user:getXPos() < -73 and -- X match
        user:getZPos() > -85 and user:getZPos() < -75 and -- Z match
        math.random(100) < 50) then

        if (user:getFreeSlotsCount() == 0) then
            user:messageSpecial(ITEM_CANNOT_BE_OBTAINED,1113);
        else
            user:addItem(1113);
            user:messageSpecial(ITEM_OBTAINED,1113);
        end

    else

    -- TODO: whom ever fancies making scavenger.  The RNG stuff can then be refactored
        local item = stealTempItem(user:getMainLvl());
        user:addTempItem(item);
        user:messageSpecial(ITEM_OBTAINED,item);
    end

end;


function stealTempItem(level)
    if (level < 5) then
        return selectItem(4112, 4113, 4114); --Pot/Pot+1/Pot+2
    elseif (level < 10) then
        return selectItem(4113, 4114, 4115); --Pot+1/Pot+2/Pot+3
    elseif (level < 15) then
        return selectItem(4114, 4115, 4116); --Pot+2/Pot+3/HiPot
    elseif (level < 20) then
        return selectItem(4115, 4116, 4117); --Pot+3/HiPot/HiPot+1
    elseif (level < 25) then
        return selectItem(4116, 4117, 4118); --HiPot/HiPot+1/HiPot+2
    elseif (level < 30) then
        return selectItem(4117, 4118, 4119); --HiPot+1/HiPot+2/HiPot+3
    elseif (level < 35) then
        return selectItem(4118, 4119, 4120); --HiPot+2/HiPot+3/XPot
    elseif (level < 40) then
        return selectItem(4119, 4120, 4121); --HiPot+3/XPot/XPot+1
    elseif (level < 45) then
        return selectItem(4120, 4121, 4122); --XPot/XPot+1/XPot+2
    elseif (level < 50) then
        return selectItem(4121, 4122, 4123); --XPot+1/XPot+2/XPot+3
    elseif (level < 55) then
        return selectItem(4122, 4123, 4124); --XPot+2/XPot+3/MaxPot
    elseif (level < 60) then
        return selectItem(4123, 4124, 4125); --XPot+3/MaxPot/MaxPot+1
    elseif (level < 65) then
        return selectItem(4124, 4125, 4126); --MaxPot/MaxPot+1/MaxPot+2
    else
        return selectItem(4124, 4125, 4126); --MaxPot+1/MaxPot+2/MaxPot+3
    end
end;

function selectItem(item1, item2, item3)
    local rand = math.random(100);
    if (rand < 40) then
        return item1;
    elseif (rand < 60) then
        return item2;
    elseif (rand < 70) then
        return item3;
    elseif (rand < 78) then
        return 4115; --Remedy
    elseif (rand < 94) then
        return 5440; --Dusty Wing
    else
        return 4146; --Revitalizer
    end
end;