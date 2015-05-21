---------------------------------------------------------------------------------------------------
-- func: cp
-- desc: Adds the given amount cp to the player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "i"
};

function onTrigger(player, cp)
    player:changeContainerSize(8,-5);
    if (cp == nil or tonumber(cp) == 0) then
        player:PrintToPlayer("You must enter an amount.");
        return;
    end
    player:addCP( cp );
end