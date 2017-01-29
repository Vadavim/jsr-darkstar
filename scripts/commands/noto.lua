---------------------------------------------------------------------------------------------------
-- func: @givexp <amount> <player>
-- desc: Gives the GM or target player experience points.
---------------------------------------------------------------------------------------------------

--require("scripts/zones/Windurst_Walls/npcs/Koru-Moru");
require("scripts/globals/status");
require("scripts/globals/jsr_utils");
cmdprops =
{
    permission = 0,
    parameters = "s"
};

local notoMonsters = {
    [ZONE_TAHRONGI] = {17256901, 17256899, 17256906, 18, 25}, -- Pixie, Digger, Allocamelus
    [ZONE_LATHEINE] = {17195474, 17195012, 17195477, 18, 25}, -- Goblin Arch, Giant Pugil, Pixie
    [ZONE_KONSCHTAT] = {17220002, 17219997, 17220007, 18, 25}, -- Pixie, Digger, Thunderhead
    [ZONE_SARUTA_WEST] = {17248612, 17248606, 10, 15}, -- Bakru, Yagudo Condottiere
    [ZONE_SARUTA_EAST] = {17252815, 17252900, 10, 15}, -- Bolster, Pyracmon
    [ZONE_RONFAURE_WEST] = {17187272, 17187282, 17187288, 10, 15}, -- Digger, Fighterchief, Gougetooth
    [ZONE_RONFAURE_EAST] = {17190915, 17191322, 10, 15}, -- Mud Pugil, Gawky Gawain
    [ZONE_GUSTABERG_NORTH] = {17211857, 17211930 ,10, 15}, -- Lead Quadav, Pyracmon
    [ZONE_GUSTABERG_SOUTH] = {17215954, 10, 15}, -- Grylio
    [ZONE_GIDDEUS] = {17371140, 15, 20}, -- Puffer Pugil
    [ZONE_DANGRUF] = {17559869, 15, 20}, -- Chocoboleech
    [ZONE_GHELSBA_OUTPOST] = {17350667, 17350941, 15, 20}, -- Bloody Vrukwuk, Carrion Dragon
    [ZONE_GHELSBA_FORT] = {17354828, 15, 20}, -- Hundredscar Hajwaj
    [ZONE_RANPERRE] = {17555787, 20, 26}, -- Spartoi Sorcerer
    [ZONE_YUGHOTT] = {17358949, 20, 26}, -- Orcish Cursemaker
    [ZONE_HORUTOTO_INNER] = {17563807, 20, 26}, -- Boggart
    [ZONE_HORUTOTO_OUTER] = {17571903, 17572204,  25, 31}, -- Au Puch, Custom Cardian
    [ZONE_SHAKHRAMI] = {17588469, 17588589,  20, 26}, -- Gloombound Lurker, Lesath
    [ZONE_CARPENTERS] = {16785655, 16785648,  20, 26}, -- Wendigo, Wight
    [ZONE_BUBURIMU] = {17261085, 17261034, 17261047,  20, 26}, -- Goblin Bountyhunter, Goblin Guide, Ketos
    [ZONE_VALKURM] = {17199611,  20, 26}, -- Blue Bascinet

}
local function spawnNotoMob(player)
    local mobs = notoMonsters[player:getZoneID()];
    if (mobs == nil) then return false; end;

    local size = 0;
    for i,v in pairs(mobs) do
        size = size + 1;
    end

    local mobid = mobs[math.random(1, size - 2)];
    player:setLocalVar("notoSpawner", 1);
    local mob = GetMobByID(mobid);
    local level = player:getMainLvl();
    mob:setSpawn(player:getXPos(), player:getYPos(), player:getZPos());
    if (level < mobs[size - 1]) then
        level = mobs[size - 1]
    elseif (level > mobs[size]) then
        level = mobs[size]
    end;

    mob:setLevelRange(level + 2, level + 2);

    -- update music for party
    player:ChangeMusic(0, 343);
    player:ChangeMusic(1, 343);
    player:ChangeMusic(2, 343);
    player:ChangeMusic(3, 343);

    local party = player:getParty(false);
    if (party ~= nil) then
        for i,member in ipairs(party) do
            if (member:isPC()) then
                member:ChangeMusic(0, 343);
                member:ChangeMusic(1, 343);
                member:ChangeMusic(2, 343);
                member:ChangeMusic(3, 343);
            end

        end
    end
    local spawnedMob = SpawnMob(mobid);
    local partySize = player:getPartySize(0);
    if (partySize > 4) then
        spawnedMob:addMobMod(MOBMOD_HP_SCALE, 15 * (partySize - 4));
    end
    spawnedMob:updateHealth();
    spawnedMob:addHP(99999);
    return true;

end


local function getLevelRange(player)
    local mobs = notoMonsters[player:getZoneID()];
    if (mobs == nil) then
        player:SayToPlayer("Can't spawn a notorious monster here!");
        return nil;
    end;

    local size = 0;
    for i,v in pairs(mobs) do
        size = size + 1;
    end
    return {mobs[size - 1], mobs[size]}

end


function onTrigger(player, command)
    local notoVar = "noto_z" .. tostring(player:getZoneID());
    local notoVal = player:getVar(notoVar);
    if (command == nil) then
        player:SayToPlayer("Usage: @noto check/spawn");
        return;
    end

    if (command == "check") then
        local levelRange = getLevelRange(player);
        player:SayToPlayer("Current Zone Notoriety: " .. tostring(notoVal) .. "\n    You need 150 to spawn a notorious monster.\n    The level range is: " .. tostring(levelRange[1]) .. " to " .. tostring(levelRange[2]));
        return;
    end

    if (command == "spawn") then
        if (notoVal < 150) then
            player:SayToPlayer("You only have " .. tostring(notoVal) .. " notoriety.\n    You need 150 to spawn a notorious monster!");
            return false;
        end

        if (not spawnNotoMob(player)) then
            player:SayToPlayer("Can't spawn a notorious monster here!");
            return false;
        end


        player:setVar(notoVar, notoVal - 150);

        return
    end


    player:SayToPlayer("Unknown command: " .. command);


end

