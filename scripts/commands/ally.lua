---------------------------------------------------------------------------------------------------
-- func: storage
-- desc: Allows character to upgrade their storage for a cost.
---------------------------------------------------------------------------------------------------
require("scripts/globals/status");
cmdprops =
{
    permission = 0,
    parameters = "ss"
};


local function checkAlly(player, ally)
    local id = ally:getLocalVar("isAlly");
    local desc1 = ""
    local desc2 = ""
    if (id == 73) then -- Volker
        desc1 = "\n[1]: +2% Crit Rate\n[3]: +40 Fire Res\n[5]: +20 MDEF\n[7]: Enmity -5";
        desc2 = "\n[9]: Warcry grants 250 TP to allies.\n[11]: Can use Blood Rage.\n[13]: Adds regen effect to Warcry.\n[15]: Warcry grants +25% Double Attack";
    end
    player:SayToPlayer(desc1);
    player:SayToPlayer(desc2);
    player:SayToPlayer("Current Rank: " .. player:getVar("ally_" .. tostring(ally:getLocalVar("isAlly"))));

end;

local function upgradeAlly(player, ally)
    local allyVar = "ally_" .. tostring(ally:getLocalVar("isAlly"));
    local curRank = player:getVar(allyVar);
    if (ally:getLocalVar("isAlly") == 0) then
        player:SayToPlayer("Not a valid ally!");
        return;
    end

    if (curRank == 15) then
        player:SayToPlayer("This ally's rank cannot be increased any further!");
        return;
    end

    if (player:getGil() < 4000) then
        player:SayToPlayer("Not enough gil! (need 4000)");
        return;
    end

    if (player:getCP() < 1000) then
        player:SayToPlayer("Not enough CP! (need 1000)");
        return;
    end

    player:delGil(4000);
    player:delCP(1000);
    player:SayToPlayer("Ally's rank has been increased!");
    player:setVar(allyVar, player:getVar(allyVar) + 1);
end




function onTrigger(player, action, storage)
    local target = player:getCursorTarget();
    if (action == "check") then
        checkAlly(player, target);
    end

    if (action == "upgrade") then
        upgradeAlly(player, target);
    end

end;

