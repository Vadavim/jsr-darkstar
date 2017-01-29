---------------------------------------------------------------------------------------------------
-- func: costume
-- desc: Sets the players current costume.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "i"
};

function onTrigger(player, costume)
    local target = player:getCursorTarget();
    if (target ~= nil and target:isMob()) then
        target:setModelId(costume);
    else
        player:costume( costume );
    end

end