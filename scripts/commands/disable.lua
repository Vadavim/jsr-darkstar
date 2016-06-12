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
        DespawnMob(targ:getID());
        player:PrintToPlayer(targ:getID() .. " despawned.");
        targ:disableSpawn();

    else
        player:PrintToPlayer("Must select a target using in game cursor first.");
    end
end;
