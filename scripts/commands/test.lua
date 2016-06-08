---------------------------------------------------------------------------------------------------
-- func: @givexp <amount> <player>
-- desc: Gives the GM or target player experience points.
---------------------------------------------------------------------------------------------------

require("scripts/zones/Northern_San_dOria/npcs/Belgidiveau");
cmdprops =
{
    permission = 1,
    parameters = "s"
};

function onTrigger(player, amount, target)
    questReward(player);
end;