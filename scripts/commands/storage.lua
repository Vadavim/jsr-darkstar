---------------------------------------------------------------------------------------------------
-- func: storage
-- desc: Allows character to upgrade their storage for a cost.
---------------------------------------------------------------------------------------------------
require("scripts/globals/shop");
cmdprops =
{
    permission = 0,
    parameters = "ss"
};

inventory_cost = {1000, 2000, 4000, 7000, 12000, 20000, 
                  34000, 56000, 78000, 99900};
                  
sack_cost = {500, 1000, 2000, 3000, 4000, 6000, 8000, 12000, 16000, 20000, 
                  28000, 34000, 56000, 62000, 78000, 99900};
                  
safe_cost = {1000, 2000, 4000, 6000, 10000, 15000};

case_cost = {100, 250, 500, 1000, 1500, 2500, 3200, 4800, 6000, 9000, 
                  12000, 15000, 15000, 15000, 15000, 15000};

function onTrigger(player, action, storage)
    -- eminence message: player:messageBasic(694, 100);
    if (action == "check") then
        checkCost(player, storage);
    end
    
end;

function checkCost(player, storage)  
    if (storage == "inventory") then
        local size = player:getContainerSize(0);
        local cost = inventory_cost[ (size / 5) - 5];
        local message = "The cost to upgrade your inventory is: ";
        player:PrintToPlayer(message .. tostring(cost) .. " gil");
        
    elseif (storage == "sack") then
        local size = player:getContainerSize(6);
        local cost = sack_cost[ (size / 5) + 1];
        local message = "The cost to upgrade your mog sack is: ";
        player:PrintToPlayer(message .. tostring(cost) .. " gil");
        
    elseif (storage == "satchel") then
        local size = player:getContainerSize(5);
        local cost = sack_cost[ (size / 5) + 1];
        local message = "The cost to upgrade your mog satchel is: ";
        player:PrintToPlayer(message .. tostring(cost) .. " gil");
        
    elseif (storage == "safe") then
        local size = player:getContainerSize(5);
        local cost = sack_cost[ (size / 5) + 1];
        local message = "The cost to upgrade your mog safe is: ";
        player:PrintToPlayer(message .. tostring(cost) .. " gil");
        
    end
end;

