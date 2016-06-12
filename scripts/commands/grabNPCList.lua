---------------------------------------------------------------------------------------------------
-- func: @getid
-- auth: TeoTwawki
-- desc: Prints the ID of the currently selected target under the cursor
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
};

function onTrigger(player, npcName)
        player:grabNPCList( player:getXPos(), player:getYPos(), player:getZPos(), player:getZoneID(), npcName);

end;
