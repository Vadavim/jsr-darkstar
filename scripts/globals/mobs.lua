-----------------------------------
-- Global version of onMobDeath
-----------------------------------
package.loaded["scripts/globals/conquest"] = nil;
-----------------------------------
require("scripts/globals/conquest");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/globals/status");
require("scripts/globals/jsr_utils");

-----------------------------------
-- onMobDeathEx
-----------------------------------


local ZONE_TAHRONGI = 117;
local ZONE_MON_CAVERN = 150;
local ZONE_BUBURIMU = 118;
local ZONE_MERIPHATAUD = 119;
local ZONE_SAUROMUGUE = 120;
local ZONE_ZITAH = 121;
local ZONE_ROMAEVE = 122;
local ZONE_YUHTUNGA = 123;
local ZONE_YHOATOR = 124;
local ZONE_ALTEPA_WEST = 125;
local ZONE_CAULDRON = 205;
local ZONE_QUFIM = 126;
local ZONE_SEASERPENT = 176;
local ZONE_BEHEMOTHS = 127;
local ZONE_SORROWS = 128;
local ZONE_VALKURM = 103;
local ZONE_LATHEINE = 102;
local ZONE_ZERUHN = 172;
local ZONE_KONSCHTAT = 108;
local ZONE_PASHHOW = 109;
local ZONE_ROLANBERRY = 110;
local ZONE_BOSTAUNIEUX = 167;
local ZONE_BEAUCEDINE = 111;
local ZONE_ULEGURAND = 5;
local ZONE_XARCABARD = 112;
local ZONE_TERRIGAN = 113;
local ZONE_ALTEPA_EAST = 114;
local ZONE_GIDDEUS = 145;
local ZONE_PALBOROUGH = 143;
local ZONE_JUGNER = 104;
local ZONE_BATALLIA = 105;
local ZONE_HORUTOTO_INNER = 192;
local ZONE_HORUTOTO_OUTER = 194;
local ZONE_DANGRUF = 191;
local ZONE_SHAKHRAMI = 198;
local ZONE_GHELSBA_OUTPOST = 140;
local ZONE_GHELSBA_FORT = 141;
local ZONE_DELKFUTT_LOW = 184;
local ZONE_ELDIEME = 195;
local ZONE_GUSGEN = 196;
local ZONE_OZTROJA = 151;
local ZONE_DELKFUTT_MID = 157;
local ZONE_DELKFUTT_HIGH = 158;
local ZONE_ZVAHL_KEEP = 162;
local ZONE_ZVAHL_BAILEYS = 161;

local ZONE_PROM_DEM = 18;
local ZONE_PROM_HOLLA = 17;
local ZONE_PROM_MEA = 20;
local ZONE_PROM_VAHZL = 22;

local ZONE_PHANAUET = 1;
local ZONE_CARPENTERS = 2;
local ZONE_MANACLIPPER = 3;
local ZONE_BIBIKI = 4;
local ZONE_ATTOHWA = 5;
local ZONE_OLDTON = 11;
local ZONE_NEWTON = 12;
local ZONE_LUFAISE = 24;
local ZONE_MISAREAUX = 25;
local ZONE_PHOMIUNA = 27;
local ZONE_SACRARIUM = 28;
local ZONE_RIVERNE_B1 = 29;
local ZONE_RIVERNE_A1 = 29;
local ZONE_ALTAIEU = 33;
local ZONE_HUXZOI = 34;
local ZONE_RUHMET = 35;
local ZONE_TORAIMARAI = 169;
local ZONE_SARUTA_EAST = 116;
local ZONE_SARUTA_WEST = 115;
local ZONE_RONFAURE_EAST = 101;
local ZONE_RONFAURE_WEST = 100;
local ZONE_GUSTABERG_NORTH = 106;
local ZONE_GUSTABERG_SOUTH = 107;
local ZONE_YUGHOTT = 176;
local ZONE_CRAWLERS = 197;
local ZONE_QULUN = 197;
local ZONE_BEADEAUX = 147;
local ZONE_GARLAIGE = 200;
local ZONE_RANCOR = 160;
local ZONE_RANGUEMONT = 166;
local ZONE_PSOXJA = 9;


-- item, min, max, zone, job, bonusamount, family
local commonRewards = {
    {4104, 1, 99, 0, 0, 0, 0}, -- Fire Cluster
    {4105, 1, 99, 0, 0, 0, 0}, -- Ice Cluster
    {4106, 1, 99, 0, 0, 0, 0}, -- Wind Cluster
    {4107, 1, 99, 0, 0, 0, 0}, -- Earth Cluster
    {4108, 1, 99, 0, 0, 0, 0}, -- Lightning Cluster
    {4109, 1, 99, 0, 0, 0, 0}, -- Water Cluster
    {4110, 1, 99, 0, 0, 0, 0}, -- Light Cluster
    {4111, 1, 99, 0, 0, 0, 0}, -- Dark Cluster
    {656, 1, 15, 0, 0, 0, 0}, -- Beastcoin
    {750, 16, 30, 0, 0, 0, 0}, -- Silver Beastcoin
    {749, 31, 45, 0, 0, 0, 0}, -- Mythril Beastcoin
    {748, 46, 60, 0, 0, 0, 0}, -- Gold Beastcoin
    {751, 61, 99, 0, 0, 0, 0}, -- Platinum Beastcoin
    {4145, 50, 99, 0, 0, 0, 0}, -- Elixir
    {4144, 75, 99, 0, 0, 0, 0}, -- Hi-Elixir
    {4123, 50, 99, 0, 0, 0, 0}, -- Icarus Wing
    {4155, 1, 45, 0, 0, 0, 0}, -- Remedy
    {4149, 45, 99, 0, 0, 0, 0}, -- Panacea
    {4198, 1, 99, 0, 0, 0, 0}, -- Dragon's Chronicles
    {4247, 1, 99, 0, 0, 0, 0}, -- Miratete's Memoirs
    {4248, 1, 99, 0, 0, 0, 0}, -- Ginuva's Battle Theory
    {4249, 1, 99, 0, 0, 0, 0}, -- Schultz's Stratagems

    -- Beastmen Items
    {760, 1, 25, 0, 0, SYSTEM_BEASTMEN, 0}, -- Silver Beastcoin
    {748, 26, 50, 0, 0, SYSTEM_BEASTMEN, 0}, -- Gold Beastcoin
    {1875, 51, 99, 0, 0, SYSTEM_BEASTMEN, 0}, -- Ancient Beastcoin





    -- East Sarutabaruta Items (1 - 10)
    {371, 1, 99, ZONE_SARUTA_EAST, 0, 0, 0}, -- Butterfly Cage
    {198, 1, 99, ZONE_SARUTA_EAST, 0, 0, 0}, -- Gilt Tapestry
    {340, 1, 99, ZONE_SARUTA_EAST, 0, 0, 0}, -- Fisherman's Signboard
    {336, 1, 99, ZONE_SARUTA_EAST, 0, 0, 0}, -- Boneworker's Signboard
    {14729, 1, 99, ZONE_SARUTA_EAST, 0, 0, 0}, -- Pilferer's Earring (+2 DEX if THF sub)
    {14738, 1, 99, ZONE_SARUTA_EAST, 0, 0, 0}, -- Magician's Earring (+30 MP if SMN is subjob)
    {14733, 1, 99, ZONE_SARUTA_EAST, 0, 0, 0}, -- Singer's Earring (+5 EVA if BRD is subjob)
    {16041, 1, 99, ZONE_SARUTA_EAST, 0, 0, 0}, -- Republic Earring (Teleport to Windy)

    -- West Sarutabaruta (1 - 10)
    {116, 1, 99, ZONE_SARUTA_WEST, 0, 0, 0}, -- Windurstian Tree
    {155, 1, 99, ZONE_SARUTA_WEST, 0, 0, 0}, -- Dream Stocking
    {337, 1, 99, ZONE_SARUTA_WEST, 0, 0, 0}, -- Weaver's Signboard
    {338, 1, 99, ZONE_SARUTA_WEST, 0, 0, 0}, -- Culinarian's Signboard
    {342, 1, 99, ZONE_SARUTA_WEST, 0, 0, 0}, -- Alchemist's Signboard
    {14729, 1, 99, ZONE_SARUTA_WEST, 0, 0, 0}, -- Pilferer's Earring (+2 DEX if THF sub)
    {14738, 1, 99, ZONE_SARUTA_WEST, 0, 0, 0}, -- Magician's Earring (+30 MP if SMN is subjob)
    {14732, 1, 99, ZONE_SARUTA_WEST, 0, 0, 0}, -- Trimmer's Earring (+5 ACC if BST is subjob)
    {14734, 1, 99, ZONE_SARUTA_WEST, 0, 0, 0}, -- Beater's Earring (+3 RACC if RNG is subjob)
    {16041, 1, 99, ZONE_SARUTA_WEST, 0, 0, 0}, -- Republic Earring (Teleport to Windy)


    -- North Gustaburg (1 - 10)
    {3644, 1, 99, ZONE_GUSTABERG_NORTH, 0, 0, 0}, -- Aeolsglocke
    {141, 1, 99, ZONE_GUSTABERG_NORTH, 0, 0, 0}, -- Dream Coffer
    {136, 1, 99, ZONE_GUSTABERG_NORTH, 0, 0, 0}, -- Kaiserin Cosmetics
    {3686, 1, 99, ZONE_GUSTABERG_NORTH, 0, 0, 0}, -- Duelist Board
    {16040, 1, 99, ZONE_GUSTABERG_NORTH, 0, 0, 0}, -- Republic Earring (teleport to Basty)
    {14731, 1, 99, ZONE_GUSTABERG_NORTH, 0, 0, 0}, -- Killer Earring (+5 ATK if DRK is subjob)
    {14735, 1, 99, ZONE_GUSTABERG_NORTH, 0, 0, 0}, -- Ashigaru Earring (+5 Parry if SAM is subjob)
    {13435, 1, 99, ZONE_GUSTABERG_NORTH, 0, 0, 0}, -- Mercenary's Earring (+2 Vit when WAR is subjob)

    -- South Gustaburg (1 - 10)
    {115, 1, 99, ZONE_GUSTABERG_SOUTH, 0, 0, 0}, -- Bastokan Tree
    {335, 1, 99, ZONE_GUSTABERG_SOUTH, 0, 0, 0}, -- Goldsmith's Signboard
    {194, 1, 99, ZONE_GUSTABERG_SOUTH, 0, 0, 0}, -- Blacksmith's Plaque
    {334, 1, 99, ZONE_GUSTABERG_SOUTH, 0, 0, 0}, -- Blacksmith's Signboard
    {356, 1, 99, ZONE_GUSTABERG_SOUTH, 0, 0, 0}, -- Set of Guild Flyers
    {16040, 1, 99, ZONE_GUSTABERG_SOUTH, 0, 0, 0}, -- Republic Earring (teleport to Basty)
    {14731, 1, 99, ZONE_GUSTABERG_SOUTH, 0, 0, 0}, -- Killer Earring (+5 ATK if DRK is subjob)
    {14736, 1, 99, ZONE_GUSTABERG_SOUTH, 0, 0, 0}, -- Genin Earring (+4 AGI if NIN is subjob)
    {13436, 1, 99, ZONE_GUSTABERG_SOUTH, 0, 0, 0}, -- Wrestler's Earring (+30 HP if MNK is subjob)

    -- East Ronfaure (1 - 10)
    {86, 1, 99, ZONE_RONFAURE_EAST, 0, 0, 0}, -- Sandorian Tree
    {140, 1, 99, ZONE_RONFAURE_EAST, 0, 0, 0}, -- Dream Platter
    {113, 1, 99, ZONE_RONFAURE_EAST, 0, 0, 0}, -- Cleaning Tool Set
    {343, 1, 99, ZONE_RONFAURE_EAST, 0, 0, 0}, -- Harp Stool
    {14729, 1, 99, ZONE_RONFAURE_EAST, 0, 0, 0}, -- Esquire's Earring (+5 DEF if PLD sub)
    {14670, 1, 99, ZONE_RONFAURE_EAST, 0, 0, 0}, -- Safeguard Ring (+2 DEF)
    {16039, 1, 99, ZONE_RONFAURE_EAST, 0, 0, 0}, -- Kingdom Earring (teleport to Sandy)

    -- West Ronfaure (1 - 10)
    {3643, 1, 99, ZONE_RONFAURE_WEST, 0, 0, 0}, -- Carillon Vermeil
    {202, 1, 99, ZONE_RONFAURE_WEST, 0, 0, 0}, -- Golden Fleece
    {339, 1, 99, ZONE_RONFAURE_WEST, 0, 0, 0}, -- Tanner's Signboard
    {341, 1, 99, ZONE_RONFAURE_WEST, 0, 0, 0}, -- Carpenter's Sigboard
    {14729, 1, 99, ZONE_RONFAURE_WEST, 0, 0, 0}, -- Esquire's Earring (+5 DEF if PLD sub)
    {16039, 1, 99, ZONE_RONFAURE_WEST, 0, 0, 0}, -- Kingdom Earring (teleport to Sandy)

    -- Palborough Mines (5 - 20)
    {3595, 1, 99, ZONE_PALBOROUGH, 0, 0, 0}, -- Gemscope
    {348, 1, 99, ZONE_PALBOROUGH, 0, 0, 0}, -- Marble Plaque
    {14737, 1, 99, ZONE_PALBOROUGH, 0, 0, 0}, -- Wyvern Earring (+5% Haste if DRG is subjob)
    {13370, 1, 99, ZONE_PALBOROUGH, 0, 0, 0}, -- Silver Earring +1
    {13371, 1, 99, ZONE_PALBOROUGH, 0, 0, 0}, -- Mythril Earring +1
    {13519, 1, 99, ZONE_PALBOROUGH, 0, 0, 0}, -- Mythril Ring +1
    {14689, 1, 99, ZONE_PALBOROUGH, 0, 0, 0}, -- Courage Earring +1

    -- King Ranperre's Tomb (5 - 20)
    {444, 1, 99, ZONE_RANPERRE, 0, 0, 0}, -- Luxurious Chest
    {445, 1, 99, ZONE_RANPERRE, 0, 0, 0}, -- Vaisselier Royale
    {3684, 1, 99, ZONE_RANPERRE, 0, 0, 0}, -- Princess Board
    {3685, 1, 99, ZONE_RANPERRE, 0, 0, 0}, -- Empress Board

    -- Dangruf Wadi (5 - 20)
    {3638, 1, 99, ZONE_DANGRUF, 0, 0, 0}, -- Plate of Mock Hare
    {3690, 1, 99, ZONE_DANGRUF, 0, 0, 0}, -- Fighter Board
    {3714, 1, 99, ZONE_DANGRUF, 0, 0, 0}, -- Pot of White Clematis
    {3715, 1, 99, ZONE_DANGRUF, 0, 0, 0}, -- Pot of Pink Clematis

    -- Inner Horutoto Ruins (5 - 20)
    {89, 1, 99, ZONE_HORUTOTO_INNER, 0, 0, 0}, -- Wastebasket
    {278, 1, 99, ZONE_HORUTOTO_INNER, 0, 0, 0}, -- Cardian Statue
    {370, 1, 99, ZONE_HORUTOTO_INNER, 0, 0, 0}, -- Windurstian Tea Set
    {3674, 1, 99, ZONE_HORUTOTO_INNER, 0, 0, 0}, -- Alembic
    {3675, 1, 99, ZONE_HORUTOTO_INNER, 0, 0, 0}, -- Flask Set

    -- Outer Horutoto Ruins (15 - 30)
    {137, 1, 99, ZONE_HORUTOTO_OUTER, 0, 0, 0}, -- Cordon Bleu Cooking Set
    {278, 1, 99, ZONE_HORUTOTO_OUTER, 0, 0, 0}, -- Cardian Statue
    {367, 1, 99, ZONE_HORUTOTO_OUTER, 0, 0, 0}, -- Pot Topper
    {441, 1, 99, ZONE_HORUTOTO_OUTER, 0, 0, 0}, -- Taru Tot Toyset
    {3689, 1, 99, ZONE_HORUTOTO_OUTER, 0, 0, 0}, -- Wizardess Board

    -- Tahrongi Canyon (10 - 20)
    {26, 1, 99, ZONE_TAHRONGI, 0, 0, 0}, -- Tarutaru Desk
    {104, 1, 99, ZONE_TAHRONGI, 0, 0, 0}, -- Tarutaru Folding Scren
    {16007, 1, 99, ZONE_TAHRONGI, 0, 0, 0}, -- Protect Earring
    {13378, 1, 99, ZONE_TAHRONGI, 0, 0, 0}, -- Stamina Earring +1
    {13366, 1, 99, ZONE_TAHRONGI, 0, 0, 0}, -- Dodge Earring

    -- La Theine (10 - 20)
    {120, 1, 99, ZONE_LATHEINE, 0, 0, 0}, -- Freshwater Aquarium
    {320, 1, 99, ZONE_LATHEINE, 0, 0, 0}, -- Harpsichord
    {15835, 1, 99, ZONE_LATHEINE, 0, 0, 0}, -- Desperado Ring
    {368, 1, 99, ZONE_LATHEINE, 0, 0, 0}, -- Sandorian Tea Set
    {3693, 1, 99, ZONE_LATHEINE, 0, 0, 0}, -- Lamb Carving

    -- Konschtat Highlands (10 - 20)
    {369, 1, 99, ZONE_KONSCHTAT, 0, 0, 0}, -- Bastokan Tea Set
    {371, 1, 99, ZONE_KONSCHTAT, 0, 0, 0}, -- Butterfly Cage
    {3697, 1, 99, ZONE_KONSCHTAT, 0, 0, 0}, -- Mandarin
    {3688, 1, 99, ZONE_KONSCHTAT, 0, 0, 0}, -- Dancer Board

    -- Giddeus (15 - 25)
    {3639, 1, 99, ZONE_GIDDEUS, 0, 0, 0}, -- Purifying Ewer
    {3641, 1, 99, ZONE_GIDDEUS, 0, 0, 0}, -- Kabuto-kazari
    {3692, 1, 99, ZONE_GIDDEUS, 0, 0, 0}, -- Stoic Board
    {13365, 1, 99, ZONE_GIDDEUS, 0, 0, 0}, -- Shield Earring
    {14690, 1, 99, ZONE_GIDDEUS, 0, 0, 0}, -- Knowledge Earring +1
    {14694, 1, 99, ZONE_GIDDEUS, 0, 0, 0}, -- Energy Earring +1
    {13439, 1, 99, ZONE_GIDDEUS, 0, 0, 0}, -- Warlock's Earring (+1 HMP if RDM sub);w

    -- Yughott Grotto (15 - 25)
    {191, 1, 99, ZONE_YUGHOTT, 0, 0, 0}, -- Fishing Hole Map
    {449, 1, 99, ZONE_YUGHOTT, 0, 0, 0}, -- Personal Table
    {460, 1, 99, ZONE_YUGHOTT, 0, 0, 0}, -- Bakery Platter
    {3691, 1, 99, ZONE_YUGHOTT, 0, 0, 0}, -- Guardian Board

    -- Ghelsba Outpost (10 - 20)
    {3600, 1, 99, ZONE_GHELSBA_OUTPOST, 0, 0, 0}, -- Bongo Drum
    {3668, 1, 99, ZONE_GHELSBA_OUTPOST, 0, 0, 0}, -- Hide Stretcher
    {144, 1, 99, ZONE_GHELSBA_OUTPOST, 0, 0, 0}, -- Caisson
    {201, 1, 99, ZONE_GHELSBA_OUTPOST, 0, 0, 0}, -- Totem Pole
    {13435, 1, 99, ZONE_GHELSBA_OUTPOST, 0, 0, 0}, -- Mercenary's Earring (+2 Vit when WAR is subjob)
    {14737, 1, 99, ZONE_GHELSBA_OUTPOST, 0, 0, 0}, -- Wyvern Earring (+5% Haste if DRG is subjob)

    -- Ghelsba Fort (10 - 20)
    {125, 1, 99, ZONE_GHELSBA_FORT, 0, 0, 0}, -- Reliquary
    {447, 1, 99, ZONE_GHELSBA_FORT, 0, 0, 0}, -- Mensa Lunata
    {3679, 1, 99, ZONE_GHELSBA_FORT, 0, 0, 0}, -- Beastman Gonfalon

    -- Buburimu Peninsula Items (15 - 25)
    {351, 1, 99, ZONE_BUBURIMU, 0, 0, 0}, -- Federal Mercenary's Hammock
    {103, 1, 99, ZONE_BUBURIMU, 0, 0, 0}, -- Goldfish Bowl
    {121, 1, 99, ZONE_BUBURIMU, 0, 0, 0}, -- Saltwater Aquarium
    {195, 1, 99, ZONE_BUBURIMU, 0, 0, 0}, -- The Big One
    {192, 1, 99, ZONE_BUBURIMU, 0, 0, 0}, -- Hoary Spire
    {13314, 1, 99, ZONE_BUBURIMU, 0, 0, 0}, -- Shell Earring +1
    {14694, 1, 99, ZONE_BUBURIMU, 0, 0, 0}, -- Energy Earring +1
    {16044, 1, 99, ZONE_BUBURIMU, 0, 0, 0}, -- Mhaura Earring

    -- Valkurm Dunes (15 - 25)
    {3670, 1, 99, ZONE_VALKURM, 0, 0, 0}, -- Net and Lure
    {3671, 1, 99, ZONE_VALKURM, 0, 0, 0}, -- Set of Stockfish
    {16398, 1, 99, ZONE_VALKURM, 0, 0, 0}, -- Burning Cesti
    {16621, 1, 99, ZONE_VALKURM, 0, 0, 0}, -- Flame Sword
    {16929, 1, 99, ZONE_VALKURM, 0, 0, 0}, -- Burning Claymore

    -- Jugner Forest (15 - 25)
    {443, 1, 99, ZONE_JUGNER, 0, 0, 0}, -- Aureous Chest
    {3698, 1, 99, ZONE_JUGNER, 0, 0, 0}, -- Cherry Tree
    {3717, 1, 99, ZONE_JUGNER, 0, 0, 0}, -- Birch Tree
    {3683, 1, 99, ZONE_JUGNER, 0, 0, 0}, -- Forestdweller Board
    {3645, 1, 99, ZONE_JUGNER, 0, 0, 0}, -- Leafbell
    {13326, 1, 99, ZONE_JUGNER, 0, 0, 0}, -- Beetle Earring +1
    {13501, 1, 99, ZONE_JUGNER, 0, 0, 0}, -- Beetle Ring +1
    {14654, 1, 99, ZONE_JUGNER, 0, 0, 0}, -- Poisona Ring

    -- Pashhow Marshlands (15 - 25)
    {284, 1, 99, ZONE_PASHHOW, 0, 0, 0}, -- Goobbue Statue
    {3621, 1, 99, ZONE_PASHHOW, 0, 0, 0}, -- Leafberry Wreath
    {432, 1, 99, ZONE_PASHHOW, 0, 0, 0}, -- Yellow Storm Lantern
    {372, 1, 99, ZONE_PASHHOW, 0, 0, 0}, -- Cricket Cage
    {330, 1, 99, ZONE_PASHHOW, 0, 0, 0}, -- Green Hobby Bo



    -- Meriphataud Mountains (15 - 25)
    {43, 1, 99, ZONE_MERIPHATAUD, 0, 0, 0}, -- Wicker Box
    {440, 1, 99, ZONE_MERIPHATAUD, 0, 0, 0}, -- Squat Desk
    {3649, 1, 99, ZONE_MERIPHATAUD, 0, 0, 0}, -- Harvest Horror
    {3672, 1, 99, ZONE_MERIPHATAUD, 0, 0, 0}, -- Carpenter's Kit

    -- Shakhrami (15 - 30)
    {361, 1, 99, ZONE_SHAKHRAMI, 0, 0, 0}, -- Gallipot
    {360, 1, 99, ZONE_SHAKHRAMI, 0, 0, 0}, -- Matka
    {359, 1, 99, ZONE_SHAKHRAMI, 0, 0, 0}, -- Bahut
    {3663, 1, 99, ZONE_SHAKHRAMI, 0, 0, 0}, -- Set of Bonecrafting Tools
    {13362, 1, 99, ZONE_SHAKHRAMI, 0, 0, 0}, -- Bone Earring +1
    {13500, 1, 99, ZONE_SHAKHRAMI, 0, 0, 0}, -- Bone Ring +1
    {13361, 1, 99, ZONE_SHAKHRAMI, 0, 0, 0}, -- Wing Earring
    {14803, 1, 99, ZONE_SHAKHRAMI, 0, 0, 0}, -- Optical Earring

    -- Carpenter's Landing Items (20 - 30)
    {180, 1, 99, ZONE_CARPENTERS, 0, 0, 0}, -- Bonbori
    {371, 1, 99, ZONE_CARPENTERS, 0, 0, 0}, -- Butterfly Cage
    {362, 1, 99, ZONE_CARPENTERS, 0, 0, 0}, -- Fluoro Flora
    {373, 1, 99, ZONE_CARPENTERS, 0, 0, 0}, -- Glowfly Cage
    {3632, 1, 99, ZONE_CARPENTERS, 0, 0, 0}, -- Carpenter's Stall

    -- Korroloka Tunnel (25 - 35)
    {419, 1, 99, ZONE_KORROLOKA, 0, 0, 0}, -- Leisure Table
    {3647, 1, 99, ZONE_KORROLOKA, 0, 0, 0}, -- Spook-a-swirl
    {3661, 1, 99, ZONE_KORROLOKA, 0, 0, 0}, -- Stone Hearth

    -- Gusgen Mines (20 - 30)
    {151, 1, 99, ZONE_GUSGEN, 0, 0, 0}, -- Fool's Gold
    {153, 1, 99, ZONE_GUSGEN, 0, 0, 0}, -- Mastersmith Anvil
    {3595, 1, 99, ZONE_GUSGEN, 0, 0, 0}, -- Gemscope
    {3648, 1, 99, ZONE_GUSGEN, 0, 0, 0}, -- Chocolate Grupkin

    -- Ordelle Caves (20 - 30)
    {348, 1, 99, ZONE_ORDELLE, 0, 0, 0}, -- Marble Plaque
    {3643, 1, 99, ZONE_ORDELLE, 0, 0, 0}, -- Carillon Vermeil
    {3655, 1, 99, ZONE_ORDELLE, 0, 0, 0}, -- Treasury Table
    {3656, 1, 99, ZONE_ORDELLE, 0, 0, 0}, -- Treasury Stand

    -- Beadeaux (25 - 40)
    {150, 1, 99, ZONE_BEADEAUX, 0, 0, 0}, -- Leather Pot
    {3620, 1, 99, ZONE_BEADEAUX, 0, 0, 0}, -- Silberkranz
    {127, 1, 99, ZONE_BEADEAUX, 0, 0, 0}, -- Coffee Table
    {3662, 1, 99, ZONE_BEADEAUX, 0, 0, 0}, -- Case of Display Blades
    {3713, 1, 99, ZONE_BEADEAUX, 0, 0, 0}, -- Pot of Wards

    -- Castle Oztroja (25 - 40)
    {126, 1, 99, ZONE_OZTROJA, 0, 0, 0}, -- Falsiam Vase
    {3642, 1, 99, ZONE_OZTROJA, 0, 0, 0}, -- Katana-kazari
    {147, 1, 99, ZONE_OZTROJA, 0, 0, 0}, -- Imperial Tapestry
    {143, 1, 99, ZONE_OZTROJA, 0, 0, 0}, -- Ngoma
    {145, 1, 99, ZONE_OZTROJA, 0, 0, 0}, -- Thurible

    -- Davoi (25 - 40)
    {146, 1, 99, ZONE_DAVOI, 0, 0, 0}, -- Walahra Burner
    {185, 1, 99, ZONE_DAVOI, 0, 0, 0}, -- Rook Banner
    {186, 1, 99, ZONE_DAVOI, 0, 0, 0}, -- Shield Plaque
    {187, 1, 99, ZONE_DAVOI, 0, 0, 0}, -- Buckler Plaque
    {3625, 1, 99, ZONE_DAVOI, 0, 0, 0}, -- Blacksmith's Stall


    -- Delkfutt Lower Tower (25 - 35)
    {187, 1, 99, ZONE_DELKFUTT_LOW, 0, 0, 0}, -- Buckler Plaque
    {365, 1, 99, ZONE_DELKFUTT_LOW, 0, 0, 0}, -- Pole Classique
    {427, 1, 99, ZONE_DELKFUTT_LOW, 0, 0, 0}, -- Rococo Table
    {3634, 1, 99, ZONE_DELKFUTT_LOW, 0, 0, 0}, -- Starlight Cake
    {11043, 1, 99, ZONE_DELKFUTT_LOW, 0, 0, 0}, -- Giant's Earring
    {13437, 1, 99, ZONE_DELKFUTT_LOW, 0, 0, 0}, -- Healer's Earring (-1 enmity if WHM Sub)
    {13438, 1, 99, ZONE_DELKFUTT_LOW, 0, 0, 0}, -- Wizard's Earring (+5 Ele Skill if BLM sub)

    -- Delkfutt Middle Tower Items (30 - 40)
    {3666, 1, 99, ZONE_DELKFUTT_MID, 0, 0, 0}, -- Set of Fine Raiments
    {357, 1, 99, ZONE_DELKFUTT_MID, 0, 0, 0}, -- Partition
    {366, 1, 99, ZONE_DELKFUTT_MID, 0, 0, 0}, -- Kanonenofen
    {374, 1, 99, ZONE_DELKFUTT_MID, 0, 0, 0}, -- Parclose
    {28, 1, 99, ZONE_DELKFUTT_MID, 0, 0, 0}, -- Drawing Desk

    -- Delkfutt Upper Tower Items (35 - 45) / (65 - 70)
    {352, 1, 99, ZONE_DELKFUTT_HIGH, 0, 0, 0}, -- Half Partition
    {129, 1, 99, ZONE_DELKFUTT_HIGH, 0, 0, 0}, -- Imperial Standard
    {147, 1, 99, ZONE_DELKFUTT_HIGH, 0, 0, 0}, -- Imperial Tapestry
    {434, 1, 99, ZONE_DELKFUTT_HIGH, 0, 0, 0}, -- Isula Sideboard


    -- Sauromugue Champaigne (25 - 35)
    {126, 1, 99, ZONE_SAUROMUGUE, 0, 0, 0}, -- Falsiam Vase
    {424, 1, 99, ZONE_SAUROMUGUE, 0, 0, 0}, -- Feasting Table
    {3705, 1, 99, ZONE_SAUROMUGUE, 0, 0, 0}, -- Far East Hearth
    {326, 1, 99, ZONE_SAUROMUGUE, 0, 0, 0}, -- Yellow Hobby Bo
    {138, 1, 99, ZONE_SAUROMUGUE, 0, 0, 0}, -- Jeunoan Tree
    {16042, 1, 99, ZONE_SAUROMUGUE, 0, 0, 0}, -- Duchy Earring (teleport to Jeuno)

    -- Batallia Downs (25 - 35)
    {138, 1, 99, ZONE_BATALLIA, 0, 0, 0}, -- Jeunoan Tree
    {430, 1, 99, ZONE_BATALLIA, 0, 0, 0}, -- Blue Storm Lantern
    {433, 1, 99, ZONE_BATALLIA, 0, 0, 0}, -- White Storm Lantern
    {329, 1, 99, ZONE_BATALLIA, 0, 0, 0}, -- Blue Hobby Bo
    {328, 1, 99, ZONE_BATALLIA, 0, 0, 0}, -- Black Hobby Bo
    {16042, 1, 99, ZONE_BATALLIA, 0, 0, 0}, -- Duchy Earring (teleport to Jeuno)
    {15786, 1, 99, ZONE_BATALLIA, 0, 0, 0}, -- Divisor Ring

    -- Rolanberry Fields (25 - 35)
    {138, 1, 99, ZONE_ROLANBERRY, 0, 0, 0}, -- Jeunoan Tree
    {3673, 1, 99, ZONE_ROLANBERRY, 0, 0, 0}, -- Chocobo Carvings
    {421, 1, 99, ZONE_ROLANBERRY, 0, 0, 0}, -- Vase of Rulude Orchids
    {330, 1, 99, ZONE_ROLANBERRY, 0, 0, 0}, -- Green Hobby Bo
    {420, 1, 99, ZONE_ROLANBERRY, 0, 0, 0}, -- Pot of Meadsweet
    {16042, 1, 99, ZONE_ROLANBERRY, 0, 0, 0}, -- Duchy Earring (teleport to Jeuno)

    -- Qufim Island (25 - 35)
    {184, 1, 99, ZONE_QUFIM, 0, 0, 0}, -- Jeunoan Flag
    {431, 1, 99, ZONE_QUFIM, 0, 0, 0}, -- Green Storm Lantern
    {429, 1, 99, ZONE_QUFIM, 0, 0, 0}, -- Red Storm Lantern
    {327, 1, 99, ZONE_QUFIM, 0, 0, 0}, -- Red Hobby Bo
    {437, 1, 99, ZONE_QUFIM, 0, 0, 0}, -- Floral Nightstand

    -- Yuhtunga Jungle (30 - 45)
    {323, 1, 99, ZONE_YUHTUNGA, 0, 0, 0}, -- Red Bamboo Grass
    {324, 1, 99, ZONE_YUHTUNGA, 0, 0, 0}, -- Blue Bamboo Grass
    {325, 1, 99, ZONE_YUHTUNGA, 0, 0, 0}, -- Green Bamboo Grass
    {205, 1, 99, ZONE_YUHTUNGA, 0, 0, 0}, -- Mandragora Lantern
    {3646, 1, 99, ZONE_YUHTUNGA, 0, 0, 0}, -- Mandragora Pricket
    {16046, 1, 99, ZONE_YUHTUNGA, 0, 0, 0}, -- Kazham Earring (teleport to Khazam)
    {15786, 1, 99, ZONE_YUHTUNGA, 0, 0, 0}, -- Divisor Ring (+6 ACC, +3 ATK if level divisble by 5)

    -- Sanctuary of Zi'tah (35 - 45)
    {87, 1, 99, ZONE_ZITAH, 0, 0, 0}, -- Kadomatsu
    {362, 1, 99, ZONE_ZITAH, 0, 0, 0}, -- Fluoro Flora
    {363, 1, 99, ZONE_ZITAH, 0, 0, 0}, -- Glowfly Cage

    -- Lufaise Meadows (35 - 45)
    {100, 1, 99, ZONE_LUFAISE, 0, 0, 0}, -- Okadomatsu
    {180, 1, 99, ZONE_LUFAISE, 0, 0, 0}, -- Bonbori
    {363, 1, 99, ZONE_LUFAISE, 0, 0, 0}, -- Glowfly Cage
    {3694, 1, 99, ZONE_LUFAISE, 0, 0, 0}, -- Polished Lamb Carving

    -- Beaucedine Glacier (35 - 45)
    {208, 1, 99, ZONE_BEAUCEDINE, 0, 0, 0}, -- Ice Lamp
    {176, 1, 99, ZONE_BEAUCEDINE, 0, 0, 0}, -- Snowman Knight
    {177, 1, 99, ZONE_BEAUCEDINE, 0, 0, 0}, -- Snowman Miner
    {178, 1, 99, ZONE_BEAUCEDINE, 0, 0, 0}, -- Snowman Mage

    -- Eastern Altepa Items (35 - 50)
    {363, 1, 99, ZONE_ALTEPA_EAST, 0, 0, 0}, -- Amigo Cactus
    {16045, 1, 99, ZONE_ALTEPA_EAST, 0, 0, 0}, -- Rabao Earring (teleport to Rabao)
    {16804, 1, 99, ZONE_ALTEPA_EAST, 0, 0, 0}, -- Flame Blade +1

    -- Bibiki Bay (35 - 75)
    {224, 1, 99, ZONE_BIBIKI, 0, 0, 0}, -- Bay Aquarium
    {319, 1, 99, ZONE_BIBIKI, 0, 0, 0}, -- Shell Lamp
    {222, 1, 99, ZONE_BIBIKI, 0, 0, 0}, -- Fighting Fish Tank
    {3664, 1, 99, ZONE_BIBIKI, 0, 0, 0}, -- Shell Assortment


    -- Misareaux Coast (40 - 50)
    {188, 1, 99, ZONE_MISAREAUX, 0, 0, 0}, -- Acolyte's Grief
    {195, 1, 99, ZONE_MISAREAUX, 0, 0, 0}, -- The Big One
    {225, 1, 99, ZONE_MISAREAUX, 0, 0, 0}, -- Reef Aquarium
    {3619, 1, 99, ZONE_MISAREAUX, 0, 0, 0}, -- Couronne Des Etoiles
    {3631, 1, 99, ZONE_MISAREAUX, 0, 0, 0}, -- Fisherman's Stall

    -- Phomiuna Aqueducts (40 - 50)
    {149, 1, 99, ZONE_PHOMIUNA, 0, 0, 0}, -- Set of Alchemist's Tools
    {353, 1, 99, ZONE_PHOMIUNA, 0, 0, 0}, -- Spence
    {442, 1, 99, ZONE_PHOMIUNA, 0, 0, 0}, -- Gilded Chest
    {416, 1, 99, ZONE_PHOMIUNA, 0, 0, 0}, -- Tomeshelf
    {460, 1, 99, ZONE_PHOMIUNA, 0, 0, 0}, -- Candelabrum

    -- Riverne Site A01 (40 - 50)
    {3596, 1, 99, ZONE_RIVERNE_A1, 0, 0, 0}, -- Ornament Case
    {3707, 1, 99, ZONE_RIVERNE_A1, 0, 0, 0}, -- Murrey Grisaille

    -- Oldton Movapolis (40 - 50)
    {418, 1, 99, ZONE_OLDTON, 0, 0, 0}, -- Tidings Board
    {3596, 1, 99, ZONE_OLDTON, 0, 0, 0}, -- Ornament Case
    {3708, 1, 99, ZONE_OLDTON, 0, 0, 0}, -- Moss-green Grissaile

    -- Garlaige Citadel (40 - 55)
    {358, 1, 99, ZONE_GARLAIGE, 0, 0, 0}, -- Credenza
    {425, 1, 99, ZONE_GARLAIGE, 0, 0, 0}, -- Girandola
    {426, 1, 99, ZONE_GARLAIGE, 0, 0, 0}, -- Orchestrion

    -- Attohwa Chasm (40 - 60)
    {318, 1, 99, ZONE_ATTOHWA, 0, 0, 0}, -- Crystal Rose
    {3594, 1, 99, ZONE_ATTOHWA, 0, 0, 0}, -- Gemstone Case

    -- Yhoator Jungle (40 - 60)
    {422, 1, 99, ZONE_YHOATOR, 0, 0, 0}, -- Elshimo Pachira
    {99, 1, 99, ZONE_YHOATOR, 0, 0, 0}, -- Elshimo Palm
    {200, 1, 99, ZONE_YHOATOR, 0, 0, 0}, -- Tsahyan Mask
    {3624, 1, 99, ZONE_YHOATOR, 0, 0, 0}, -- Korrigan Pricket
    {16046, 1, 99, ZONE_YHOATOR, 0, 0, 0}, -- Kazham Earring (teleport to Khazam)

    -- Seaserpent Grotto (40 - 60)
    {454, 1, 99, ZONE_SEASERPENT, 0, 0, 0}, -- Egg Lantern
    {223, 1, 99, ZONE_SEASERPENT, 0, 0, 0}, -- River Aquarium


    -- Xarcabard (40 - 50)
    {176, 1, 99, ZONE_XARCABARD, 0, 0, 0}, -- Snowman Knight
    {177, 1, 99, ZONE_XARCABARD, 0, 0, 0}, -- Snowman Miner
    {178, 1, 99, ZONE_XARCABARD, 0, 0, 0}, -- Snowman Mage
    {3640, 1, 99, ZONE_XARCABARD, 0, 0, 0}, -- Rolanberry Delightaru

    -- Eldieme Necropolis Items (45 - 55)
    {458, 1, 99, ZONE_ELDIEME, 0, 0, 0}, -- Calabazilla Lantern
    {204, 1, 99, ZONE_ELDIEME, 0, 0, 0}, -- Pumpkin Lantern
    {354, 1, 99, ZONE_ELDIEME, 0, 0, 0}, -- Bookstack

    -- Crawler's Nest (45 - 55)
    {355, 1, 99, ZONE_CRAWLERS, 0, 0, 0}, -- Bread Crock
    {3587, 1, 99, ZONE_CRAWLERS, 0, 0, 0}, -- Blue Viola Pot
    {3586, 1, 99, ZONE_CRAWLERS, 0, 0, 0}, -- Red Viola Pot
    {3593, 1, 99, ZONE_CRAWLERS, 0, 0, 0}, -- Keepsake Case
    {3628, 1, 99, ZONE_CRAWLERS, 0, 0, 0}, -- Weaver's Stall

    -- Behemoth's Dominion (45 - 50)
    {266, 1, 99, ZONE_BEHEMOTHS, 0, 0, 0}, -- Behemoth Statue
    {434, 1, 99, ZONE_BEHEMOTHS, 0, 0, 0}, -- Isula Sideboard
    {438, 1, 99, ZONE_BEHEMOTHS, 0, 0, 0}, -- Orblight

    -- Monastic Cavern Items (45 - 60)
    {456, 1, 99, ZONE_MON_CAVERN, 0, 0, 0}, -- Pepo Lantern
    {3592, 1, 99, ZONE_MON_CAVERN, 0, 0, 0}, -- Jewelry Case
    {3626, 1, 99, ZONE_MON_CAVERN, 0, 0, 0}, -- Goldsmith's Stall
    {16007, 1, 99, ZONE_MON_CAVERN, 0, 0, 0}, -- Physical Earring
    {14695, 1, 99, ZONE_MON_CAVERN, 0, 0, 0}, -- Hope Earring +1
    {13283, 1, 99, ZONE_MON_CAVERN, 0, 0, 0}, -- Saintly Ring +1

    -- Gustav Tunnel (45 - 60)
    {3625, 1, 99, ZONE_GUSTAV, 0, 0, 0}, -- Blacksmith's Stall
    {3669, 1, 99, ZONE_GUSTAV, 0, 0, 0}, -- Set of Courier Bags

    -- Western Altepa Items (45 - 60)
    {364, 1, 99, ZONE_ALTEPA_WEST, 0, 0, 0}, -- Amiga Cactus
    {210, 1, 99, ZONE_ALTEPA_WEST, 0, 0, 0}, -- Earth Lamp
    {98, 1, 99, ZONE_ALTEPA_WEST, 0, 0, 0}, -- Scimitar Cactus
    {16045, 1, 99, ZONE_ALTEPA_WEST, 0, 0, 0}, -- Rabao Earring (teleport to Rabao)
    {16804, 1, 99, ZONE_ALTEPA_WEST, 0, 0, 0}, -- Flame Blade +1

    -- Quicksand Caves (50 - 65)
    {3627, 1, 99, ZONE_QUICKSAND, 0, 0, 0}, -- Boneworker's Stall

    -- Bostaunieux Oubliette (50 - 65)
    {3675, 1, 99, ZONE_BOSTAUNIEUX, 0, 0, 0}, -- Flask Set
    {189, 1, 99, ZONE_BOSTAUNIEUX, 0, 0, 0}, -- Autumn's End
    {3633, 1, 99, ZONE_BOSTAUNIEUX, 0, 0, 0}, -- Alchemist's Stall

    -- Toraimarai Canal Items (50 - 65)
    {3676, 1, 99, ZONE_TORAIMARAI, 0, 0, 0}, -- Celestial Globe
    {333, 1, 99, ZONE_TORAIMARAI, 0, 0, 0}, -- Winged Balance
    {77, 1, 99, ZONE_TORAIMARAI, 0, 0, 0}, -- Bookshelf
    {354, 1, 99, ZONE_TORAIMARAI, 0, 0, 0}, -- Bookstack
    {134, 1, 99, ZONE_TORAIMARAI, 0, 0, 0}, -- Copy of "Emeralda"

    -- Fei'Yin (50 - 65)

    -- Pso'Xja (50 - 75)
    {3677, 1, 99, ZONE_PSOXJA, 0, 0, 0}, -- Spinet

    -- Labyrinth of Onzozo (50 - 70)
    {3630, 1, 99, ZONE_ONZOZO, 0, 0, 0}, -- Tanner's Stall

    -- Riverne Site B01 (50 - 60)

    -- Sacrarium (55 - 60)
    {331, 1, 99, ZONE_SACRARIUM, 0, 0, 0}, -- Winged Altar
    {332, 1, 99, ZONE_SACRARIUM, 0, 0, 0}, -- Winged Plaque
    {428, 1, 99, ZONE_SACRARIUM, 0, 0, 0}, -- Semainier
    {3680, 1, 99, ZONE_SACRARIUM, 0, 0, 0}, -- Copy of Judgment Day




    -- Temple of Uggalepih (50 - 65)
    {3622, 1, 99, ZONE_UGGALEPIH, 0, 0, 0}, -- Jack-oPricket
    {3682, 1, 99, ZONE_UGGALEPIH, 0, 0, 0}, -- Sproutling Board

    -- Zvahls Baileys Items (55 - 65)
    {214, 1, 99, ZONE_ZVAHL_BAILEYS, 0, 0, 0}, -- Dark Lamp
    {425, 1, 99, ZONE_ZVAHL_BAILEYS, 0, 0, 0}, -- Girandola
    {269, 1, 99, ZONE_ZVAHL_BAILEYS, 0, 0, 0}, -- Shadow Lord Statue
    {279, 1, 99, ZONE_ZVAHL_BAILEYS, 0, 0, 0}, -- Shadow Lord Statue II
    {280, 1, 99, ZONE_ZVAHL_BAILEYS, 0, 0, 0}, -- Shadow Lord Statue III

    -- Zvahls Keep Items (50 - 55)
    {442, 1, 99, ZONE_ZVAHL_KEEP, 0, 0, 0}, -- Gilded Chest
    {269, 1, 99, ZONE_ZVAHL_KEEP, 0, 0, 0}, -- Shadow Lord Statue
    {279, 1, 99, ZONE_ZVAHL_KEEP, 0, 0, 0}, -- Shadow Lord Statue II
    {280, 1, 99, ZONE_ZVAHL_KEEP, 0, 0, 0}, -- Shadow Lord Statue III


    -- Kuftal Tunnel (60 - 70)
    {3681, 1, 99, ZONE_KUFTAL, 0, 0, 0}, -- Alzadaal Table

    -- Ifrit's Cauldron (65 - 75)
    {317, 1, 99, ZONE_CAULDRON, 0, 0, 0}, -- Bronze Rose
    {203, 1, 99, ZONE_CAULDRON, 0, 0, 0}, -- Bomb Lantern
    {3623, 1, 99, ZONE_CAULDRON, 0, 0, 0}, -- Djinn Pricket
    {16046, 1, 99, ZONE_CAULDRON, 0, 0, 0}, -- Kazham Earring (teleport to Khazam)
    {17485, 1, 99, ZONE_CAULDRON, 0, 0, 0}, -- Dragon's Claws +1

    -- Cape Terrigan (65 - 75)

    -- Boyahda Tree (65 - 75)

    -- Newton Movapolis (65 - 75)
    {436, 1, 99, ZONE_NEWTON, 0, 0, 0}, -- Jeunoan Armoire

    -- Den of Rancor (65 - 75)


    -- Uleguerand Range (65 - 75)
    {415, 1, 99, ZONE_ULEGURAND, 0, 0, 0}, -- Aldebaran Horn
    {461, 1, 99, ZONE_ULEGURAND, 0, 0, 0}, -- Buffalo Milk Case
    {322, 1, 99, ZONE_ULEGURAND, 0, 0, 0}, -- Horn Trophy

    -- Valley of Sorrows (70 - 75)

    -- Al'Taieu (70 - 80)
    {282, 1, 99, ZONE_ALTAIEU, 0, 0, 0}, -- Yovra Replica

    -- Hu'Xzoi (70 - 80)
    {446, 1, 99, ZONE_HUXZOI, 0, 0, 0}, -- Gilded Shelf
    {282, 1, 99, ZONE_HUXZOI, 0, 0, 0}, -- Yovra Replica

    -- Shrine of Ru'Avitau (70 - 80)

    -- Velugannon Palace (70 - 80)

    -- Ro'Maeve (70 - 80)
    {33, 1, 99, ZONE_ROMAEVE, 0, 0, 0}, -- Millionare Desk
    {435, 1, 99, ZONE_ROMAEVE, 0, 0, 0}, -- Jeunoan Dresser

    -- Ru'Aun Gardens (75 - 85)
    {272, 1, 99, ZONE_RUAUN, 0, 0, 0}, -- Ark Angel Statue
    {273, 1, 99, ZONE_RUAUN, 0, 0, 0}, -- Ark Angel Statue
    {274, 1, 99, ZONE_RUAUN, 0, 0, 0}, -- Ark Angel Statue
    {275, 1, 99, ZONE_RUAUN, 0, 0, 0}, -- Ark Angel Statue
    {276, 1, 99, ZONE_RUAUN, 0, 0, 0}, -- Ark Angel Statue

    -- Dragon's Aery (75 - 80)

    -- Ru'Hmet (80-85)

    -- Bees
    {4156, 1, 20, 0, 0, 0, 48}, -- Bottle of Mulsum
    {16610, 1, 20, 0, 0, 0, 48}, -- Wax Sword +1
    {17138, 5, 20, 0, 0, 0, 48}, -- Willow Wand +1
    {16611, 10, 25, 0, 0, 0, 48}, -- Bee Spatha +1
    {16742, 20, 35, 0, 0, 0, 48}, -- Poison Knife +1
    {16489, 20, 35, 0, 0, 0, 48}, -- Poison Kukri +1
    {16927, 20, 40, 0, 0, 0, 48}, -- Busuto +1
    {16700, 25, 40, 0, 0, 0, 48}, -- Poison Cesti +1
    {13322, 25, 35, 0, 0, 0, 48}, -- Wing Earring
    {16439, 30, 45, 0, 0, 0, 48}, -- Poison Claws +1
    {16693, 35, 50, 0, 0, 0, 48}, -- Poison Katars +1
    {13361, 36, 50, 0, 0, 0, 48}, -- Drone Earring
    {17634, 55, 99, 0, 0, 0, 48}, -- Wasp Fleuret
    {4213, 30, 99, 0, 0, 1, 48}, -- Icarus Wing (x2)

    -- Beetles
    {13501, 15, 35, 0, 0, 0, 49}, -- Beetle Ring +1
    {13326, 15, 35, 0, 0, 0, 49}, -- Beetle Earring +1
    {13827, 15, 35, 0, 0, 0, 49}, -- Beetle Mask +1
    {13043, 15, 35, 0, 0, 0, 49}, -- Beetle Leggings +1
    {12913, 15, 35, 0, 0, 0, 49}, -- Beetle Subligar +1
    {13717, 15, 35, 0, 0, 0, 49}, -- Beetle Harness +1
    {12789, 15, 35, 0, 0, 0, 49}, -- Beetle Mittens +1
    {4221, 15, 35, 0, 0, 2, 49}, -- Beetle Quiver (x3)
    {13062, 15, 35, 0, 0, 0, 49}, -- Green Gorget
    {16445, 25, 40, 0, 0, 0, 49}, -- Claws +1
    {17370, 30, 99, 0, 0, 0, 49}, -- Gemshorn +1
    {4213, 30, 99, 0, 0, 0, 49}, -- Icarus Wing
    {16688, 35, 50, 0, 0, 0, 49}, -- Mythril Claws +1
    {17371, 35, 50, 0, 0, 0, 49}, -- Horn +1
    {16697, 45, 60, 0, 0, 0, 49}, -- Darksteel Claws +1
    {17847, 50, 99, 0, 0, 0, 49}, -- Crumhorn +2
    {17613, 50, 99, 0, 0, 0, 49}, -- Beetle Knife +1
    {14496, 50, 99, 0, 0, 0, 49}, -- Healing Justaucorps
    {17488, 50, 99, 0, 0, 0, 49}, -- Cermet Claws +1
    {11352, 50, 99, 0, 0, 0, 49}, -- Vela Justaucorps +1
    {17832, 60, 99, 0, 0, 0, 49}, -- Shofar +1

    -- Buffalo
    {11351, 55, 70, 0, 0, 0, 57}, -- Alacer Aketon +1
    {11350, 55, 70, 0, 0, 0, 57}, -- Styrne Byrnie +1
    {11353, 55, 70, 0, 0, 0, 57}, -- Menetrier's Alb +1
    {14554, 70, 99, 0, 0, 0, 57}, -- Corselet
    {14418, 70, 99, 0, 0, 0, 57}, -- Bison Jacket
    {14850, 70, 99, 0, 0, 0, 57}, -- Bison Wristbands
    {15157, 70, 99, 0, 0, 0, 57}, -- Bison Warbonnet
    {15307, 70, 99, 0, 0, 0, 57}, -- Bison Gamashes
    {14319, 70, 99, 0, 0, 0, 57}, -- Bison Kecks

    -- Coeurls
    {17374, 20, 30, 0, 0, 0, 71}, -- Harp +1
    {17229, 22, 35, 0, 0, 0, 71}, -- Zamburak +1
    {17180, 22, 35, 0, 0, 0, 71}, -- Great Bow +1
    {17181, 36, 50, 0, 0, 0, 71}, -- Battle Bow +1
    {17473, 45, 60, 0, 0, 0, 71}, -- Torama Cesti
    {13132, 45, 60, 0, 0, 0, 71}, -- Torama Gorget
    {17173, 45, 60, 0, 0, 0, 71}, -- War Bow +1
    {17226, 45, 60, 0, 0, 0, 71}, -- Arbalest +1
    {17848, 55, 70, 0, 0, 0, 71}, -- Ebony Harp +2
    {17482, 55, 65, 0, 0, 0, 71}, -- Jamadhars +1
    {17645, 55, 70, 0, 0, 0, 71}, -- Espadon +1
    {13764, 65, 99, 0, 0, 0, 71}, -- Torama Jerkin
    {13862, 65, 99, 0, 0, 0, 71}, -- Torama Mask
    {13993, 65, 99, 0, 0, 0, 71}, -- Torama Gloves
    {14109, 65, 99, 0, 0, 0, 71}, -- Torama Ledelsens
    {14233, 65, 99, 0, 0, 0, 71}, -- Torama Trousers
    {17473, 65, 99, 0, 0, 0, 71}, -- Torama Cesti
    {13603, 65, 99, 0, 0, 0, 71}, -- Torama Mantle
    {14113, 65, 99, 0, 0, 0, 71}, -- War Boots +1
    {17834, 65, 99, 0, 0, 0, 71}, -- Mythic Harp +1

    -- Crabs
    {15838, 15, 30, 0, 0, 0, {75, 76, 77, 372}}, -- Protect Ring
    {13554, 32, 55, 0, 0, 0, {75, 76, 77, 372}}, -- Aegis Ring

    -- Dhalmels
    {12334, 1, 25, 0, 0, 0, 49}, -- Strong Shield
    {13811, 1, 25, 0, 0, 0, 49}, -- Rider's Jack Coat
    {14073, 1, 25, 0, 0, 0, 49}, -- Rider's Gloves
    {14174, 1, 25, 0, 0, 0, 49}, -- Rider's Boots
    {14295, 1, 25, 0, 0, 0, 49}, -- Rider's Hose
    {14497, 1, 25, 0, 0, 0, 49}, -- Healing Harness
    {13240, 1, 25, 0, 0, 0, 49}, -- Warrior's Belt +1
    {12525, 25, 40, 0, 0, 0, 49}, -- Strong Cap
    {12663, 25, 50, 0, 0, 0, 49}, -- Strong Harness
    {12786, 15, 35, 0, 0, 0, 49}, -- Strong Gloves
    {12910, 15, 35, 0, 0, 0, 49}, -- Strong Trousers
    {13039, 15, 35, 0, 0, 0, 49}, -- Strong Boots
    {13707, 15, 35, 0, 0, 0, 49}, -- Strong Vest
    {13824, 15, 35, 0, 0, 0, 49}, -- Strong Bandana
    {14332, 25, 45, 0, 0, 0, 49}, -- Kampfdiechlings
    {13272, 35, 50, 0, 0, 0, 49}, -- Corsette +1
    {13982, 40, 60, 0, 0, 0, 49}, -- Turtle Bangles +1
    {13050, 45, 65, 0, 0, 0, 49}, -- Moccasins +1
    {13741, 55, 99, 0, 0, 0, 49}, -- Byrnie +1
    {11350, 55, 99, 0, 0, 0, 49}, -- Styrne Byrnie +1

    -- Funguar
    {16490, 1, 20, 0, 0, 0, 116}, -- Blind Knife +1
    {16493, 1, 20, 0, 0, 0, 116}, -- Blind Dagger +1
    {16438, 15, 30, 0, 0, 0, 116}, -- Silence Bagnakhs +1
    {16508, 15, 30, 0, 0, 0, 116}, -- Silence Dagger +1
    {16926, 35, 55, 0, 0, 0, 116}, -- Bokuto +1
    {5334, 1, 29, 0, 0, 2, 116}, -- Blind Bolt Quiver (x3)
    {5337, 30, 99, 0, 0, 2, 116}, -- Sleep Bolt Quiver (x3)
    {5333, 30, 99, 0, 0, 2, 116}, -- Sleep Arrow Quiver (x3)
    {17484, 55, 99, 0, 0, 0, 116}, -- Stun Jamadhars +1
    {16503, 55, 99, 0, 0, 0, 116}, -- Stun Knife +1
    {17614, 55, 99, 0, 0, 0, 116}, -- Stun Kukri +1
    {17486, 55, 99, 0, 0, 0, 116}, -- Stun Claws +1
    {17770, 60, 99, 0, 0, 0, 116}, -- Mamushito +1


    -- Lizards
    {16386, 1, 15, 0, 0, 0, {174, 438, 97}}, -- Lizard Cesti
    {13191, 15, 35, 0, 0, 0, {174, 438, 97}}, -- Lizard Belt +1
    {13608, 15, 35, 0, 0, 0, {174, 438, 97}}, -- Lizard Mantle +1
    {12480, 15, 35, 0, 0, 0, {174, 438, 97}}, -- Lizard Helm +1
    {12785, 15, 35, 0, 0, 0, {174, 438, 97}}, -- Fine Gloves
    {13038, 15, 35, 0, 0, 0, {174, 438, 97}}, -- Fine Ledelsens
    {12909, 15, 35, 0, 0, 0, {174, 438, 97}}, -- Fine Trousers
    {13697, 15, 35, 0, 0, 0, {174, 438, 97}}, -- Fine Jerkin
    {19012, 20, 45, 0, 0, 0, {174, 438, 97}}, -- Lizard Strap +1
    {14133, 30, 45, 0, 0, 0, {174, 438, 97}}, -- Winged Boots +1
    {11539, 30, 50, 0, 0, 0, {174, 438, 97}}, -- Exactitude Mantle +1
    {13634, 55, 99, 0, 0, 0, {174, 438, 97}}, -- Empowering Mantle +1

    -- Opo-Opo
    {14600, 32, 55, 0, 0, 0, 188}, -- Alacrity Ring +1
    {14606, 32, 55, 0, 0, 0, 188}, -- Aura Ring +1
    {14603, 32, 55, 0, 0, 0, 188}, -- Deft Ring +1
    {14607, 32, 55, 0, 0, 0, 188}, -- Loyalty Ring +1
    {14601, 32, 55, 0, 0, 0, 188}, -- Puissance Ring +1
    {14604, 32, 55, 0, 0, 0, 188}, -- Solace Ring +1
    {14605, 32, 55, 0, 0, 0, 188}, -- Verve Ring +1
    {14602, 32, 55, 0, 0, 0, 188}, -- Wisdom Ring +1
    {14608, 50, 69, 0, 0, 0, 188}, -- Celerity Ring +1
    {14609, 50, 69, 0, 0, 0, 188}, -- Victory Ring +1
    {14610, 50, 69, 0, 0, 0, 188}, -- Genius Ring +1
    {14611, 50, 69, 0, 0, 0, 188}, -- Grace Ring +1
    {14612, 50, 69, 0, 0, 0, 188}, -- Serenity Ring +1
    {14613, 50, 69, 0, 0, 0, 188}, -- Vigor Ring +1
    {14614, 50, 69, 0, 0, 0, 188}, -- Mystic Ring +1
    {14615, 50, 69, 0, 0, 0, 188}, -- Allure Ring +1
    {14617, 50, 69, 0, 0, 0, 188}, -- Nimble Ring +1
    {14618, 50, 69, 0, 0, 0, 188}, -- Triumph Ring +1
    {14619, 50, 69, 0, 0, 0, 188}, -- Omniscient Ring +1
    {14620, 50, 69, 0, 0, 0, 188}, -- Adroit Ring +1
    {14621, 50, 69, 0, 0, 0, 188}, -- Comunion Ring +1
    {14622, 50, 69, 0, 0, 0, 188}, -- Robust Ring +1
    {14623, 50, 69, 0, 0, 0, 188}, -- Hades Ring +1
    {14624, 50, 69, 0, 0, 0, 188}, -- Heaven's Ring +1

    -- Saplings
    {17138, 1, 18, 0, 0, 0, 216}, -- Willow Wand +1
    {17051, 10, 18, 0, 0, 0, 216}, -- Yew Wand +1
    {16494, 10, 25, 0, 0, 0, 216}, -- Corrosive Kukri
    {17487, 10, 25, 0, 0, 0, 216}, -- Corrosive Claws
    {17606, 10, 25, 0, 0, 0, 216}, -- Corrosive Dagger
    {17607, 10, 25, 0, 0, 0, 216}, -- Corrosive Baselard
    {17608, 10, 25, 0, 0, 0, 216}, -- Corrosive Knife
    {17076, 15, 30, 0, 0, 0, 216}, -- Earth Wand
    {17442, 15, 30, 0, 0, 0, 216}, -- Eremite's Wand +1
    {18010, 26, 45, 0, 0, 0, 216}, -- Melt Dagger
    {18011, 26, 45, 0, 0, 0, 216}, -- Melt Knife
    {18012, 26, 45, 0, 0, 0, 216}, -- Melt Baselard
    {18013, 26, 45, 0, 0, 0, 216}, -- Melt Kukri
    {18357, 26, 45, 0, 0, 0, 216}, -- Melt Claws
    {18410, 26, 45, 0, 0, 0, 216}, -- Melt Katana
    {17143, 40, 55, 0, 0, 0, 216}, -- Rose Wand +1
    {17427, 50, 61, 0, 0, 0, 216}, -- Ebony Wand +1
    {17085, 62, 99, 0, 0, 0, 216}, -- Holy Wand
    {4140, 46, 99, 0, 0, 1, 216}, -- Pro Ether

    -- Scorpions
    {17178, 1, 30, 0, 0, 0, 217}, -- Power Bow +1
    {4223, 1, 50, 0, 0, 2, 217}, -- Scorpion Quiver (x3)
    {18152, 1, 50, 0, 0, 2, 217}, -- Venom Bolt Quiver (x3)
    {17180, 30, 40, 0, 0, 0, 217}, -- Great Bow +1
    {13513, 40, 60, 0, 0, 0, 217}, -- Scorpion Mask +1
    {14083, 40, 60, 0, 0, 0, 217}, -- Scorpion Leggings +1
    {13956, 40, 60, 0, 0, 0, 217}, -- Scorpion Mittens +1
    {14208, 40, 60, 0, 0, 0, 217}, -- Scorpion Subligar +1
    {12461, 40, 60, 0, 0, 0, 217}, -- Scorpion Helm +1
    {14496, 50, 99, 0, 0, 0, 217}, -- Healing Justaucorps
    {13513, 50, 99, 0, 0, 0, 217}, -- Scorpion Ring +1
    {17483, 55, 70, 0, 0, 0, 217}, -- Venom Katars +1
    {16762, 55, 70, 0, 0, 0, 217}, -- Venom Knife +1
    {16504, 55, 70, 0, 0, 0, 217}, -- Venom Kukri +1
    {16425, 55, 70, 0, 0, 0, 217}, -- Venom Claws +1
    {12579, 55, 70, 0, 0, 0, 217}, -- Scorpion Harness
    {17769, 60, 99, 0, 0, 0, 217}, -- Kororito +1
    {17221, 65, 99, 0, 0, 0, 217}, -- Repeating Crossbow

    -- Sheep
    {13037, 1, 14, 0, 0, 0, 226}, -- Solea +1
    {12616, 1, 14, 0, 0, 0, 226}, -- Tunic +1
    {12775, 1, 14, 0, 0, 0, 226}, -- Mitts +1
    {12898, 1, 14, 0, 0, 0, 226}, -- Slacks +1
    {12896, 1, 14, 0, 0, 0, 226}, -- Brais +1
    {12591, 1, 14, 0, 0, 0, 226}, -- Doublet +1
    {12471, 1, 14, 0, 0, 0, 226}, -- Headgear +1
    {12773, 1, 14, 0, 0, 0, 226}, -- Gloves +1
    {13030, 1, 14, 0, 0, 0, 226}, -- Gaiters +1
    {14069, 15, 25, 0, 0, 0, 226}, -- Nomad's Gloves
    {14170, 15, 25, 0, 0, 0, 226}, -- Nomad's Boots
    {14291, 15, 25, 0, 0, 0, 226}, -- Nomad's Hose
    {16119, 15, 25, 0, 0, 0, 226}, -- Nomad's Cap
    {13807, 15, 25, 0, 0, 0, 226}, -- Nomad's Tunica
    {14054, 15, 25, 0, 0, 0, 226}, -- Baron's Cuffs
    {14447, 15, 25, 0, 0, 0, 226}, -- Baron's Saio
    {15208, 15, 25, 0, 0, 0, 226}, -- Baron's Chapeau
    {15344, 15, 25, 0, 0, 0, 226}, -- Baron's Pigaches
    {15405, 15, 25, 0, 0, 0, 226}, -- Baron's Slops
    {14328, 25, 50, 0, 0, 0, 226}, -- Seer's Slacks +1
    {14427, 25, 50, 0, 0, 0, 226}, -- Seer's Tunic +1
    {14859, 25, 50, 0, 0, 0, 226}, -- Seer's Mitts +1
    {15166, 25, 50, 0, 0, 0, 226}, -- Seer's Crown +1
    {15316, 25, 50, 0, 0, 0, 226}, -- Seer's Pumps +1

    -- Birds
    {13060, 1, 24, 0, 0, 0, 55}, -- Feather Collar +1
    {15526, 1, 24, 0, 0, 0, 55}, -- Regen Collar
    {4595, 1, 24, 0, 0, 1, 55}, -- Party Egg (x2)
    {14865, 25, 50, 0, 0, 0, 55}, -- Noct Gloves +1
    {14207, 25, 50, 0, 0, 0, 55}, -- Noct Gaiters +1
    {14333, 25, 50, 0, 0, 0, 55}, -- Noct Brais +1
    {14434, 25, 50, 0, 0, 0, 55}, -- Noct Doublet +1
    {15172, 25, 50, 0, 0, 0, 55}, -- Noct Beret +1
    {14499, 45, 60, 0, 0, 0, 55}, -- Raven Jupon
    {14908, 45, 60, 0, 0, 0, 55}, -- Raven Bracers
    {15243, 45, 60, 0, 0, 0, 55}, -- Raven Beret
    {15579, 45, 60, 0, 0, 0, 55}, -- Raven Hose
    {15664, 45, 60, 0, 0, 0, 55}, -- Raven Gaiters
    {13866, 61, 99, 0, 0, 0, 55}, -- Green Beret +1
    {4564, 61, 99, 0, 0, 1, 55}, -- Royal Omelette (x2)
    {18169, 70, 99, 0, 0, 0, 55}, -- Tsar's Egg

    -- Tigers
    {15836, 1, 30, 0, 0, 0, 242}, -- Smilodon Ring (+1 AGI)
    {15838, 1, 30, 0, 0, 0, 242}, -- Potect Ring
    {13076, 1, 30, 0, 0, 0, 242}, -- Fang Necklace
    {15837, 31, 99, 0, 0, 0, 242}, -- Smilodon Ring +1 (+2 AGI, +1 ACC)
    {13061, 31, 49, 0, 0, 0, 242}, -- Spike Necklace
    {18615, 31, 49, 0, 0, 0, 242}, -- Passaddhi Staff +1 (+4 MACC, +2 MND)
    {15802, 31, 49, 0, 0, 0, 242}, -- Feral Ring
    {13369, 50, 99, 0, 0, 0, 242}, -- Spike Earring
    {17490, 50, 99, 0, 0, 0, 242}, -- Feral Fangs
    {13602, 50, 99, 0, 0, 0, 242}, -- Feral Mantle
    {13919, 50, 99, 0, 0, 0, 242}, -- Feral Mask
    {13861, 50, 99, 0, 0, 0, 242}, -- Feral Helm
    {13992, 50, 99, 0, 0, 0, 242}, -- Feral Gloves
    {14232, 50, 99, 0, 0, 0, 242}, -- Feral Trousers
    {13763, 50, 99, 0, 0, 0, 242}, -- Feral Jerkin

    -- Rabbits
    {17467, 1, 20, 0, 0, 0, 206}, -- Cat Baghnakhs +1
    {13599, 1, 20, 0, 0, 0, 206}, -- Rabbit Mantle +1
    {13631, 20, 32, 0, 0, 0, 206}, -- Nomad's Mantle
    {13632, 33, 50, 0, 0, 0, {206, 404, 405}}, -- Nomad's Mantle +1
    {11542, 65, 99, 0, 0, 0, {206, 404, 405}}, -- Kinesis Mantle +1

    -- Rams
    {13502, 1, 99, 0, 0, 0, 208}, -- Horn Ring +1
    {16666, 1, 99, 0, 0, 0, 208}, -- Bone Axe +1
    {17410, 1, 99, 0, 0, 0, 208}, -- Bone Rod +1
    {13828, 1, 99, 0, 0, 0, 208}, -- Horn Hairpin +1

    -- Kindred
    {18376, 25, 99, 0, 0, 0, 169}, -- Falx +1

};


local nmRewards = {
    {748, 1, 99, 0, 0, 0, 0}, -- Gold Beastcoin
    {749, 1, 99, 0, 0, 0, 0}, -- Mythril Beastcoin
    {760, 1, 99, 0, 0, 0, 0}, -- Silver Beastcoin
    {1875, 1, 99, 0, 0, 0, 0}, -- Ancient Beastcoin
    {4104, 1, 99, 0, 0, 0, 0}, -- Fire Cluster
    {4105, 1, 99, 0, 0, 0, 0}, -- Ice Cluster
    {4106, 1, 99, 0, 0, 0, 0}, -- Wind Cluster
    {4107, 1, 99, 0, 0, 0, 0}, -- Earth Cluster
    {4108, 1, 99, 0, 0, 0, 0}, -- Lightning Cluster
    {4109, 1, 99, 0, 0, 0, 0}, -- Water Cluster
    {4110, 1, 99, 0, 0, 0, 0}, -- Light Cluster
    {4111, 1, 99, 0, 0, 0, 0}, -- Dark Cluster
    {4145, 1, 99, 0, 0, 0, 0}, -- Elixir
    {4144, 25, 99, 0, 0, 0, 0}, -- Hi-Elixir
    {4254, 50, 99, 0, 0, 0, 0}, -- Megalixer
    {4123, 25, 99, 0, 0, 0, 0}, -- Icarus Wing
    {4155, 1, 99, 0, 0, 0, 0}, -- Remedy
    {4149, 25, 99, 0, 0, 0, 0}, -- Panacea

    {4751, 20, 65, 0, JOBS.WHM, 0, 0}, -- Scroll of Erase
    {4720, 25, 65, 0, JOBS.WHM, 0, 0}, -- Scroll of Flash
    {4704, 30, 65, 0, JOBS.WHM, 0, 0}, -- Scroll of Auspice
    {4629, 30, 65, 0, JOBS.WHM, 0, 0}, -- Scroll of Holy
    {4702, 35, 70, 0, JOBS.WHM, 0, 0}, -- Scroll of Sacrifice
    {4750, 45, 99, 0, JOBS.WHM, 0, 0}, -- Scroll of Reraise III
    {4613, 45, 99, 0, JOBS.WHM, 0, 0}, -- Scroll of Cure V
    {4748, 45, 99, 0, JOBS.WHM, 0, 0}, -- Scroll of Raise III
};

local function getDropList(mob, player)
    local zoneid = player:getZoneID();
    local family = mob:getFamily();
    local level = mob:getMainLvl();
    local job = mob:getMainJob();

    local dropList = {}

    for i,v in pairs(commonRewards) do
        if (level >= v[2] and level <= v[3]) then
            local sameJob = job == v[5];
            local sameZone = zoneid == v[4];
            local sameFamily = false;
            local noRequirements = v[4] == 0 and v[7] == 0 and v[5] == 0;
            if (type(v[7]) == "table") then
                for ifamindex, ifamtype in pairs(v[7]) do
                    if (family == ifamtype) then sameFamily = true; break; end
                end
            else
                sameFamily = family == v[7];
            end

            -- Add to drop list if family, zoneid, or job matches requirements (or if there are no requirements at all)
            if (sameJob or sameZone or sameFamily or noRequirements) then
                table.insert(dropList, {v[1], v[6]});
            end
        end
    end

    return dropList
end

local function dropReward(mob, player)
    local chance = 1000;
    local roll = math.random(1, 1000);
    if (chance >= roll) then
        local dropList = getDropList(mob, player);
        local size = 0;
        for i,v in pairs(dropList) do size = size + 1; end;
        if (size == 0) then return; end;

        -- pick a random item and add it to treasure pool
        local choice = dropList[math.random(1, size)];
        local rewardNumber = 1 + choice[2];
        while (rewardNumber > 0) do
            player:addTreasure(choice[1], mob);
            rewardNumber = rewardNumber - 1;
        end

    end


end

function onMobDeathEx(mob, player, isKiller, isWeaponSkillKill)

    if (not player:isPC()) then return; end;

    local diff = mob:getMainLvl() - player:getMainLvl();
    local tempChance = 10 + diff * 3.5;
    if (tempChance < 0) then tempChance = 1 end;
--    diff = (diff * diff) / 2.5;
    if (diff <= 0) then diff = 1; end
    if (math.random(0, 100) <= tempChance) then
        rewardTemporaryItem(player);
    end

    if (mob:getMobMod(MOBMOD_HARD_MODE) > 0) then
        diff = diff * 2;
        if (math.random(0, 100) < diff) then
            rewardTemporaryItem(player);
        end

        if (math.random(0, 100) < diff) then
            rewardTemporaryItem(player);
        end

        if (math.random(0, 100) < diff) then
            rewardTemporaryItem(player);
        end
    end

--    dropReward(mob, player);

    local zid = player:getZoneID()
    local fid = mob:getFamily()
    local sid = mob:getSystem()
    local fname = "achv_f" .. fid .. "_kill"
    local zname = "achv_z" .. zid .. "_kill"
    local sname = "achv_s" .. sid .. "_kill"
    player:setVar(zname, player:getVar(zname) + 1)
    player:setVar(fname, player:getVar(fname) + 1)
    player:setVar(sname, player:getVar(sname) + 1)
    if (mob:isNM()) then
        local NMname = "achv_NM" .. zid .. "_kill"
        player:setVar(NMname, player:getVar(NMname) + 1)

        -- special rewards for fighting NM
        if (not mob:isMobType(0x20) and not mob:isMobType(0x10)) then
        end

    end









    -- Things that happen only to the person who landed killing blow
    if (isKiller == true) then
        -- DRK quest - Blade Of Darkness
        local BladeofDarkness = player:getQuestStatus(BASTOK, BLADE_OF_DARKNESS);
        local BladeofDeath = player:getQuestStatus(BASTOK, BLADE_OF_DEATH);
        local ChaosbringerKills = player:getVar("ChaosbringerKills");
        if (BladeofDarkness == QUEST_ACCEPTED or BladeofDeath == QUEST_ACCEPTED) then
            if (player:getEquipID(SLOT_MAIN) == 16607 and isWeaponSkillKill == false) then
                if (ChaosbringerKills < 200) then
                    player:setVar("ChaosbringerKills", ChaosbringerKills + 1);
                end
            end
        end
    end

    -- Things that happen to any player in the party/alliance
    if (player:getCurrentMission(WINDURST) == A_TESTING_TIME) then
        if (player:hasCompletedMission(WINDURST,A_TESTING_TIME) and player:getZoneID() == 118) then
            player:setVar("testingTime_crea_count",player:getVar("testingTime_crea_count") + 1);
        elseif (player:hasCompletedMission(WINDURST,A_TESTING_TIME) == false and player:getZoneID() == 117) then
            player:setVar("testingTime_crea_count",player:getVar("testingTime_crea_count") + 1);
        end
    end
end;
