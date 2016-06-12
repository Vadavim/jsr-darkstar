---------------------------------------------------------------------------------------------------
-- func: @getid
-- auth: TeoTwawki
-- desc: Prints the ID of the currently selected target under the cursor
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
};

function onTrigger(player)
    local targ = player:getCursorTarget();
    if (targ ~= nil and targ:isPC() == false and targ:isPet() == false) then
        player:PrintToPlayer(targ:getID() .. " despawned.");
        targ:setPos( player:getXPos(), player:getYPos(), player:getZPos(), player:getRotPos(), player:getZoneID() );
        if (targ:isMob()) then
            targ:moveSpawn( player:getXPos(), player:getYPos(), player:getZPos(), player:getRotPos() );
        end


    else
        player:PrintToPlayer("Must select a target using in game cursor first.");
    end
end;
