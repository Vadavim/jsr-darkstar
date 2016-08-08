---------------------------------------------------------------------------------------------------
-- func: goto
-- desc: Goes to the target player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "i"
};

function onTrigger(player, npcId)
    local npc = GetNPCByID(npcId);
    player:setPos( npc:getXPos(), npc:getYPos(), npc:getZPos(), 0, npc:getZoneID() );
end