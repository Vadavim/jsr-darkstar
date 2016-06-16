---------------------------------------------------------------------------------------------------
-- func: @getid
-- auth: TeoTwawki
-- desc: Prints the ID of the currently selected target under the cursor
---------------------------------------------------------------------------------------------------

require("scripts/globals/status");
cmdprops =
{
    permission = 1,
    parameters = "i"
};

function onTrigger(player, difficulty)
    local targ = player:getCursorTarget();

    if (targ ~= nil and targ:isPC() == false) then

        targ:setMobMod(MOBMOD_HARD_MODE, difficulty);
    end
end;
