require("scripts/globals/status");
require("scripts/globals/common");

local zoneMap = {
    [ZONE_ALTAIEU] = "Al'Taieu",
    [ZONE_ATTOHWA] = "Attohwa Chasm",
    [ZONE_BATALLIA] = "Batallia Downs",
    [ZONE_BEADEAUX] = "Beadeaux",
    [ZONE_BEAUCEDINE] = "Beaucedine Glacier",
    [ZONE_BEHEMOTHS] = "Behemoth's Dominion",
    [ZONE_BIBIKI] = "Bibiki Bay",
    [ZONE_BOSTAUNIEUX] = "Bostaunieux Oubliette",
    [ZONE_BUBURIMU] = "Buburimu Peninsula",
    [ZONE_TERRIGAN] = "Cape Terrigan",
    [ZONE_CARPENTERS] = "Carpenter's Landing",
    [ZONE_OZTROJA] = "Castle Oztroja",
    [ZONE_ZVAHL_BAILEYS] = "Zvahl Baileys",
    [ZONE_ZVAHL_KEEP] = "Zvahl Keep",
    [ZONE_CRAWLERS] = "Crawler's Nest",
    [ZONE_ONZOZO] = "Labyrinth of Onzozo",
    [ZONE_DANGRUF] = "Dangruf Wadi",
    [ZONE_RIVERNE_A1] = "Riverne Site A01",
    [ZONE_RIVERNE_B1] = "Riverne Site B01",
    [ZONE_DAVOI] = "Davoi",
    [ZONE_RANCOR] = "Den of Rancor",
    [ZONE_AERY] = "Dragon's Aery",
    [ZONE_ALTEPA_EAST] = "Eastern Atepa Desert",
    [ZONE_RONFAURE_EAST] = "East Ronfaure",
    [ZONE_MERIPHATAUD] = "Meriphataud Mountains",
    [ZONE_SARUTA_EAST] = "East Sarutabaruta",
    [ZONE_FEIYIN] = "Fei'Yin",
    [ZONE_GHELSBA_FORT] = "Fort Ghelsba",
    [ZONE_GARLAIGE] = "Garlaige Citadel",
    [ZONE_GHELSBA_OUTPOST] = "Ghelsba Outpost",
    [ZONE_GIDDEUS] = "Giddeus",
    [ZONE_HUXZOI] = "Hu'Xzoi",
    [ZONE_GUSGEN] = "Gusgen Mines",
    [ZONE_GUSTAV] = "Gustav Tunnel",
    [ZONE_CAULDRON] = "Ifrit's Cauldron",
    [ZONE_HORUTOTO_INNER] = "Inner Horutoto Ruins",
    [ZONE_JUGNER] = "Jugner Forest",
    [ZONE_RANPERRE] = "Ranperre's Tomb",
    [ZONE_KONSCHTAT] = "Konschtat Highlands",
    [ZONE_KORROLOKA] = "Korroloka Tunnel",
    [ZONE_KUFTAL] = "Kuftal Tunnel",
    [ZONE_LATHEINE] = "La Theine Plateau",
    [ZONE_DELKFUTT_LOW] = "Lower Delkfutt's Tower",
    [ZONE_LUFAISE] = "Lufaise Meadows",
    [ZONE_SHAKHRAMI] = "Maze of Shakhrami",
    [ZONE_DELKFUTT_MID] = "Middle Delkfutt's Tower",
    [ZONE_MISAREAUX] = "Misareaux Coast",
    [ZONE_MON_CAVERN] = "Monastic Caverns",
    [ZONE_NEWTON] = "Newton Movalpolos",
    [ZONE_GUSTABERG_NORTH] = "North Gustaberg",
    [ZONE_GUSTABERG_SOUTH] = "South Gustaberg",
    [ZONE_OLDTON] = "Oldton Movalpolos",
    [ZONE_ORDELLE] = "Ordelle's Cave",
    [ZONE_HORUTOTO_OUTER] = "Outer Horutoto Ruins",
    [ZONE_PALBOROUGH] = "Palborough Mines",
    [ZONE_PASHHOW] = "Pashhow Marshlands",
    [ZONE_PHANAUET] = "Phanaeut Channel",
    [ZONE_PHOMIUNA] = "Phomiuna Aqueducts",
    [ZONE_PROM_DEM] = "Promyvion-Dem",
    [ZONE_PROM_HOLLA] = "Promyvion-Holla",
    [ZONE_PROM_MEA] = "Promyvion-Mea",
    [ZONE_PROM_VAHZL] = "Promyvion-Vahzl",
    [ZONE_PSOXJA] = "Pso'Xja",
    [ZONE_QUFIM] = "Qufim Island",
    [ZONE_QUICKSAND] = "Quicksand Caves",
    [ZONE_RANGUEMONT] = "Ranguemont Pass",
    [ZONE_ROLANBERRY] = "Rolanberry Fields",
    [ZONE_ROMAEVE] = "Ro'Maeve",
    [ZONE_RUAUN] = "Ru'Aun Gardens",
    [ZONE_SACRARIUM] = "Sacrarium",
    [ZONE_SAUROMUGUE] = "Sauromugue Champaign",
    [ZONE_SEASERPENT] = "Seaserpent's Grotto",
    [ZONE_TAHRONGI] = "Tahrongi Canyon",
    [ZONE_UGGALEPIH] = "Temple of Uggalepih",
    [ZONE_BOYAHDA] = "The Boyahda Tree",
    [ZONE_ELDIEME] = "The Eldieme Necropolis",
    [ZONE_RUHMET] = "The Garden of Ru'Hmet",
    [ZONE_ZITAH] = "The Sanctuary of Zi'Tah",
    [ZONE_RUAVITAU] = "The Shrine of Ru'Avitau",
    [ZONE_TORAIMARAI] = "Toraimarai Canal",
    [ZONE_ULEGUERAND] = "Uleguerand Range",
    [ZONE_DELKFUTT_HIGH] = "Upper Delkfutt's",
    [ZONE_VALKURM] = "Valkurm Dunes",
    [ZONE_SORROWS] = "Valley of Sorrows",
    [ZONE_VELUGANNON] = "Ve'Lugannon Palace",
    [ZONE_ALTEPA_WEST] = "West Altepta Desert",
    [ZONE_RONFAURE_WEST] = "West Ronfaure",
    [ZONE_SARUTA_WEST] = "West Sarutabaruta",
    [ZONE_XARCABARD] = "Xarcabard",
    [ZONE_YHOATOR] = "Yhoator Jungle",
    [ZONE_YUGHOTT] = "Yughott Grotto",
    [ZONE_YUHTUNGA] = "Yuhtunga Jungle",
    [ZONE_ZERUHN] = "Zeruhn Mines",
}

-- Starting Zones
local zones1 = {
    ZONE_SARUTA_EAST, ZONE_SARUTA_WEST,
    ZONE_RONFAURE_WEST, ZONE_RONFAURE_EAST,
    ZONE_GUSTABERG_NORTH, ZONE_GUSTABERG_SOUTH,
    ZONE_PALBOROUGH, ZONE_RANPERRE, ZONE_HORUTOTO_INNER,
    ZONE_DANGRUF, ZONE_TAHRONGI, ZONE_LATHEINE, ZONE_KONSCHTAT
}

-- Beastmen Areas
local zones2 = {
    ZONE_GIDDEUS, ZONE_GHELSBA_OUTPOST,ZONE_YUGHOTT, ZONE_HORUTOTO_OUTER, ZONE_GHELSBA_FORT, ZONE_SHAKHRAMI,
    ZONE_PASHHOW, ZONE_JUGNER, ZONE_VALKURM, ZONE_MERIPHATAUD, ZONE_BUBURIMU, ZONE_CARPENTERS, ZONE_ORDELLE
}

local zones3 = {
    ZONE_KORROLOKA, ZONE_GUSGEN, ZONE_OZTROJA, ZONE_BEADEAUX, ZONE_DAVOI, ZONE_DELKFUTT_LOW, ZONE_DELKFUTT_MID, ZONE_DELKFUTT_HIGH,
    ZONE_QUFIM, ZONE_ROLANBERRY, ZONE_BATALLIA, ZONE_SAUROMUGUE, ZONE_RANGUEMONT,
    ZONE_YUHTUNGA, ZONE_ZITAH, ZONE_LUFAISE, ZONE_BEAUCEDINE, ZONE_ALTEPA_EAST, ZONE_BIBIKI
}

local zones4 = {
    ZONE_MISAREAUX, ZONE_PHOMIUNA, ZONE_RIVERNE_A1, ZONE_OLDTON, ZONE_GARLAIGE, ZONE_ATTOHWA, ZONE_YHOATOR, ZONE_SEASERPENT,
    ZONE_XARCABARD, ZONE_ELDIEME, ZONE_CRAWLERS, ZONE_MON_CAVERN, ZONE_BEHEMOTHS, ZONE_GUSTAV, ZONE_ALTEPA_WEST, ZONE_QUICKSAND
}

local zones5 = {
    ZONE_TORAIMARAI, ZONE_FEIYIN, ZONE_PSOXJA, ZONE_BOSTAUNIEUX, ZONE_SACRARIUM, ZONE_UGGALEPIH, ZONE_ZVAHL_KEEP,
    ZONE_ZVAHL_BAILEYS, ZONE_CAULDRON, ZONE_RIVERNE_B1
}

local zones6 = {
    ZONE_KUFTAL, ZONE_TERRIGAN, ZONE_BOYAHDA,
    ZONE_ONZOZO, ZONE_NEWTON, ZONE_RANCOR, ZONE_ULEGUERAND, ZONE_SORROWS,
    ZONE_ALTAIEU, ZONE_HUXZOI, ZONE_RUAVITAU, ZONE_VELUGANNON, ZONE_ROMAEVE, ZONE_RUAUN, ZONE_RUHMET, ZONE_AERY
}

local function getHotspots()
end

local function getRandomHotspotZone(zonelist)
    local size = 0;
    for i,v in pairs(zonelist) do
        size = size + 1;
    end

    return zonelist[math.random(1, size)];
end

function doHotspotUpdate()
    local lastMidnight = GetServerVariable("[HOT]Midnight");
    if (lastMidnight < os.time()) then

        SetServerVariable("[HOT]Midnight", getMidnight());
        SetServerVariable("[HOT]1", getRandomHotspotZone(zones1));
        SetServerVariable("[HOT]2", getRandomHotspotZone(zones2));
        SetServerVariable("[HOT]3", getRandomHotspotZone(zones3));
        SetServerVariable("[HOT]4", getRandomHotspotZone(zones4));
        SetServerVariable("[HOT]5", getRandomHotspotZone(zones5));
        SetServerVariable("[HOT]6", getRandomHotspotZone(zones6));
    end
end

function isHotspot(zoneid)
    if (GetServerVariable("[HOT]1") == zoneid) then return true;
    elseif (GetServerVariable("[HOT]2") == zoneid) then return true;
    elseif (GetServerVariable("[HOT]3") == zoneid) then return true;
    elseif (GetServerVariable("[HOT]4") == zoneid) then return true;
    elseif (GetServerVariable("[HOT]5") == zoneid) then return true;
    elseif (GetServerVariable("[HOT]6") == zoneid) then return true;
    end

    return false;
end

function printHotspots(player)
    player:SayToPlayer(zoneMap[GetServerVariable("[HOT]1")]);
    player:SayToPlayer(zoneMap[GetServerVariable("[HOT]2")]);
    player:SayToPlayer(zoneMap[GetServerVariable("[HOT]3")]);
    player:SayToPlayer(zoneMap[GetServerVariable("[HOT]4")]);
    player:SayToPlayer(zoneMap[GetServerVariable("[HOT]5")]);
    player:SayToPlayer(zoneMap[GetServerVariable("[HOT]6")]);
end