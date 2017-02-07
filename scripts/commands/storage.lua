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


local function doStorage(player, storage, kind)
    local mult = 6;
    local size = 0;
    local type = "gil";
    local containerNumber = 0;
    if (storage == "inventory") then
        containerNumber = 0;
    elseif (storage == "sack") then
        containerNumber = 6;
        type = "cp";
        mult = 3;
    elseif (storage == "safe") then
        containerNumber = 1;
        mult = 6;
    elseif (storage == "satchel") then
        containerNumber = 5;
        type = "cp";
        mult = 3;
    elseif (storage == "case") then
        containerNumber = 7;
        type = "cp";
        mult = 3;
    elseif (storage == "wardrobe") then
        containerNumber = 8;
        mult = 12;
    else
        player:SayToPlayer("That is not a storage type!");
        return;
    end

    size = player:getContainerSize(containerNumber);

    if (size >= 80) then
        player:SayToPlayer("You cannot upgrade this storage any further.");
        return;
    end

    local cost = utils.clamp(((size * size) / 2)  * mult + 500, 100, 10000);
    if (kind == "check") then
        local message = "The cost to upgrade this storage is: " .. tostring(cost) .. " " .. type;
        player:SayToPlayer(message);
        return
    end

    if (type == "gil") then
        if (cost > player:getGil()) then
            player:SayToPlayer("You do not have enough gil to upgrade this storage");
            return;
        end

        player:delGil(cost);
        player:changeContainerSize(containerNumber, 5);
        if (storage == "wardrobe") then
            player:changeContainerSize(10, 5);
            player:changeContainerSize(11, 5);
            player:changeContainerSize(12, 5);
        end

        if (storage == "safe") then
            player:changeContainerSize(9, 5);
        end


        player:SayToPlayer("Increased " .. storage .. " storage by 5 slots.");
        return;
    elseif (type == "cp") then
        if (cost > player:getCP()) then
            player:SayToPlayer("You do not have enough cp to upgrade this storage");
            return;
        end

        player:delCP(cost);
        player:changeContainerSize(containerNumber, 5);
        player:SayToPlayer("Increased " .. storage .. " storage by 5 slots.");
        return;
    end
end;




function onTrigger(player, action, storage)
    -- eminence message: player:messageBasic(694, 100);
    if (action == "check") then
        doStorage(player, storage, "check");
    elseif (action == "upgrade") then
        doStorage(player, storage, "upgrade");
    else
        player:SayToPlayer("Usage: storage check/upgrade inventory/safe/satchel/case/wardrobe");
    end
    
end;

