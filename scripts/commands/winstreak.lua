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
	--JSR: players start with smaller inventory
    player:setLocalVar("winningStreak", cp);
end