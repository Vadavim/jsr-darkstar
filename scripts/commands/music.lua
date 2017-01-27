---------------------------------------------------------------------------------------------------
-- func: @givexp <amount> <player>
-- desc: Gives the GM or target player experience points.
---------------------------------------------------------------------------------------------------

--require("scripts/zones/Windurst_Walls/npcs/Koru-Moru");
require("scripts/globals/status");
require("scripts/globals/jsr_utils");
cmdprops =
{
    permission = 1,
    parameters = "ii"
};


function onTrigger(player, first, second)
    if (first == nil) then first = 0; end;
    if (second == nil) then second = 0; end;
    player:ChangeMusic(first, second);
end

