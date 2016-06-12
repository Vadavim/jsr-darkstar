---------------------------------------------------------------------------------------------------
-- func: @getid
-- auth: TeoTwawki
-- desc: Prints the ID of the currently selected target under the cursor
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "i"
};

function onTrigger(player, mobskillid)
    local targ = player:getCursorTarget();

    if (targ ~= nil and targ:isPC() == false) then

        targ:useMobAbility(mobskillid);
    end
end;
