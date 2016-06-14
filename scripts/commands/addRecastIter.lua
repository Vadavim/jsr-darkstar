---------------------------------------------------------------------------------------------------
-- desc: Adds the given amount cp to the player.
---------------------------------------------------------------------------------------------------

require("scripts/globals/status");
cmdprops =
{
    permission = 1,
    parameters = "si"
};

function onTrigger(player, iType, amount)
    local cur = player:getLocalVar("recastTest");
    if (iType == "set") then
        player:setLocalVar("recastTest", amount);
        player:addRecast(RECAST_ABILITY, amount, 60);
        elseif (iType == "+") then
            player:setLocalVar("recastTest", cur + amount);
            player:addRecast(RECAST_ABILITY, cur + amount, 60);
            player:SayToPlayer("Recast ID: " .. tostring(cur + amount));
        elseif (iType == "-") then
        if (cur - amount < 0) then
            return
        end

        player:setLocalVar("recastTest", cur - amount);
        player:addRecast(RECAST_ABILITY, cur - amount, 60);
        player:SayToPlayer("Recast ID: " .. tostring(cur + amount));
    end

--    player:addRecastRange(RECAST_ABILITY, start, stop);
--    for i=start,stop do
--        player:addRecast(RECAST_ABILITY, i, 60);
--    end

end