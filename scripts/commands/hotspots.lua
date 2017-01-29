---------------------------------------------------------------------------------------------------
-- func: @givexp <amount> <player>
-- desc: Gives the GM or target player experience points.
---------------------------------------------------------------------------------------------------

--require("scripts/zones/Windurst_Walls/npcs/Koru-Moru");
require("scripts/globals/status");
require("scripts/globals/jsr_utils");
require("scripts/globals/jsr_hotspots");
cmdprops =
{
    permission = 0,
    parameters = "s"
};



function onTrigger(player, command)
    printHotspots(player);
end

