---------------------------------------------------------------------------------------------------
-- desc: Adds the given amount cp to the player.
---------------------------------------------------------------------------------------------------

require("scripts/globals/status");
cmdprops =
{
    permission = 1,
    parameters = "ii"
};

function onTrigger(player, start, stop)
--    player:addRecast(RECAST_MAGIC, 291, 600);
    player:insertSpellRecast(start, stop);
--    for i=start,stop do
--        player:addRecast(RECAST_ABILITY, i, 60);
--    end

end