---------------------------------------------------------------------------------------------------
-- func: bring <player>
-- desc: Brings the target to the player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
};

function onTrigger(player, target)
    player:recordTreasureLoc( player:getXPos(), player:getYPos(), player:getZPos(), player:getRotPos(), player:getZoneID() );
end