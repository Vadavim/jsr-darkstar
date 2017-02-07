---------------------------------------------------------------------------------------------------
-- func: @givexp <amount> <player>
-- desc: Gives the GM or target player experience points.
---------------------------------------------------------------------------------------------------

--require("scripts/zones/Windurst_Walls/npcs/Koru-Moru");
require("scripts/globals/status");
require("scripts/globals/jsr_utils");
require("scripts/globals/jsr_bounty");
cmdprops =
{
    permission = 0,
    parameters = "s"
};



function onTrigger(player, command)
    if (command == nil) then
        player:SayToPlayer("Usage: @bounty check/claim");
        return;
    end

    if (command == "check") then
        printBounties(player);
        return;
    end

    if (command == "claim") then
        claimBounties(player);
        return;
    end


    player:SayToPlayer("Unknown command: " .. command);
    player:SayToPlayer("Usage: @bounty check/claim");

end

