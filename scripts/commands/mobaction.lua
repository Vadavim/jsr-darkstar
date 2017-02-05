---------------------------------------------------------------------------------------------------
-- func: injectaction
-- desc: Injects an action packet with the specified action and animation id.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "iiiii"
};

function onTrigger(player, actionMessage, actionAnimation )
    player:injectActionPacket(13, actionAnimation, 0, 0, 185);
    player:messageBasic(43, 0, actionMessage);
end
