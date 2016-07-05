-- 
-- Mog House related functions
--

require("scripts/globals/status")
require("scripts/globals/jsr_utils")
------------------------------------
-- Mog Locker constants
------------------------------------
MOGLOCKER_START_TS = 1009810800 -- unix timestamp for 2001/12/31 15:00
MOGLOCKER_ALZAHBI_VALID_DAYS = 7
MOGLOCKER_ALLAREAS_VALID_DAYS = 5
MOGLOCKER_ACCESS_TYPE_ALZAHBI = 0
MOGLOCKER_ACCESS_TYPE_ALLAREAS = 1
MOGLOCKER_PLAYERVAR_ACCESS_TYPE = "mog-locker-access-type"
MOGLOCKER_PLAYERVAR_EXPIRY_TIMESTAMP = "mog-locker-expiry-timestamp"

local function makeCluster(player, crystal, cluster)
    if (crystal > 0) then
        player:addItem(cluster, crystal);
        player:messageSpecial(ITEM_OBTAINED,cluster, 1);
    end
end

local crystals = {
    [4096] = {AUGMENT_STAT_STR, AUGMENT_FIRERES}, -- Fire
    [4097] = {AUGMENT_STAT_INT, AUGMENT_ICERES}, -- Ice
    [4098] = {AUGMENT_STAT_AGI, AUGMENT_WINDRES}, -- Wind
    [4099] = {AUGMENT_STAT_VIT, AUGMENT_EARTHRES}, -- Earth
    [4100] = {AUGMENT_STAT_DEX, AUGMENT_THUNDERRES}, -- Lightning
    [4101] = {AUGMENT_STAT_MND, AUGMENT_WATERRES}, -- Water
    [4102] = {AUGMENT_STAT_CHR, AUGMENT_LIGHTRES}, -- Light
    [4103] = {AUGMENT_MP, AUGMENT_DARKRES} -- Dark
};

local function crystalEnchant(player, npc, trade)
    local augmented = (trade:getItemSubId(2) == 4);
    if (augmented) then
        return false;
    end
    local id = trade:getItem(2);
    local crystal = trade:getItem(1);
    local crystalAmount = trade:getSlotQty(1);

    if (not (crystal >= 4096 and crystal <= 4103) or id == 0) then
        return false
    end

    local item = getItem(id);
    local level = item:getLevel();

    local buffTier = 0;
    if (crystalAmount == 4) then buffTier = 1;
    elseif (crystalAmount == 8) then buffTier = 2;
    elseif (crystalAmount == 12) then buffTier = 3;
    end

    if (buffTier == 0 or level < (buffTier - 1) * 30) then
        return false;
    end

    local buffOne = crystals[crystal];
    local buffTwo = crystals[crystal];

    local augments = {buffOne, buffTier, buffTwo, buffTier * 3};
    if (crystal == 4103) then
        augments[2] = 4 * (buffTier * (buffTier / 2));
    elseif (crystal == 4102) then
        augments[5] = AUGMENT_HP;
        augments[6] = 6 * (buffTier * (buffTier / 2));
    end

    player:tradeComplete();
    player:addItem(id, 1, augments[1], augments[2], augments[3], augments[4], augments[5], augments[6]);
    return true;
end


function moogleTrade(player,npc,trade)
    if (player:isInMogHouse()) then
        local numBronze = trade:getItemQty(2184);
        if (numBronze > 0) then
            if (addMogLockerExpiryTime(player, numBronze)) then
                -- remove bronze
                player:tradeComplete();
                -- send event
                player:messageSpecial(getMogLockerTextOffset(player:getPreviousZone()) + 2,getMogLockerExpiryTimestamp(player));
                return true;
            end
        end
    end

    if (crystalEnchant(player, npc, trade) == true) then
        return true;
    end



    local count = trade:getItemCount();
    local free = player:getFreeSlotsCount();
    local fire      =       (trade:getItemQty(4096) / 12);
    local ice      =       (trade:getItemQty(4097) / 12);
    local wind      =       (trade:getItemQty(4098) / 12);
    local earth      =       (trade:getItemQty(4099) / 12);
    local lightning      =       (trade:getItemQty(4100) / 12);
    local water      =       (trade:getItemQty(4101) / 12);
    local light      =       (trade:getItemQty(4102) / 12);
    local dark      =       (trade:getItemQty(4103) / 12);
    local total = fire + ice + wind + earth + lightning + water + light + dark;
    local cp = player:getCP();

    if (total * 12 == count and cp > total * 10 and math.floor(total) == total) then
        player:tradeComplete();
        player:delCP(total * 10);
        makeCluster(player, fire, 4104);
        makeCluster(player, ice, 4105);
        makeCluster(player, wind, 4106);
        makeCluster(player, earth, 4107);
        makeCluster(player, lightning, 4108);
        makeCluster(player, water, 4109);
        makeCluster(player, light, 4110);
        makeCluster(player, dark, 4111);
        return true;
    end
    return false;
end

function moogleTrigger(player,npc)
    if (player:isInMogHouse()) then
        local lockerTs = getMogLockerExpiryTimestamp(player);
        if (lockerTs ~= nil) then
            if (lockerTs == -1) then -- expired
                player:messageSpecial(getMogLockerTextOffset(player:getPreviousZone()) + 1,2184); -- 2184 is imperial bronze piece item id
            else
                player:messageSpecial(getMogLockerTextOffset(player:getPreviousZone()),lockerTs);
            end
        end

        local loadintro = player:getVar("MoghouseExplication");
        if (loadintro == 1) then
            player:startEvent(0x7530);
        else
            player:sendMenu(1);
        end
        return true;
    end
    return false;
end; 

-- get the offset of:
-- Your Mog Locker lease is valid until XXXXX, kupo.?Prompt?
-- for a given zone.
function getMogLockerTextOffset(zone)
    if (zone == 50) then -- Whitegate
        return 1160;
    elseif (zone == 48) then -- Al Zahbi
        return 7318;
    elseif (zone == 245) then -- Lower Jeuno
        return 6706;
    elseif (zone == 244) then -- Upper Jeuno
        return 6689;
    elseif (zone == 246) then -- Port Jeuno
        return 6674;
    elseif (zone == 243) then -- Ru'Lude Gardens
        return 6635;
    elseif (zone == 230) then -- Southern San d'Oria
        return 6572;
    elseif (zone == 231) then -- Northern San d'Oria
        return 6730;
    end
    return 6600;
end

-- Unlocks a mog locker for a player. Returns the 'expired' timestamp (-1)
function unlockMogLocker(player)
    player:setVar(MOGLOCKER_PLAYERVAR_EXPIRY_TIMESTAMP, -1);
    currentSize = player:getContainerSize(LOC_MOGLOCKER);
    if (currentSize == 0) then -- we do this check in case some servers auto-set 80 slots for mog locker items
        player:changeContainerSize(LOC_MOGLOCKER, 30);
    end
    return -1;
end

-- Sets the mog locker access type (all area or alzahbi only). Returns the new access type.
function setMogLockerAccessType(player, accessType)
    player:setVar(MOGLOCKER_PLAYERVAR_ACCESS_TYPE, accessType);
    return accessType;
end


-- Adds time to your mog locker, given the number of bronze coins.
-- The amount of time per bronze is affected by the access type
-- The expiry time itself is the number of seconds past 2001/12/31 15:00
-- Returns true if time was added successfully, false otherwise.
function addMogLockerExpiryTime(player, numBronze)
    local accessType = getMogLockerAccessType(player);
    local numDaysPerBronze = 5;
    if (accessType == MOGLOCKER_ACCESS_TYPE_ALZAHBI) then
        numDaysPerBronze = 7;
    end
    
    local currentTs = getMogLockerExpiryTimestamp(player)
    if (currentTs == nil) then
        -- print("Unable to add time: player hasn't unlocked mog locker.");
        return false;
    end
    
    if (currentTs == -1) then 
        currentTs = os.time() - MOGLOCKER_START_TS;
    end
        
    local timeIncrease = (60*60*24*numDaysPerBronze*numBronze);
    local newTs = currentTs + timeIncrease;
    
    player:setVar(MOGLOCKER_PLAYERVAR_EXPIRY_TIMESTAMP, newTs);
    -- send an invent size packet to enable the items if they weren't
    player:changeContainerSize(LOC_MOGLOCKER,0);
    return true;
end

-- Gets the expiry time for your locker. A return value of -1 is expired. A return value of nil means mog locker hasn't been unlocked.
function getMogLockerExpiryTimestamp(player)
    local expiryTime = player:getVar(MOGLOCKER_PLAYERVAR_EXPIRY_TIMESTAMP);
    
    if (expiryTime == 0) then
        return nil;
    end
    
    local now = os.time() - MOGLOCKER_START_TS;
    if (now > expiryTime) then
        player:setVar(MOGLOCKER_PLAYERVAR_EXPIRY_TIMESTAMP, -1);
        return -1;
    end
    
    -- TODO: Check if the timestamp > now then expire it.
    
    return expiryTime;
end

function getMogLockerAccessType(player)
    return player:getVar(MOGLOCKER_PLAYERVAR_ACCESS_TYPE);
end