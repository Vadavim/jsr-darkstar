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
require("scripts/globals/jsr_hotspots");

-----------------------------------
-- onMobDeathEx
-----------------------------------



-- item, min, max, zone, job, bonusamount, family
local commonRewards = {
    {3974, 1, 39, 0, 0, 0, 0}, -- Airlixir
    {3974, 1, 39, 0, 0, 0, 0}, -- Airlixir
    {3975, 40, 65, 0, 0, 0, 0}, -- Airlixir +1
    {3975, 40, 65, 0, 0, 0, 0}, -- Airlixir +1
    {3976, 366, 75, 0, 0, 0, 0}, -- Airlixir +2
    {3976, 366, 75, 0, 0, 0, 0}, -- Airlixir +2
    {656, 1, 15, 0, 0, 0, 0}, -- Beastcoin
    {750, 16, 30, 0, 0, 0, 0}, -- Silver Beastcoin
    {749, 31, 45, 0, 0, 0, 0}, -- Mythril Beastcoin
    {748, 46, 60, 0, 0, 0, 0}, -- Gold Beastcoin
    {751, 61, 99, 0, 0, 0, 0}, -- Platinum Beastcoin
    {4123, 50, 99, 0, 0, 0, 0}, -- Icarus Wing
    {4198, 1, 99, 0, 0, 0, 0}, -- Dragon's Chronicles
    {4247, 1, 99, 0, 0, 0, 0}, -- Miratete's Memoirs
    {4248, 1, 99, 0, 0, 0, 0}, -- Ginuva's Battle Theory
    {4249, 1, 99, 0, 0, 0, 0}, -- Schultz's Stratagems
};

local zoneRewards = {
    -- East Sarutabaruta Items (1 - 10)
    {371, 1, 99, ZONE_SARUTA_EAST, 0, 0, 0}, -- Butterfly Cage
    {198, 1, 99, ZONE_SARUTA_EAST, 0, 0, 0}, -- Gilt Tapestry
    {340, 1, 99, ZONE_SARUTA_EAST, 0, 0, 0}, -- Fisherman's Signboard
    {336, 1, 99, ZONE_SARUTA_EAST, 0, 0, 0}, -- Boneworker's Signboard
    {18864, 1, 99, ZONE_SARUTA_EAST, 0, 0, 0}, -- Club Hammer

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
    {18866, 1, 99, ZONE_SARUTA_WEST, 0, 0, 0}, -- Club Thingy

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
    {18864, 1, 99, ZONE_GUSTABERG_NORTH, 0, 0, 0}, -- Dream Bell

    {16040, 1, 99, ZONE_GUSTABERG_NORTH, 0, 0, 0}, -- Republic Earring (teleport to Basty)
    {14731, 1, 99, ZONE_GUSTABERG_NORTH, 0, 0, 0}, -- Killer Earring (+5 ATK if DRK is subjob)
    {14735, 1, 99, ZONE_GUSTABERG_NORTH, 0, 0, 0}, -- Ashigaru Earring (+5 Parry if SAM is subjob)
    {13435, 1, 99, ZONE_GUSTABERG_NORTH, 0, 0, 0}, -- Mercenary's Earring (+2 Vit when WAR is subjob)
    {11312, 1, 99, ZONE_GUSTABERG_NORTH, 0, 0, 0}, -- Rambler's Cloak (+5 STR when TP >= 1000)

    -- South Gustaburg (1 - 10)
    {115, 1, 99, ZONE_GUSTABERG_SOUTH, 0, 0, 0}, -- Bastokan Tree
    {335, 1, 99, ZONE_GUSTABERG_SOUTH, 0, 0, 0}, -- Goldsmith's Signboard
    {194, 1, 99, ZONE_GUSTABERG_SOUTH, 0, 0, 0}, -- Blacksmith's Plaque
    {334, 1, 99, ZONE_GUSTABERG_SOUTH, 0, 0, 0}, -- Blacksmith's Signboard
    {18864, 1, 99, ZONE_GUSTABERG_SOUTH, 0, 0, 0}, -- Dream Bell

    {16040, 1, 99, ZONE_GUSTABERG_SOUTH, 0, 0, 0}, -- Republic Earring (teleport to Basty)
    {14731, 1, 99, ZONE_GUSTABERG_SOUTH, 0, 0, 0}, -- Killer Earring (+5 ATK if DRK is subjob)
    {14736, 1, 99, ZONE_GUSTABERG_SOUTH, 0, 0, 0}, -- Genin Earring (+4 AGI if NIN is subjob)
    {13436, 1, 99, ZONE_GUSTABERG_SOUTH, 0, 0, 0}, -- Wrestler's Earring (+30 HP if MNK is subjob)
    {11312, 1, 99, ZONE_GUSTABERG_SOUTH, 0, 0, 0}, -- Rambler's Cloak (+5 STR when TP >= 1000)


    -- East Ronfaure (1 - 10)
    {86, 1, 99, ZONE_RONFAURE_EAST, 0, 0, 0}, -- Sandorian Tree
    {140, 1, 99, ZONE_RONFAURE_EAST, 0, 0, 0}, -- Dream Platter
    {113, 1, 99, ZONE_RONFAURE_EAST, 0, 0, 0}, -- Cleaning Tool Set
    {343, 1, 99, ZONE_RONFAURE_EAST, 0, 0, 0}, -- Harp Stool
    {18846, 1, 99, ZONE_RONFAURE_EAST, 0, 0, 0}, -- Battledore

    {19157, 1, 99, ZONE_RONFAURE_EAST, 0, 0, 0}, -- Survivor
    {16184, 1, 99, ZONE_RONFAURE_EAST, 0, 0, 0}, -- Flat Shield
    {14670, 1, 99, ZONE_RONFAURE_EAST, 0, 0, 0}, -- Safeguard Ring (+2 DEF)
    {16039, 1, 99, ZONE_RONFAURE_EAST, 0, 0, 0}, -- Kingdom Earring (teleport to Sandy)

    -- West Ronfaure (1 - 10)
    {3643, 1, 99, ZONE_RONFAURE_WEST, 0, 0, 0}, -- Carillon Vermeil
    {202, 1, 99, ZONE_RONFAURE_WEST, 0, 0, 0}, -- Golden Fleece
    {339, 1, 99, ZONE_RONFAURE_WEST, 0, 0, 0}, -- Tanner's Signboard
    {341, 1, 99, ZONE_RONFAURE_WEST, 0, 0, 0}, -- Carpenter's Sigboard
    {18846, 1, 99, ZONE_RONFAURE_WEST, 0, 0, 0}, -- Battledore

    {16184, 1, 99, ZONE_RONFAURE_WEST, 0, 0, 0}, -- Flat Shield
    {16039, 1, 99, ZONE_RONFAURE_WEST, 0, 0, 0}, -- Kingdom Earring (teleport to Sandy)
    {19221, 1, 99, ZONE_RONFAURE_WEST, 0, 0, 0}, -- Firefly
    {19157, 1, 99, ZONE_RONFAURE_WEST, 0, 0, 0}, -- Survivor
    {14693, 1, 99, ZONE_RONFAURE_WEST, 0, 0, 0}, -- Stamina Earring +1

    -- Palborough Mines (5 - 20)
    {3595, 1, 99, ZONE_PALBOROUGH, 0, 0, 0}, -- Gemscope
    {348, 1, 99, ZONE_PALBOROUGH, 0, 0, 0}, -- Marble Plaque
    {18600, 1, 99, ZONE_PALBOROUGH, 0, 0, 0}, -- Caver's Shovel
    {28651, 1, 99, ZONE_PALBOROUGH, 0, 0, 0}, -- Metal Slime Shield

    {18412, 1, 99, ZONE_PALBOROUGH, 0, 0, 0}, -- Gassan
    {13370, 1, 99, ZONE_PALBOROUGH, 0, 0, 0}, -- Silver Earring +1
    {18959, 1, 99, ZONE_PALBOROUGH, 0, 0, 0}, -- Serpette +1
    {13371, 1, 99, ZONE_PALBOROUGH, 0, 0, 0}, -- Mythril Earring +1
    {13519, 1, 99, ZONE_PALBOROUGH, 0, 0, 0}, -- Mythril Ring +1
    {14689, 1, 99, ZONE_PALBOROUGH, 0, 0, 0}, -- Courage Earring +1

    -- King Ranperre's Tomb (5 - 20)
    {444, 1, 99, ZONE_RANPERRE, 0, 0, 0}, -- Luxurious Chest
    {445, 1, 99, ZONE_RANPERRE, 0, 0, 0}, -- Vaisselier Royale
    {3684, 1, 99, ZONE_RANPERRE, 0, 0, 0}, -- Princess Board
    {3685, 1, 99, ZONE_RANPERRE, 0, 0, 0}, -- Empress Board
    {20533, 1, 99, ZONE_RANPERRE, 0, 0, 0}, -- Worm Feelers

    {19043, 1, 99, ZONE_RANPERRE, 0, 0, 0}, -- Tenax Strap
    {17417, 1, 99, ZONE_RANPERRE, 0, 0, 0}, -- Rabbit Stick
    {13283, 1, 99, ZONE_RANPERRE, 0, 0, 0}, -- Saintly Ring +1
    {14695, 1, 99, ZONE_RANPERRE, 0, 0, 0}, -- Hope Earring +1

    -- Dangruf Wadi (5 - 20)
    {3638, 1, 99, ZONE_DANGRUF, 0, 0, 0}, -- Plate of Mock Hare
    {3690, 1, 99, ZONE_DANGRUF, 0, 0, 0}, -- Fighter Board
    {3714, 1, 99, ZONE_DANGRUF, 0, 0, 0}, -- Pot of White Clematis
    {3715, 1, 99, ZONE_DANGRUF, 0, 0, 0}, -- Pot of Pink Clematis
    {28650, 1, 99, ZONE_DANGRUF, 0, 0, 0}, -- She-Slime Shield

    {18412, 1, 99, ZONE_DANGRUF, 0, 0, 0}, -- Gassan
    {17177, 1, 99, ZONE_DANGRUF, 0, 0, 0}, -- Longbow +1
    {19224, 1, 99, ZONE_DANGRUF, 0, 0, 0}, -- Musketoon
    {19223, 1, 99, ZONE_DANGRUF, 0, 0, 0}, -- Attar of Roses
    {15486, 1, 99, ZONE_DANGRUF, 0, 0, 0}, -- Breath Mantle

    -- Inner Horutoto Ruins (5 - 20)
    {89, 1, 99, ZONE_HORUTOTO_INNER, 0, 0, 0}, -- Wastebasket
    {278, 1, 99, ZONE_HORUTOTO_INNER, 0, 0, 0}, -- Cardian Statue
    {370, 1, 99, ZONE_HORUTOTO_INNER, 0, 0, 0}, -- Windurstian Tea Set
    {3674, 1, 99, ZONE_HORUTOTO_INNER, 0, 0, 0}, -- Alembic
    {3675, 1, 99, ZONE_HORUTOTO_INNER, 0, 0, 0}, -- Flask Set

    {13825, 1, 99, ZONE_HORUTOTO_INNER, 0, 0, 0}, -- Bone Hairpin +1
    {18610, 1, 99, ZONE_HORUTOTO_INNER, 0, 0, 0}, -- Spiro Staff
    {16007, 1, 99, ZONE_HORUTOTO_INNER, 0, 0, 0}, -- Protect Earring
    {13285, 1, 99, ZONE_HORUTOTO_INNER, 0, 0, 0}, -- Eremite's Ring +1
    {14694, 1, 99, ZONE_HORUTOTO_INNER, 0, 0, 0}, -- Energy Earring +1

    -- Outer Horutoto Ruins (15 - 30)
    {137, 1, 99, ZONE_HORUTOTO_OUTER, 0, 0, 0}, -- Cordon Bleu Cooking Set
    {278, 1, 99, ZONE_HORUTOTO_OUTER, 0, 0, 0}, -- Cardian Statue
    {367, 1, 99, ZONE_HORUTOTO_OUTER, 0, 0, 0}, -- Pot Topper
    {441, 1, 99, ZONE_HORUTOTO_OUTER, 0, 0, 0}, -- Taru Tot Toyset
    {3689, 1, 99, ZONE_HORUTOTO_OUTER, 0, 0, 0}, -- Wizardess Board

    {13285, 1, 99, ZONE_HORUTOTO_OUTER, 0, 0, 0}, -- Eremite's Ring +1
    {14694, 1, 99, ZONE_HORUTOTO_OUTER, 0, 0, 0}, -- Energy Earring +1
    {12530, 1, 99, ZONE_HORUTOTO_OUTER, 0, 0, 0}, -- Sage's Circlet
    {14495, 1, 99, ZONE_HORUTOTO_OUTER, 0, 0, 0}, -- Healing Harness
    {15783, 1, 99, ZONE_HORUTOTO_OUTER, 0, 0, 0}, -- Armored Ring
    {18610, 1, 99, ZONE_HORUTOTO_OUTER, 0, 0, 0}, -- Spiro Staff

    -- Tahrongi Canyon (10 - 20)
    {26, 1, 99, ZONE_TAHRONGI, 0, 0, 0}, -- Tarutaru Desk
    {104, 1, 99, ZONE_TAHRONGI, 0, 0, 0}, -- Tarutaru Folding Scren
    {20533, 1, 99, ZONE_TAHRONGI, 0, 0, 0}, -- Worm Feelers
    {21097, 1, 99, ZONE_TAHRONGI, 0, 0, 0}, -- Leafkin Bopper

    {16007, 1, 99, ZONE_TAHRONGI, 0, 0, 0}, -- Protect Earring
    {13378, 1, 99, ZONE_TAHRONGI, 0, 0, 0}, -- Stamina Earring +1
    {13366, 1, 99, ZONE_TAHRONGI, 0, 0, 0}, -- Dodge Earring
    {15526, 1, 99, ZONE_TAHRONGI, 0, 0, 0}, -- Regen Collar
    {14495, 1, 99, ZONE_TAHRONGI, 0, 0, 0}, -- Healing Harness

    -- La Theine (10 - 20)
    {120, 1, 99, ZONE_LATHEINE, 0, 0, 0}, -- Freshwater Aquarium
    {320, 1, 99, ZONE_LATHEINE, 0, 0, 0}, -- Harpsichord
    {368, 1, 99, ZONE_LATHEINE, 0, 0, 0}, -- Sandorian Tea Set
    {3693, 1, 99, ZONE_LATHEINE, 0, 0, 0}, -- Lamb Carving
    {15456, 1, 99, ZONE_LATHEINE, 0, 0, 0}, -- Dash Sash
    {15835, 1, 99, ZONE_LATHEINE, 0, 0, 0}, -- Desperado Ring

    {13599, 1, 99, ZONE_LATHEINE, 0, 0, 0}, -- Rabbit Mantle +1
    {16282, 1, 99, ZONE_LATHEINE, 0, 0, 0}, -- Buffoon's Collar +1
    {16007, 1, 99, ZONE_LATHEINE, 0, 0, 0}, -- Protect Earring
    {12799, 1, 99, ZONE_LATHEINE, 0, 0, 0}, -- Battle Gloves
    {17258, 1, 99, ZONE_LATHEINE, 0, 0, 0}, -- Bandit's Gun +1

    -- Konschtat Highlands (10 - 20)
    {369, 1, 99, ZONE_KONSCHTAT, 0, 0, 0}, -- Bastokan Tea Set
    {371, 1, 99, ZONE_KONSCHTAT, 0, 0, 0}, -- Butterfly Cage
    {3697, 1, 99, ZONE_KONSCHTAT, 0, 0, 0}, -- Mandarin
    {3688, 1, 99, ZONE_KONSCHTAT, 0, 0, 0}, -- Dancer Board
    {356, 1, 99, ZONE_KONSCHTAT, 0, 0, 0}, -- Set of Guild Flyers

    {16282, 1, 99, ZONE_KONSCHTAT, 0, 0, 0}, -- Buffoon's Collar +1
    {15526, 1, 99, ZONE_KONSCHTAT, 0, 0, 0}, -- Regen Collar
    {15835, 1, 99, ZONE_KONSCHTAT, 0, 0, 0}, -- Desperado Ring
    {14695, 1, 99, ZONE_KONSCHTAT, 0, 0, 0}, -- Hope Earring +1
    {19223, 1, 99, ZONE_KONSCHTAT, 0, 0, 0}, -- Attar of Roses

    -- Giddeus (15 - 25)
    {3639, 1, 99, ZONE_GIDDEUS, 0, 0, 0}, -- Purifying Ewer
    {3641, 1, 99, ZONE_GIDDEUS, 0, 0, 0}, -- Kabuto-kazari
    {3692, 1, 99, ZONE_GIDDEUS, 0, 0, 0}, -- Stoic Board

    {13365, 1, 99, ZONE_GIDDEUS, 0, 0, 0}, -- Shield Earring
    {14690, 1, 99, ZONE_GIDDEUS, 0, 0, 0}, -- Knowledge Earring +1
    {14694, 1, 99, ZONE_GIDDEUS, 0, 0, 0}, -- Energy Earring +1
    {13439, 1, 99, ZONE_GIDDEUS, 0, 0, 0}, -- Warlock's Earring (+1 HMP if RDM sub)
    {18599, 1, 99, ZONE_GIDDEUS, 0, 0, 0}, -- Pestle

    -- Yughott Grotto (15 - 25)
    {191, 1, 99, ZONE_YUGHOTT, 0, 0, 0}, -- Fishing Hole Map
    {449, 1, 99, ZONE_YUGHOTT, 0, 0, 0}, -- Personal Table
    {460, 1, 99, ZONE_YUGHOTT, 0, 0, 0}, -- Bakery Platter
    {3691, 1, 99, ZONE_YUGHOTT, 0, 0, 0}, -- Guardian Board
    {28655, 1, 99, ZONE_YUGHOTT, 0, 0, 0}, -- Slime Shield

    {17086, 1, 99, ZONE_YUGHOTT, 0, 0, 0}, -- Bronze Mace +1
    {16716, 1, 99, ZONE_YUGHOTT, 0, 0, 0}, -- Butterfly Axe +1
    {12543, 1, 99, ZONE_YUGHOTT, 0, 0, 0}, -- Windshear Hat
    {15526, 1, 99, ZONE_YUGHOTT, 0, 0, 0}, -- Regen Collar
    {16007, 1, 99, ZONE_YUGHOTT, 0, 0, 0}, -- Protect Earring

    -- Ghelsba Outpost (10 - 20)
    {3600, 1, 99, ZONE_GHELSBA_OUTPOST, 0, 0, 0}, -- Bongo Drum
    {3668, 1, 99, ZONE_GHELSBA_OUTPOST, 0, 0, 0}, -- Hide Stretcher
    {144, 1, 99, ZONE_GHELSBA_OUTPOST, 0, 0, 0}, -- Caisson
    {201, 1, 99, ZONE_GHELSBA_OUTPOST, 0, 0, 0}, -- Totem Pole

    {13435, 1, 99, ZONE_GHELSBA_OUTPOST, 0, 0, 0}, -- Mercenary's Earring (+2 Vit when WAR is subjob)
    {14737, 1, 99, ZONE_GHELSBA_OUTPOST, 0, 0, 0}, -- Wyvern Earring (+5% Haste if DRG is subjob)
    {15783, 1, 99, ZONE_GHELSBA_OUTPOST, 0, 0, 0}, -- Armored Ring
    {16716, 1, 99, ZONE_GHELSBA_OUTPOST, 0, 0, 0}, -- Butterfly Axe +1
    {17255, 1, 99, ZONE_GHELSBA_OUTPOST, 0, 0, 0}, -- Hakenbuechse

    -- Ghelsba Fort (10 - 20)
    {125, 1, 99, ZONE_GHELSBA_FORT, 0, 0, 0}, -- Reliquary
    {447, 1, 99, ZONE_GHELSBA_FORT, 0, 0, 0}, -- Mensa Lunata
    {3679, 1, 99, ZONE_GHELSBA_FORT, 0, 0, 0}, -- Beastman Gonfalon
    {26889, 1, 99, ZONE_GHELSBA_FORT, 0, 0, 0}, -- Heart Apron

    {16007, 1, 99, ZONE_GHELSBA_FORT, 0, 0, 0}, -- Protect Earring
    {13051, 1, 99, ZONE_GHELSBA_FORT, 0, 0, 0}, -- Coarse Leggings
    {14695, 1, 99, ZONE_GHELSBA_FORT, 0, 0, 0}, -- Hope Earring +1
    {16667, 1, 99, ZONE_GHELSBA_FORT, 0, 0, 0}, -- Light Axe
    {17142, 1, 99, ZONE_GHELSBA_FORT, 0, 0, 0}, -- Wild Cudgel

    -- Buburimu Peninsula Items (15 - 25)
    {351, 1, 99, ZONE_BUBURIMU, 0, 0, 0}, -- Federal Mercenary's Hammock
    {103, 1, 99, ZONE_BUBURIMU, 0, 0, 0}, -- Goldfish Bowl
    {121, 1, 99, ZONE_BUBURIMU, 0, 0, 0}, -- Saltwater Aquarium
    {195, 1, 99, ZONE_BUBURIMU, 0, 0, 0}, -- The Big One
    {10850, 1, 99, ZONE_BUBURIMU, 0, 0, 0}, -- Leech Belt

    {15783, 1, 99, ZONE_BUBURIMU, 0, 0, 0}, -- Armored Ring
    {14694, 1, 99, ZONE_BUBURIMU, 0, 0, 0}, -- Energy Earring +1
    {18599, 1, 99, ZONE_BUBURIMU, 0, 0, 0}, -- Pestle
    {16044, 1, 99, ZONE_BUBURIMU, 0, 0, 0}, -- Mhaura Earring
    {26166, 1, 99, ZONE_BUBURIMU, 0, 0, 0}, -- Invisible Ring
    {12799, 1, 99, ZONE_BUBURIMU, 0, 0, 0}, -- Battle Gloves

    -- Valkurm Dunes (15 - 25)
    {3670, 1, 99, ZONE_VALKURM, 0, 0, 0}, -- Net and Lure
    {3671, 1, 99, ZONE_VALKURM, 0, 0, 0}, -- Set of Stockfish

    {16398, 1, 99, ZONE_VALKURM, 0, 0, 0}, -- Burning Cesti
    {16621, 1, 99, ZONE_VALKURM, 0, 0, 0}, -- Flame Sword
    {16929, 1, 99, ZONE_VALKURM, 0, 0, 0}, -- Burning Claymore
    {16713, 1, 99, ZONE_VALKURM, 0, 0, 0}, -- Hellfire Axe
    {14593, 1, 99, ZONE_VALKURM, 0, 0, 0}, -- Courage Ring +1

    -- Jugner Forest (15 - 25)
    {443, 1, 99, ZONE_JUGNER, 0, 0, 0}, -- Aureous Chest
    {3698, 1, 99, ZONE_JUGNER, 0, 0, 0}, -- Cherry Tree
    {3717, 1, 99, ZONE_JUGNER, 0, 0, 0}, -- Birch Tree
    {3683, 1, 99, ZONE_JUGNER, 0, 0, 0}, -- Forestdweller Board
    {3645, 1, 99, ZONE_JUGNER, 0, 0, 0}, -- Leafbell

    {13326, 1, 99, ZONE_JUGNER, 0, 0, 0}, -- Beetle Earring +1
    {13501, 1, 99, ZONE_JUGNER, 0, 0, 0}, -- Beetle Ring +1
    {14654, 1, 99, ZONE_JUGNER, 0, 0, 0}, -- Poisona Ring
    {26167, 1, 99, ZONE_JUGNER, 0, 0, 0}, -- Sneak Ring
    {14596, 1, 99, ZONE_JUGNER, 0, 0, 0}, -- Tranquility Ring +1

    -- Pashhow Marshlands (15 - 25)
    {284, 1, 99, ZONE_PASHHOW, 0, 0, 0}, -- Goobbue Statue
    {3621, 1, 99, ZONE_PASHHOW, 0, 0, 0}, -- Leafberry Wreath
    {432, 1, 99, ZONE_PASHHOW, 0, 0, 0}, -- Yellow Storm Lantern
    {372, 1, 99, ZONE_PASHHOW, 0, 0, 0}, -- Cricket Cage
    {330, 1, 99, ZONE_PASHHOW, 0, 0, 0}, -- Green Hobby Bo
    {26167, 1, 99, ZONE_PASHHOW, 0, 0, 0}, -- Sneak Ring

    {14597, 1, 99, ZONE_PASHHOW, 0, 0, 0}, -- Stamina Ring +1
    {19222, 1, 99, ZONE_PASHHOW, 0, 0, 0}, -- Wurger
    {11412, 1, 99, ZONE_PASHHOW, 0, 0, 0}, -- Mettle Leggings +1
    {12341, 1, 99, ZONE_PASHHOW, 0, 0, 0}, -- Tropical Shield
    {15906, 1, 99, ZONE_PASHHOW, 0, 0, 0}, -- Mohbwa Sash +1



    -- Meriphataud Mountains (15 - 25)
    {43, 1, 99, ZONE_MERIPHATAUD, 0, 0, 0}, -- Wicker Box
    {440, 1, 99, ZONE_MERIPHATAUD, 0, 0, 0}, -- Squat Desk
    {3649, 1, 99, ZONE_MERIPHATAUD, 0, 0, 0}, -- Harvest Horror
    {3672, 1, 99, ZONE_MERIPHATAUD, 0, 0, 0}, -- Carpenter's Kit
    {16297, 1, 99, ZONE_MERIPHATAUD, 0, 0, 0}, -- Rabbit Belt
    {15456, 1, 99, ZONE_MERIPHATAUD, 0, 0, 0}, -- Dash Sash

    {26166, 1, 99, ZONE_MERIPHATAUD, 0, 0, 0}, -- Invisible Ring
    {14594, 1, 99, ZONE_MERIPHATAUD, 0, 0, 0}, -- Knowledge Ring +1
    {18503, 1, 99, ZONE_MERIPHATAUD, 0, 0, 0}, -- Mammut
    {13219, 1, 99, ZONE_MERIPHATAUD, 0, 0, 0}, -- Magic Belt +1
    {13225, 1, 99, ZONE_MERIPHATAUD, 0, 0, 0}, -- Brave Belt

    -- Shakhrami (15 - 30)
    {361, 1, 99, ZONE_SHAKHRAMI, 0, 0, 0}, -- Gallipot
    {360, 1, 99, ZONE_SHAKHRAMI, 0, 0, 0}, -- Matka
    {359, 1, 99, ZONE_SHAKHRAMI, 0, 0, 0}, -- Bahut
    {10852, 1, 99, ZONE_SHAKHRAMI, 0, 0, 0}, -- Hecteyes Belt
    {3663, 1, 99, ZONE_SHAKHRAMI, 0, 0, 0}, -- Set of Bonecrafting Tools

    {13362, 1, 99, ZONE_SHAKHRAMI, 0, 0, 0}, -- Bone Earring +1
    {13500, 1, 99, ZONE_SHAKHRAMI, 0, 0, 0}, -- Bone Ring +1
    {13361, 1, 99, ZONE_SHAKHRAMI, 0, 0, 0}, -- Wing Earring
    {26167, 1, 99, ZONE_SHAKHRAMI, 0, 0, 0}, -- Sneak Ring
    {12530, 1, 99, ZONE_SHAKHRAMI, 0, 0, 0}, -- Sage's Circlet

    -- Carpenter's Landing Items (20 - 30)
    {180, 1, 99, ZONE_CARPENTERS, 0, 0, 0}, -- Bonbori
    {371, 1, 99, ZONE_CARPENTERS, 0, 0, 0}, -- Butterfly Cage
    {362, 1, 99, ZONE_CARPENTERS, 0, 0, 0}, -- Fluoro Flora
    {373, 1, 99, ZONE_CARPENTERS, 0, 0, 0}, -- Glowfly Cage
    {3632, 1, 99, ZONE_CARPENTERS, 0, 0, 0}, -- Carpenter's Stall

    {15558, 1, 99, ZONE_CARPENTERS, 0, 0, 0}, -- Mighty Ring
    {14595, 1, 99, ZONE_CARPENTERS, 0, 0, 0}, -- Balance Ring +1
    {13240, 1, 99, ZONE_CARPENTERS, 0, 0, 0}, -- Warrior's Belt +1
    {15486, 1, 99, ZONE_CARPENTERS, 0, 0, 0}, -- Breath Mantle
    {15906, 1, 99, ZONE_CARPENTERS, 0, 0, 0}, -- Mohbwa Sash +1

    -- Ranguemont Pass (25 - 35)
    {419, 1, 99, ZONE_RANGUEMONT, 0, 0, 0}, -- Leisure Table
    {15933, 1, 99, ZONE_RANGUEMONT, 0, 0, 0}, -- Stirge Belt
    {192, 1, 99, ZONE_RANGUEMONT, 0, 0, 0}, -- Hoary Spire
    {21108, 1, 99, ZONE_RANGUEMONT, 0, 0, 0}, -- Kyuka Uchiwa +1
    {431, 1, 99, ZONE_RANGUEMONT, 0, 0, 0}, -- Green Storm Lantern

    {26166, 1, 99, ZONE_RANGUEMONT, 0, 0, 0}, -- Invisible Ring
    {13625, 1, 99, ZONE_RANGUEMONT, 0, 0, 0}, -- Tundra Mantle
    {14592, 1, 99, ZONE_RANGUEMONT, 0, 0, 0}, -- Reflex Ring +1
    {15558, 1, 99, ZONE_RANGUEMONT, 0, 0, 0}, -- Mighty Ring
    {12343, 1, 99, ZONE_RANGUEMONT, 0, 0, 0}, -- Faerie Shield

    -- Korroloka Tunnel (25 - 35)
    {419, 1, 99, ZONE_KORROLOKA, 0, 0, 0}, -- Leisure Table
    {3647, 1, 99, ZONE_KORROLOKA, 0, 0, 0}, -- Spook-a-swirl
    {3661, 1, 99, ZONE_KORROLOKA, 0, 0, 0}, -- Stone Hearth
    {186, 1, 99, ZONE_KORROLOKA, 0, 0, 0}, -- Shield Plaque
    {26168, 1, 99, ZONE_KORROLOKA, 0, 0, 0}, -- Deodorize Ring

    {15558, 1, 99, ZONE_KORROLOKA, 0, 0, 0}, -- Mighty Ring
    {14080, 1, 99, ZONE_KORROLOKA, 0, 0, 0}, -- Strider Boots
    {17071, 1, 99, ZONE_KORROLOKA, 0, 0, 0}, -- Heat Rod
    {18090, 1, 99, ZONE_KORROLOKA, 0, 0, 0}, -- Military Spear
    {12671, 1, 99, ZONE_KORROLOKA, 0, 0, 0}, -- Soil Gi +1

    -- Gusgen Mines (20 - 30)
    {151, 1, 99, ZONE_GUSGEN, 0, 0, 0}, -- Fool's Gold
    {11485, 1, 99, ZONE_GUSGEN, 0, 0, 0}, -- Spelunker's Helm
    {153, 1, 99, ZONE_GUSGEN, 0, 0, 0}, -- Mastersmith Anvil
    {3595, 1, 99, ZONE_GUSGEN, 0, 0, 0}, -- Gemscope
    {3648, 1, 99, ZONE_GUSGEN, 0, 0, 0}, -- Chocolate Grupkin

    {26168, 1, 99, ZONE_GUSGEN, 0, 0, 0}, -- Deodorize Ring
    {14862, 1, 99, ZONE_GUSGEN, 0, 0, 0}, -- Shade Mitten +1
    {15169, 1, 99, ZONE_GUSGEN, 0, 0, 0}, -- Shade Tiara +1
    {12338, 1, 99, ZONE_GUSGEN, 0, 0, 0}, -- Frost Shield
    {15315, 1, 99, ZONE_GUSGEN, 0, 0, 0}, -- Shade Leggings +1

    -- Ordelle Caves (20 - 30)
    {187, 1, 99, ZONE_DELKFUTT_LOW, 0, 0, 0}, -- Buckler Plaque
    {348, 1, 99, ZONE_ORDELLE, 0, 0, 0}, -- Marble Plaque
    {3643, 1, 99, ZONE_ORDELLE, 0, 0, 0}, -- Carillon Vermeil
    {3655, 1, 99, ZONE_ORDELLE, 0, 0, 0}, -- Treasury Table
    {3656, 1, 99, ZONE_ORDELLE, 0, 0, 0}, -- Treasury Stand

    {26168, 1, 99, ZONE_ORDELLE, 0, 0, 0}, -- Deodorize Ring
    {16144, 1, 99, ZONE_ORDELLE, 0, 0, 0}, -- Sol Cap
    {16078, 1, 99, ZONE_ORDELLE, 0, 0, 0}, -- Blissful Chapeau
    {13222, 1, 99, ZONE_ORDELLE, 0, 0, 0}, -- Force Belt
    {17071, 1, 99, ZONE_ORDELLE, 0, 0, 0}, -- Heat Rod

    -- Beadeaux (25 - 40)
    {10848, 1, 99, ZONE_BEADEAUX, 0, 0, 0}, -- Quadav Belt
    {3620, 1, 99, ZONE_BEADEAUX, 0, 0, 0}, -- Silberkranz
    {127, 1, 99, ZONE_BEADEAUX, 0, 0, 0}, -- Coffee Table
    {3662, 1, 99, ZONE_BEADEAUX, 0, 0, 0}, -- Case of Display Blades
    {3713, 1, 99, ZONE_BEADEAUX, 0, 0, 0}, -- Pot of Wards

    {17260, 1, 99, ZONE_BEADEAUX, 0, 0, 0}, -- Pirate's Gun +1
    {13609, 1, 99, ZONE_BEADEAUX, 0, 0, 0}, -- Wolf Mantle +1
    {15947, 1, 99, ZONE_BEADEAUX, 0, 0, 0}, -- Griot Belt +1
    {13685, 1, 99, ZONE_BEADEAUX, 0, 0, 0}, -- Invisible Mantle
    {18212, 1, 99, ZONE_DAVOI, 0, 0, 0}, -- Military Axe

    -- Castle Oztroja (25 - 40)
    {126, 1, 99, ZONE_OZTROJA, 0, 0, 0}, -- Falsiam Vase
    {3642, 1, 99, ZONE_OZTROJA, 0, 0, 0}, -- Katana-kazari
    {10849, 1, 99, ZONE_OZTROJA, 0, 0, 0}, -- Yagudo Belt
    {143, 1, 99, ZONE_OZTROJA, 0, 0, 0}, -- Ngoma
    {145, 1, 99, ZONE_OZTROJA, 0, 0, 0}, -- Thurible

    {13725, 1, 99, ZONE_OZTROJA, 0, 0, 0}, -- Mage's Tunic
    {14667, 1, 99, ZONE_OZTROJA, 0, 0, 0}, -- Carect Ring
    {14025, 1, 99, ZONE_OZTROJA, 0, 0, 0}, -- Devotee's Mitts +1
    {18604, 1, 99, ZONE_OZTROJA, 0, 0, 0}, -- Astaroth Cane
    {13685, 1, 99, ZONE_OZTROJA, 0, 0, 0}, -- Invisible Mantle

    -- Davoi (25 - 40)
    {146, 1, 99, ZONE_DAVOI, 0, 0, 0}, -- Walahra Burner
    {185, 1, 99, ZONE_DAVOI, 0, 0, 0}, -- Rook Banner
    {10847, 1, 99, ZONE_DAVOI, 0, 0, 0}, -- Orc Belt
    {187, 1, 99, ZONE_DAVOI, 0, 0, 0}, -- Buckler Plaque
    {3625, 1, 99, ZONE_DAVOI, 0, 0, 0}, -- Blacksmith's Stall

    {17134, 1, 99, ZONE_DAVOI, 0, 0, 0}, -- Dolphin Staff
    {16387, 1, 99, ZONE_DAVOI, 0, 0, 0}, -- Poison Cesti
    {13685, 1, 99, ZONE_DAVOI, 0, 0, 0}, -- Invisible Mantle
    {17940, 1, 99, ZONE_DAVOI, 0, 0, 0}, -- Military Pick
    {13404, 1, 99, ZONE_DAVOI, 0, 0, 0}, -- Nemesis Earring


    -- Delkfutt Lower Tower (25 - 35)
    {29661, 1, 99, ZONE_DELKFUTT_LOW, 0, 0, 0}, -- Glinting Shield
    {365, 1, 99, ZONE_DELKFUTT_LOW, 0, 0, 0}, -- Pole Classique
    {427, 1, 99, ZONE_DELKFUTT_LOW, 0, 0, 0}, -- Rococo Table
    {3634, 1, 99, ZONE_DELKFUTT_LOW, 0, 0, 0}, -- Starlight Cake

    {11043, 1, 99, ZONE_DELKFUTT_LOW, 0, 0, 0}, -- Giant's Earring
    {10648, 1, 99, ZONE_DELKFUTT_LOW, 0, 0, 0}, -- Areion Boots +1
    {13404, 1, 99, ZONE_DELKFUTT_LOW, 0, 0, 0}, -- Nemesis Earring
    {13127, 1, 99, ZONE_DELKFUTT_LOW, 0, 0, 0}, -- Guarding Gorget
    {13725, 1, 99, ZONE_DELKFUTT_LOW, 0, 0, 0}, -- Mage's Tunic

    -- Delkfutt Middle Tower Items (30 - 40)
    {3666, 1, 99, ZONE_DELKFUTT_MID, 0, 0, 0}, -- Set of Fine Raiments
    {357, 1, 99, ZONE_DELKFUTT_MID, 0, 0, 0}, -- Partition
    {366, 1, 99, ZONE_DELKFUTT_MID, 0, 0, 0}, -- Kanonenofen
    {374, 1, 99, ZONE_DELKFUTT_MID, 0, 0, 0}, -- Parclose
    {28, 1, 99, ZONE_DELKFUTT_MID, 0, 0, 0}, -- Drawing Desk

    {14328, 1, 99, ZONE_DELKFUTT_LOW, 0, 0, 0}, -- Seer's Slacks +1
    {14332, 1, 99, ZONE_DELKFUTT_LOW, 0, 0, 0}, -- Kampfdiechlings
    {14435, 1, 99, ZONE_DELKFUTT_LOW, 0, 0, 0}, -- Kampfbrust


    -- Delkfutt Upper Tower Items (35 - 45) / (65 - 70)
    {352, 1, 99, ZONE_DELKFUTT_HIGH, 0, 0, 0}, -- Half Partition
    {129, 1, 99, ZONE_DELKFUTT_HIGH, 0, 0, 0}, -- Imperial Standard
    {147, 1, 99, ZONE_DELKFUTT_HIGH, 0, 0, 0}, -- Imperial Tapestry
    {434, 1, 99, ZONE_DELKFUTT_HIGH, 0, 0, 0}, -- Isula Sideboard
    {20713, 1, 99, ZONE_DELKFUTT_HIGH, 0, 0, 0}, -- Excalipoor


    -- Sauromugue Champaigne (25 - 35)
    {126, 1, 99, ZONE_SAUROMUGUE, 0, 0, 0}, -- Falsiam Vase
    {424, 1, 99, ZONE_SAUROMUGUE, 0, 0, 0}, -- Feasting Table
    {3705, 1, 99, ZONE_SAUROMUGUE, 0, 0, 0}, -- Far East Hearth
    {326, 1, 99, ZONE_SAUROMUGUE, 0, 0, 0}, -- Yellow Hobby Bo
    {138, 1, 99, ZONE_SAUROMUGUE, 0, 0, 0}, -- Jeunoan Tree

    {16042, 1, 99, ZONE_SAUROMUGUE, 0, 0, 0}, -- Duchy Earring (teleport to Jeuno)
    {16368, 1, 99, ZONE_SAUROMUGUE, 0, 0, 0}, -- Herder's Subligar
    {16754, 1, 99, ZONE_SAUROMUGUE, 0, 0, 0}, -- Parrying Knife
    {17943, 1, 99, ZONE_SAUROMUGUE, 0, 0, 0}, -- Tomahawk +1
    {17442, 1, 99, ZONE_SAUROMUGUE, 0, 0, 0}, -- Eremite's Wand +1

    -- Batallia Downs (25 - 35)
    {138, 1, 99, ZONE_BATALLIA, 0, 0, 0}, -- Jeunoan Tree
    {430, 1, 99, ZONE_BATALLIA, 0, 0, 0}, -- Blue Storm Lantern
    {433, 1, 99, ZONE_BATALLIA, 0, 0, 0}, -- White Storm Lantern
    {329, 1, 99, ZONE_BATALLIA, 0, 0, 0}, -- Blue Hobby Bo
    {328, 1, 99, ZONE_BATALLIA, 0, 0, 0}, -- Black Hobby Bo

    {16042, 1, 99, ZONE_BATALLIA, 0, 0, 0}, -- Duchy Earring (teleport to Jeuno)
    {18451, 1, 99, ZONE_BATALLIA, 0, 0, 0}, -- Mokusa
    {14331, 1, 99, ZONE_BATALLIA, 0, 0, 0}, -- Shade Tights +1
    {14433, 1, 99, ZONE_BATALLIA, 0, 0, 0}, -- Shade Harness +1
    {14135, 1, 99, ZONE_BATALLIA, 0, 0, 0}, -- Air Solea +1

    -- Rolanberry Fields (25 - 35)
    {138, 1, 99, ZONE_ROLANBERRY, 0, 0, 0}, -- Jeunoan Tree
    {3673, 1, 99, ZONE_ROLANBERRY, 0, 0, 0}, -- Chocobo Carvings
    {421, 1, 99, ZONE_ROLANBERRY, 0, 0, 0}, -- Vase of Rulude Orchids
    {330, 1, 99, ZONE_ROLANBERRY, 0, 0, 0}, -- Green Hobby Bo
    {420, 1, 99, ZONE_ROLANBERRY, 0, 0, 0}, -- Pot of Meadsweet

    {16042, 1, 99, ZONE_ROLANBERRY, 0, 0, 0}, -- Duchy Earring (teleport to Jeuno)
    {11401, 1, 99, ZONE_ROLANBERRY, 0, 0, 0}, -- Rambler's Gaiters
    {16368, 1, 99, ZONE_ROLANBERRY, 0, 0, 0}, -- Herder's Subligar
    {14670, 1, 99, ZONE_ROLANBERRY, 0, 0, 0}, -- Safeguard Ring

    -- Qufim Island (25 - 35)
    {184, 1, 99, ZONE_QUFIM, 0, 0, 0}, -- Jeunoan Flag
    {15299, 1, 99, ZONE_QUFIM, 0, 0, 0}, -- Mandragora Belt
    {429, 1, 99, ZONE_QUFIM, 0, 0, 0}, -- Red Storm Lantern
    {327, 1, 99, ZONE_QUFIM, 0, 0, 0}, -- Red Hobby Bo
    {437, 1, 99, ZONE_QUFIM, 0, 0, 0}, -- Floral Nightstand

    {18762, 1, 99, ZONE_QUFIM, 0, 0, 0}, -- Custodes
    {14863, 1, 99, ZONE_QUFIM, 0, 0, 0}, -- Kampfhentzes
    {15171, 1, 99, ZONE_QUFIM, 0, 0, 0}, -- Kampfschaller
    {15321, 1, 99, ZONE_QUFIM, 0, 0, 0}, -- Kampfschuhs
    {11531, 1, 99, ZONE_QUFIM, 0, 0, 0}, -- Fidelity Mantle


    -- Yuhtunga Jungle (30 - 45)
    {323, 1, 99, ZONE_YUHTUNGA, 0, 0, 0}, -- Red Bamboo Grass
    {26693, 1, 99, ZONE_YUHTUNGA, 0, 0, 0}, -- Morbol Cap
    {325, 1, 99, ZONE_YUHTUNGA, 0, 0, 0}, -- Green Bamboo Grass
    {205, 1, 99, ZONE_YUHTUNGA, 0, 0, 0}, -- Mandragora Lantern
    {3646, 1, 99, ZONE_YUHTUNGA, 0, 0, 0}, -- Mandragora Pricket

    {16046, 1, 99, ZONE_YUHTUNGA, 0, 0, 0}, -- Kazham Earring (teleport to Khazam)
    {12349, 1, 99, ZONE_YUHTUNGA, 0, 0, 0}, -- Balance Buckler
    {13238, 1, 99, ZONE_YUHTUNGA, 0, 0, 0}, -- Druid's Rope
    {13675, 1, 99, ZONE_YUHTUNGA, 0, 0, 0}, -- Rearguard Mantle

    -- Sanctuary of Zi'tah (35 - 45)
    {87, 1, 99, ZONE_ZITAH, 0, 0, 0}, -- Kadomatsu
    {362, 1, 99, ZONE_ZITAH, 0, 0, 0}, -- Fluoro Flora
    {363, 1, 99, ZONE_ZITAH, 0, 0, 0}, -- Glowfly Cage
    {324, 1, 99, ZONE_ZITAH, 0, 0, 0}, -- Blue Bamboo Grass
    {26738, 1, 99, ZONE_ZITAH, 0, 0, 0}, -- Leafkin Cap

    {12375, 1, 99, ZONE_ZITAH, 0, 0, 0}, -- Light Buckler
    {13674, 1, 99, ZONE_ZITAH, 0, 0, 0}, -- Agile Mantle


    -- Lufaise Meadows (35 - 45)
    {100, 1, 99, ZONE_LUFAISE, 0, 0, 0}, -- Okadomatsu
    {180, 1, 99, ZONE_LUFAISE, 0, 0, 0}, -- Bonbori
    {363, 1, 99, ZONE_LUFAISE, 0, 0, 0}, -- Glowfly Cage
    {3694, 1, 99, ZONE_LUFAISE, 0, 0, 0}, -- Polished Lamb Carving
    {26719, 1, 99, ZONE_LUFAISE, 0, 0, 0}, -- Sheep Cap

    {15183, 1, 99, ZONE_LUFAISE, 0, 0, 0}, -- Dobson Bandana
    {14766, 1, 99, ZONE_LUFAISE, 0, 0, 0}, -- Geist Earring
    {12350, 1, 99, ZONE_LUFAISE, 0, 0, 0}, -- Strike Shield

    -- Beaucedine Glacier (35 - 45)
    {208, 1, 99, ZONE_BEAUCEDINE, 0, 0, 0}, -- Ice Lamp
    {176, 1, 99, ZONE_BEAUCEDINE, 0, 0, 0}, -- Snowman Knight
    {177, 1, 99, ZONE_BEAUCEDINE, 0, 0, 0}, -- Snowman Miner
    {178, 1, 99, ZONE_BEAUCEDINE, 0, 0, 0}, -- Snowman Mage
    {25672, 1, 99, ZONE_BEAUCEDINE, 0, 0, 0}, -- Snoll Masque

    {13625, 1, 99, ZONE_BEAUCEDINE, 0, 0, 0}, -- Tundra Mantle
    {13165, 1, 99, ZONE_BEAUCEDINE, 0, 0, 0}, -- Jag Gorget

    -- Eastern Altepa Items (35 - 50)
    {150, 1, 99, ZONE_ALTEPA_EAST, 0, 0, 0}, -- Leather Pot
    {363, 1, 99, ZONE_ALTEPA_EAST, 0, 0, 0}, -- Amigo Cactus
    {20909, 1, 99, ZONE_ALTEPA_EAST, 0, 0, 0}, -- Hoe
    {16045, 1, 99, ZONE_ALTEPA_EAST, 0, 0, 0}, -- Rabao Earring (teleport to Rabao)
    {16804, 1, 99, ZONE_ALTEPA_EAST, 0, 0, 0}, -- Flame Blade +1

    {13202, 1, 99, ZONE_ALTEPA_EAST, 0, 0, 0}, -- Brown Belt
    {15348, 1, 99, ZONE_ALTEPA_EAST, 0, 0, 0}, -- Mountain Gaiters
    {17787, 1, 99, ZONE_ALTEPA_EAST, 0, 0, 0}, -- Ohaguro
    {13623, 1, 99, ZONE_ALTEPA_EAST, 0, 0, 0}, -- Earth Mantle
    {17510, 1, 99, ZONE_ALTEPA_EAST, 0, 0, 0}, -- Vampiric Claws

    -- Bibiki Bay (35 - 75)
    {224, 1, 99, ZONE_BIBIKI, 0, 0, 0}, -- Bay Aquarium
    {319, 1, 99, ZONE_BIBIKI, 0, 0, 0}, -- Shell Lamp
    {222, 1, 99, ZONE_BIBIKI, 0, 0, 0}, -- Fighting Fish Tank
    {3664, 1, 99, ZONE_BIBIKI, 0, 0, 0}, -- Shell Assortment
    {26705, 1, 99, ZONE_BIBIKI, 0, 0, 0}, -- Mandragora Masque

    {13237, 1, 50, ZONE_BIBIKI, 0, 0, 0}, -- Survival Belt
    {13164, 1, 50, ZONE_BIBIKI, 0, 0, 0}, -- Agile Gorget
    {12404, 1, 50, ZONE_BIBIKI, 0, 0, 0}, -- Elegant Shield


    -- Misareaux Coast (40 - 50)
    {188, 1, 99, ZONE_MISAREAUX, 0, 0, 0}, -- Acolyte's Grief
    {195, 1, 99, ZONE_MISAREAUX, 0, 0, 0}, -- The Big One
    {225, 1, 99, ZONE_MISAREAUX, 0, 0, 0}, -- Reef Aquarium
    {3619, 1, 99, ZONE_MISAREAUX, 0, 0, 0}, -- Couronne Des Etoiles
    {3631, 1, 99, ZONE_MISAREAUX, 0, 0, 0}, -- Fisherman's Stall

    {15219, 1, 99, ZONE_MISAREAUX, 0, 0, 0}, -- Sinister Mask
    {17463, 1, 99, ZONE_MISAREAUX, 0, 0, 0}, -- Sealed Mace
    {13129, 1, 99, ZONE_MISAREAUX, 0, 0, 0}, -- Spirit Torque
    {17693, 1, 99, ZONE_MISAREAUX, 0, 0, 0}, -- Grudge Sword
    {13271, 1, 99, ZONE_MISAREAUX, 0, 0, 0}, -- Corsette +1

    -- Phomiuna Aqueducts (40 - 50)
    {149, 1, 99, ZONE_PHOMIUNA, 0, 0, 0}, -- Set of Alchemist's Tools
    {353, 1, 99, ZONE_PHOMIUNA, 0, 0, 0}, -- Spence
    {442, 1, 99, ZONE_PHOMIUNA, 0, 0, 0}, -- Gilded Chest
    {416, 1, 99, ZONE_PHOMIUNA, 0, 0, 0}, -- Tomeshelf
    {460, 1, 99, ZONE_PHOMIUNA, 0, 0, 0}, -- Candelabrum

    {15290, 1, 99, ZONE_RIVERNE_A1, 0, 0, 0}, -- Haste Belt
    {15372, 1, 99, ZONE_RIVERNE_A1, 0, 0, 0}, -- Magic Slacks
    {15468, 1, 99, ZONE_RIVERNE_A1, 0, 0, 0}, -- Resentment Cape

    -- Riverne Site A01 (40 - 50)
    {3596, 1, 99, ZONE_RIVERNE_A1, 0, 0, 0}, -- Ornament Case
    {16120, 1, 99, ZONE_RIVERNE_A1, 0, 0, 0}, -- Red Eyes
    {21118, 1, 99, ZONE_RIVERNE_A1, 0, 0, 0}, -- Green Spriggan Club
    {3707, 1, 99, ZONE_RIVERNE_A1, 0, 0, 0}, -- Murrey Grisaille
    {147, 1, 99, ZONE_RIVERNE_A1, 0, 0, 0}, -- Imperial Tapestry

    {15287, 1, 99, ZONE_RIVERNE_A1, 0, 0, 0}, -- Mantra Belt

    -- Oldton Movapolis (40 - 50)
    {418, 1, 99, ZONE_OLDTON, 0, 0, 0}, -- Tidings Board
    {26730, 1, 99, ZONE_OLDTON, 0, 0, 0}, -- Celeste Cap
    {3596, 1, 99, ZONE_OLDTON, 0, 0, 0}, -- Ornament Case
    {3708, 1, 99, ZONE_OLDTON, 0, 0, 0}, -- Moss-green Grissaile
    {15929, 1, 99, ZONE_OLDTON, 0, 0, 0}, -- Goblin Belt

    {15222, 1, 99, ZONE_OLDTON, 0, 0, 0}, -- Spelunker's Hat
    {15286, 1, 99, ZONE_OLDTON, 0, 0, 0}, -- Tilt Belt

    -- Garlaige Citadel (40 - 55)
    {358, 1, 99, ZONE_GARLAIGE, 0, 0, 0}, -- Credenza
    {425, 1, 99, ZONE_GARLAIGE, 0, 0, 0}, -- Girandola
    {426, 1, 99, ZONE_GARLAIGE, 0, 0, 0}, -- Orchestrion
    {26707, 1, 99, ZONE_GARLAIGE, 0, 0, 0}, -- Orchestrion
    {3586, 1, 99, ZONE_GARLAIGE, 0, 0, 0}, -- Red Viola Pot

    -- Attohwa Chasm (40 - 60)
    {318, 1, 99, ZONE_ATTOHWA, 0, 0, 0}, -- Crystal Rose
    {3594, 1, 99, ZONE_ATTOHWA, 0, 0, 0}, -- Gemstone Case
    {21153, 1, 99, ZONE_ATTOHWA, 0, 0, 0}, -- Malice Masher
    {25606, 1, 99, ZONE_ATTOHWA, 0, 0, 0}, -- Agent Hood
    {25607, 1, 99, ZONE_ATTOHWA, 0, 0, 0}, -- Starlet Flower

    -- Yhoator Jungle (40 - 60)
    {422, 1, 99, ZONE_YHOATOR, 0, 0, 0}, -- Elshimo Pachira
    {99, 1, 99, ZONE_YHOATOR, 0, 0, 0}, -- Elshimo Palm
    {200, 1, 99, ZONE_YHOATOR, 0, 0, 0}, -- Tsahyan Mask
    {3624, 1, 99, ZONE_YHOATOR, 0, 0, 0}, -- Korrigan Pricket
    {10807, 1, 99, ZONE_YHOATOR, 0, 0, 0}, -- Mandraguard
    {16046, 1, 99, ZONE_YHOATOR, 0, 0, 0}, -- Kazham Earring (teleport to Khazam)

    -- Seaserpent Grotto (40 - 60)
    {454, 1, 99, ZONE_SEASERPENT, 0, 0, 0}, -- Egg Lantern
    {11482, 1, 99, ZONE_SEASERPENT, 0, 0, 0}, -- Eyepatch
    {18103, 1, 99, ZONE_SEASERPENT, 0, 0, 0}, -- Pitchfork +1


    -- Xarcabard (40 - 50)
    {176, 1, 99, ZONE_XARCABARD, 0, 0, 0}, -- Snowman Knight
    {177, 1, 99, ZONE_XARCABARD, 0, 0, 0}, -- Snowman Miner
    {178, 1, 99, ZONE_XARCABARD, 0, 0, 0}, -- Snowman Mage
    {26728, 1, 99, ZONE_XARCABARD, 0, 0, 0}, -- Frosty Cap
    {3640, 1, 99, ZONE_XARCABARD, 0, 0, 0}, -- Rolanberry Delightaru

    -- Eldieme Necropolis Items (45 - 55)
    {458, 1, 99, ZONE_ELDIEME, 0, 0, 0}, -- Calabazilla Lantern
    {204, 1, 99, ZONE_ELDIEME, 0, 0, 0}, -- Pumpkin Lantern
    {16257, 1, 99, ZONE_ELDIEME, 0, 0, 0}, -- Ghost Cape
    {11320, 1, 99, ZONE_ELDIEME, 0, 0, 0}, -- Skeleton Robe
    {15176, 1, 99, ZONE_ELDIEME, 0, 0, 0}, -- Pumpkin Head II

    -- Crawler's Nest (45 - 55)
    {355, 1, 99, ZONE_CRAWLERS, 0, 0, 0}, -- Bread Crock
    {27733, 1, 99, ZONE_CRAWLERS, 0, 0, 0}, -- Straw Hat
    {3587, 1, 99, ZONE_CRAWLERS, 0, 0, 0}, -- Blue Viola Pot
    {3593, 1, 99, ZONE_CRAWLERS, 0, 0, 0}, -- Keepsake Case
    {3628, 1, 99, ZONE_CRAWLERS, 0, 0, 0}, -- Weaver's Stall

    -- Behemoth's Dominion (45 - 50)
    {266, 1, 99, ZONE_BEHEMOTHS, 0, 0, 0}, -- Behemoth Statue
    {26798, 1, 99, ZONE_BEHEMOTHS, 0, 0, 0}, -- Behemoth Masque
    {26955, 1, 99, ZONE_BEHEMOTHS, 0, 0, 0}, -- Behemoth Suit
    {434, 1, 99, ZONE_BEHEMOTHS, 0, 0, 0}, -- Isula Sideboard
    {21114, 1, 99, ZONE_BEHEMOTHS, 0, 0, 0}, -- Red Spriggan Club

    -- Monastic Cavern Items (45 - 60)
    {456, 1, 99, ZONE_MON_CAVERN, 0, 0, 0}, -- Pepo Lantern
    {3592, 1, 99, ZONE_MON_CAVERN, 0, 0, 0}, -- Jewelry Case
    {10851, 1, 99, ZONE_MON_CAVERN, 0, 0, 0}, -- Slime Belt
    {3626, 1, 99, ZONE_MON_CAVERN, 0, 0, 0}, -- Goldsmith's Stall
    {25713, 1, 99, ZONE_MON_CAVERN, 0, 0, 0}, -- Track Shirt

    {16007, 1, 99, ZONE_MON_CAVERN, 0, 0, 0}, -- Physical Earring
    {14695, 1, 99, ZONE_MON_CAVERN, 0, 0, 0}, -- Hope Earring +1
    {13283, 1, 99, ZONE_MON_CAVERN, 0, 0, 0}, -- Saintly Ring +1

    -- Gustav Tunnel (45 - 60)
    {3625, 1, 99, ZONE_GUSTAV, 0, 0, 0}, -- Blacksmith's Stall
    {3669, 1, 99, ZONE_GUSTAV, 0, 0, 0}, -- Set of Courier Bags
    {25711, 1, 99, ZONE_GUSTAV, 0, 0, 0}, -- Botulus Suit
    {26703, 1, 99, ZONE_GUSTAV, 0, 0, 0}, -- Lycopodium Masque

    -- Western Altepa Items (45 - 60)
    {364, 1, 99, ZONE_ALTEPA_WEST, 0, 0, 0}, -- Amiga Cactus
    {210, 1, 99, ZONE_ALTEPA_WEST, 0, 0, 0}, -- Earth Lamp
    {98, 1, 99, ZONE_ALTEPA_WEST, 0, 0, 0}, -- Scimitar Cactus
    {16119, 1, 99, ZONE_ALTEPA_WEST, 0, 0, 0}, -- Nomad Cap
    {16045, 1, 99, ZONE_ALTEPA_WEST, 0, 0, 0}, -- Rabao Earring (teleport to Rabao)
    {16804, 1, 99, ZONE_ALTEPA_WEST, 0, 0, 0}, -- Flame Blade +1
    {13655, 1, 99, ZONE_ALTEPA_WEST, 0, 0, 0}, -- Sand Mantle
    {13654, 1, 99, ZONE_ALTEPA_WEST, 0, 0, 0}, -- Desert Mantle +1

    -- Quicksand Caves (50 - 65)
    {3627, 1, 99, ZONE_QUICKSAND, 0, 0, 0}, -- Boneworker's Stall
    {15919, 1, 99, ZONE_QUICKSAND, 0, 0, 0}, -- Drover's Belt
    {26717, 1, 99, ZONE_QUICKSAND, 0, 0, 0}, -- Cait Sith Cap
    {27717, 1, 99, ZONE_QUICKSAND, 0, 0, 0}, -- Worm Masque
    {26707, 1, 99, ZONE_QUICKSAND, 0, 0, 0}, -- Flan Masque

    -- Bostaunieux Oubliette (50 - 65)
    {3675, 1, 99, ZONE_BOSTAUNIEUX, 0, 0, 0}, -- Flask Set
    {189, 1, 99, ZONE_BOSTAUNIEUX, 0, 0, 0}, -- Autumn's End
    {3633, 1, 99, ZONE_BOSTAUNIEUX, 0, 0, 0}, -- Alchemist's Stall
    {438, 1, 99, ZONE_BOSTAUNIEUX, 0, 0, 0}, -- Orblight
    {27714, 1, 99, ZONE_BOSTAUNIEUX, 0, 0, 0}, -- Mith Masquette

    -- Toraimarai Canal Items (50 - 65)
    {3676, 1, 99, ZONE_TORAIMARAI, 0, 0, 0}, -- Celestial Globe
    {333, 1, 99, ZONE_TORAIMARAI, 0, 0, 0}, -- Winged Balance
    {77, 1, 99, ZONE_TORAIMARAI, 0, 0, 0}, -- Bookshelf
    {354, 1, 99, ZONE_TORAIMARAI, 0, 0, 0}, -- Bookstack
    {134, 1, 99, ZONE_TORAIMARAI, 0, 0, 0}, -- Copy of "Emeralda"

    -- Fei'Yin (50 - 65)
    {10446, 1, 99, ZONE_FEIYIN, 0, 0, 0}, -- Ahriman Cap
    {16075, 1, 99, ZONE_FEIYIN, 0, 0, 0}, -- Witch Hat
    {354, 1, 99, ZONE_FEIYIN, 0, 0, 0}, -- Bookstack
    {26694, 1, 99, ZONE_FEIYIN, 0, 0, 0}, -- Cassie's Cap
    {27626, 1, 99, ZONE_FEIYIN, 0, 0, 0}, -- Morbol Shield

    -- Pso'Xja (50 - 75)
    {3677, 1, 99, ZONE_PSOXJA, 0, 0, 0}, -- Spinet
    {6409, 1, 99, ZONE_PSOXJA, 0, 0, 0}, -- Ephramadian Throne
    {26729, 1, 99, ZONE_PSOXJA, 0, 0, 0}, -- Corolla
    {26956, 1, 99, ZONE_PSOXJA, 0, 0, 0}, -- Proggo Coat

    -- Labyrinth of Onzozo (50 - 70)
    {3630, 1, 99, ZONE_ONZOZO, 0, 0, 0}, -- Tanner's Stall

    -- Riverne Site B01 (50 - 60)
    {16118, 1, 99, ZONE_RIVERNE_B1, 0, 0, 0}, -- Moogle Cap
    {26956, 1, 99, ZONE_RIVERNE_B1, 0, 0, 0}, -- Poroggo Coat

    -- Sacrarium (55 - 60)
    {331, 1, 99, ZONE_SACRARIUM, 0, 0, 0}, -- Winged Altar
    {332, 1, 99, ZONE_SACRARIUM, 0, 0, 0}, -- Winged Plaque
    {428, 1, 99, ZONE_SACRARIUM, 0, 0, 0}, -- Semainier
    {3680, 1, 99, ZONE_SACRARIUM, 0, 0, 0}, -- Copy of Judgment Day




    -- Temple of Uggalepih (50 - 65)
    {3622, 1, 99, ZONE_UGGALEPIH, 0, 0, 0}, -- Jack-oPricket
    {3682, 1, 99, ZONE_UGGALEPIH, 0, 0, 0}, -- Sproutling Board
    {15204, 1, 99, ZONE_UGGALEPIH, 0, 0, 0}, -- Mandragora Beret
    {25632, 1, 99, ZONE_UGGALEPIH, 0, 0, 0}, -- Carbie Cap

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
    {5410, 1, 99, ZONE_ZVAHL_KEEP, 0, 0, 0}, -- Shadow Throne


    -- Kuftal Tunnel (60 - 70)
    {3681, 1, 99, ZONE_KUFTAL, 0, 0, 0}, -- Alzadaal Table
    {25649, 1, 99, ZONE_KUFTAL, 0, 0, 0}, -- Gazer's Helmet
    {27759, 1, 99, ZONE_KUFTAL, 0, 0, 0}, -- Korrigan Beret
    {27902, 1, 99, ZONE_KUFTAL, 0, 0, 0}, -- Green Spriggan Coat

    -- Ifrit's Cauldron (65 - 75)
    {317, 1, 99, ZONE_CAULDRON, 0, 0, 0}, -- Bronze Rose
    {203, 1, 99, ZONE_CAULDRON, 0, 0, 0}, -- Bomb Lantern
    {3623, 1, 99, ZONE_CAULDRON, 0, 0, 0}, -- Djinn Pricket
    {15921, 1, 99, ZONE_CAULDRON, 0, 0, 0}, -- Detonator Belt
    {27757, 1, 99, ZONE_CAULDRON, 0, 0, 0}, -- Bomb Masque
    {16046, 1, 99, ZONE_CAULDRON, 0, 0, 0}, -- Kazham Earring (teleport to Khazam)
    {17485, 1, 99, ZONE_CAULDRON, 0, 0, 0}, -- Dragon's Claws +1

    -- Cape Terrigan (65 - 75)
    {25760, 1, 99, ZONE_TERRIGAN, 0, 0, 0}, -- Rarab Cap
    {27716, 1, 99, ZONE_TERRIGAN, 0, 0, 0}, -- Green Moogle Masque

    -- Boyahda Tree (65 - 75)
    {28670, 1, 99, ZONE_BOYAHDA, 0, 0, 0}, -- Leafkinyy Shield
    {25639, 1, 99, ZONE_BOYAHDA, 0, 0, 0}, -- Korrigan Masque
    {25715, 1, 99, ZONE_BOYAHDA, 0, 0, 0}, -- Korrigan Suit

    -- Newton Movapolis (65 - 75)
    {436, 1, 99, ZONE_NEWTON, 0, 0, 0}, -- Jeunoan Armoire
    {15929, 1, 99, ZONE_NEWTON, 0, 0, 0}, -- Goblin Belt
    {27715, 1, 99, ZONE_NEWTON, 0, 0, 0}, -- Goblin Masque
    {25648, 1, 99, ZONE_NEWTON, 0, 0, 0}, -- Curudgeon's Helmet
    {27866, 1, 99, ZONE_NEWTON, 0, 0, 0}, -- Goblin Suit

    -- Den of Rancor (65 - 75)
    {25649, 1, 99, ZONE_RANCOR, 0, 0, 0}, -- Gazer's Helmet
    {25650, 1, 99, ZONE_RANCOR, 0, 0, 0}, -- Retching Helmet
    {25726, 1, 99, ZONE_RANCOR, 0, 0, 0}, -- Kupo Suit


    -- Uleguerand Range (65 - 75)
    {415, 1, 99, ZONE_ULEGUERAND, 0, 0, 0}, -- Aldebaran Horn
    {461, 1, 99, ZONE_ULEGUERAND, 0, 0, 0}, -- Buffalo Milk Case
    {10857, 1, 99, ZONE_ULEGUERAND, 0, 0, 0}, -- Snowman Cap
    {11491, 1, 99, ZONE_ULEGUERAND, 0, 0, 0}, -- Snowbunny Hat +1
    {322, 1, 99, ZONE_ULEGUERAND, 0, 0, 0}, -- Horn Trophy

    -- Valley of Sorrows (70 - 75)
    {25648, 1, 99, ZONE_SORROWS, 0, 0, 0}, -- Curudgeon's Helmet
    {27872, 1, 99, ZONE_SORROWS, 0, 0, 0}, -- Purple Spriggan Suit

    -- Al'Taieu (70 - 80)
    {282, 1, 99, ZONE_ALTAIEU, 0, 0, 0}, -- Yovra Replica
    {27803, 1, 99, ZONE_ALTAIEU, 0, 0, 0}, -- Rustic Maillot
    {27804, 1, 99, ZONE_ALTAIEU, 0, 0, 0}, -- Shoal Maillot

    -- Hu'Xzoi (70 - 80)
    {446, 1, 99, ZONE_HUXZOI, 0, 0, 0}, -- Gilded Shelf
    {282, 1, 99, ZONE_HUXZOI, 0, 0, 0}, -- Yovra Replica
    {27873, 1, 99, ZONE_HUXZOI, 0, 0, 0}, -- Red Spriggan Suit

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
    {25657, 1, 99, ZONE_RUAUN, 0, 0, 0}, -- Wyrmking Masque
    {25756, 1, 99, ZONE_RUAUN, 0, 0, 0}, -- Wyrmking Suit

    -- Ru'Hmet (80-85)
};
local mobDrops = {

    -- Antlions
    {18051, 30, 55, 0, 0, 0, {26, 357}}, -- Antlion Sickle
    {15005, 30, 55, 0, 0, 0, {26, 357}}, -- Iron Ram Mufflers
    {15844, 30, 55, 0, 0, 0, {26, 357}}, -- Iron Ram Jack Coat
    {14581, 30, 55, 0, 0, 0, {26, 357}}, -- Iron Ram Chainmail
    {15749, 30, 55, 0, 0, 0, {26, 357}}, -- Iron Ram Sollerets
    {16141, 30, 55, 0, 0, 0, {26, 357}}, -- Iron Ram Helm
    {16172, 30, 55, 0, 0, 0, {26, 357}}, -- Iron Ram Shield
    {16312, 30, 55, 0, 0, 0, {26, 357}}, -- Iron Ram Beeches
    {15009, 70, 99, 0, 0, 0, {26, 357}}, -- Iron Ram Dastanas
    {14588, 70, 99, 0, 0, 0, {26, 357}}, -- Iron Ram Hauberk
    {16146, 70, 99, 0, 0, 0, {26, 357}}, -- Iron Ram Sallet
    {15755, 70, 99, 0, 0, 0, {26, 357}}, -- Iron Ram Greeves
    {16315, 70, 99, 0, 0, 0, {26, 357}}, -- Iron Ram Hose
    {18074, 70, 99, 0, 0, 0, {26, 357}}, -- Iron Ram Lance
    {17958, 70, 99, 0, 0, 0, {26, 357}}, -- Iron Ram Pick

    -- giant bats
    {4128, 1, 20, 0, 0, 1, {46, 47}}, -- ether (x2)
    {13226, 1, 20, 0, 0, 0, {46, 47}}, -- blood stone +1
    {13061, 15, 35, 0, 0, 0, {46, 47}}, -- spike necklace
    {13225, 15, 30, 0, 0, 0, {46, 47}}, -- brave belt
    {4209, 30, 99, 0, 0, 1, {46, 47}}, -- mind potion (x2)
    {4132, 21, 40, 0, 0, 1, {46, 47}}, -- hi-ether (x2)
    {4136, 41, 60, 0, 0, 1, {46, 47}}, -- super-ether (x2)
    {4140, 61, 99, 0, 0, 1, {46, 47}}, -- pr-ether (x2)
    {5339, 20, 99, 0, 0, 2, {46, 47}}, -- bloody bolt quiver (x3)

    -- Bees
    {4156, 1, 20, 0, 0, 0, 48}, -- Bottle of Mulsum
    {5777, 40, 99, 0, 0, 0, 48}, -- Pear Crepe
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
    {5157, 1, 99, 0, 0, 1, 57}, -- Marbled Steak (x2)
    {5925, 65, 99, 0, 0, 0, 57}, -- Charred Salisbury Steak
    {11350, 55, 70, 0, 0, 0, 57}, -- Styrne Byrnie +1
    {11353, 55, 70, 0, 0, 0, 57}, -- Menetrier's Alb +1
    {14554, 70, 99, 0, 0, 0, 57}, -- Corselet
    {14418, 70, 99, 0, 0, 0, 57}, -- Bison Jacket
    {14850, 70, 99, 0, 0, 0, 57}, -- Bison Wristbands
    {15157, 70, 99, 0, 0, 0, 57}, -- Bison Warbonnet
    {15307, 70, 99, 0, 0, 0, 57}, -- Bison Gamashes
    {14319, 70, 99, 0, 0, 0, 57}, -- Bison Kecks

    -- Bugards
    {19018, 30, 50, 0, 0, 0, 58}, -- Bugard Strap +1
    {17702, 30, 50, 0, 0, 0, 58}, -- Shotel +1
    {17714, 60, 99, 0, 0, 0, 58}, -- Macuahuitl +1
    {17712, 65, 80, 0, 0, 0, 58}, -- Kaskara +1
    {15867, 30, 99, 0, 0, 0, 58}, -- Sultan's Belt
    {15869, 30, 99, 0, 0, 0, 58}, -- Pendragon's Belt
    {15870, 30, 99, 0, 0, 0, 58}, -- Maharaja's Belt
    {15868, 30, 99, 0, 0, 0, 58}, -- Czar's Belt

    -- Cockatrice
    {4574, 1, 99, 0, 0, 1, 70}, -- Meat Chiefkabob (x2)
    {4547, 1, 99, 0, 0, 1, 70}, -- Boiled Cockatrice (x2)
    {13638, 35, 44, 0, 0, 0, 70}, -- Gaia Mantle +1
    {13621, 45, 65, 0, 0, 0, 70}, -- Beak Mantle +1
    {13701, 45, 65, 0, 0, 0, 70}, -- Beak Helm +1
    {13739, 45, 65, 0, 0, 0, 70}, -- Beak Jerkin +1
    {13960, 45, 65, 0, 0, 0, 70}, -- Beak Gloves +1
    {14088, 45, 65, 0, 0, 0, 70}, -- Beak Ledelsens +1
    {16264, 45, 65, 0, 0, 0, 70}, -- Beak Necklace +1
    {14213, 45, 65, 0, 0, 0, 70}, -- Beak Trousers +1
    {13799, 45, 65, 0, 0, 0, 70}, -- Gaia Doublet +1
    {16941, 60, 99, 0, 0, 0, 70}, -- Flamberge +1
    {17657, 60, 99, 0, 0, 0, 70}, -- Anelace +1

    -- Coeurls
    {5167, 20, 30, 0, 0, 1, 71}, -- Coeurl Sub +1 (x2)
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
    {4342, 1, 40, 0, 0, 0, {75, 76, 77, 372}}, -- Steamed Crab
    {5544, 1, 25, 0, 0, 0, {75, 76, 77, 372}}, -- Crab Stewpot
    {5545, 26, 45, 0, 0, 0, {75, 76, 77, 372}}, -- Prime Crab Stewpot
    {5546, 46, 99, 0, 0, 0, {75, 76, 77, 372}}, -- Pized Crab Stewpot
    {15838, 15, 30, 0, 0, 0, {75, 76, 77, 372}}, -- Protect Ring
    {13554, 32, 55, 0, 0, 0, {75, 76, 77, 372}}, -- Aegis Ring
    {5175, 45, 99, 0, 0, 1, {75, 76, 77, 372}}, -- Leremieu Taco (x2)
    {5722, 20, 99, 0, 0, 1, {75, 76, 77, 372}}, -- Crab Sushi +1 (x2)

    -- Dhalmels
    {4411, 1, 99, 0, 0, 1, 49}, -- Dhalmel Pie (x2)
    {12334, 1, 25, 0, 0, 0, 49}, -- Strong Shield
    {13811, 1, 25, 0, 0, 0, 49}, -- Rider's Jack Coat
    {14073, 1, 25, 0, 0, 0, 49}, -- Rider's Gloves
    {14174, 1, 25, 0, 0, 0, 49}, -- Rider's Boots
    {14295, 1, 25, 0, 0, 0, 49}, -- Rider's Hose
    {14497, 1, 25, 0, 0, 0, 49}, -- Healing Harness
    {13240, 1, 25, 0, 0, 0, 49}, -- Warrior's Belt +1
    {15486, 1, 35, 0, 0, 0, 49}, -- Breath Mantle
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

    -- Diremites
    {15908, 25, 59, 0, 0, 0, 81}, -- Qiqirn Sash +1
    {15619, 60, 99, 0, 0, 0, 81}, -- Prince's Slops
    {14417, 65, 99, 0, 0, 0, 81}, -- Conte Corazza
    {14849, 65, 99, 0, 0, 0, 81}, -- Conte Manopolas
    {15156, 65, 99, 0, 0, 0, 81}, -- Conte Zucchetto
    {14318, 65, 99, 0, 0, 0, 81}, -- Conte Cosciales
    {15306, 65, 99, 0, 0, 0, 81}, -- Conte Gambieras
    {15394, 65, 99, 0, 0, 0, 81}, -- Hachiman Hakama

    -- Efts
    {14331, 25, 45, 0, 0, 0, 98}, -- Shade Tights +1
    {14433, 25, 45, 0, 0, 0, 98}, -- Shade Harness +1
    {14862, 25, 45, 0, 0, 0, 98}, -- Shade Mittens +1
    {15169, 25, 45, 0, 0, 0, 98}, -- Shade Tiara +1
    {15319, 25, 45 , 0, 0, 0, 98}, -- Shade Leggings +1
    {4144, 46, 99, 0, 0, 1, 98}, -- Hi Elixir (x2)
    {5156, 46, 99, 0, 0, 0, 98}, -- Procupine Pie

    -- Funguar
    {5931, 30, 99, 0, 0, 0, 116}, -- Shimmy Soup
    {5971, 30, 99, 0, 0, 0, 116}, -- Mushroom Paella +1
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

    -- Ghosts
    {15485, 1, 30, 0, 0, 0, 121}, -- Talisman Cape
    {15881, 1, 30, 0, 0, 0, 121}, -- Talisman Obi
    {16078, 1, 30, 0, 0, 0, 121}, -- Blissful Chapeau
    {5644, 1, 30, 0, 0, 0, 121}, -- Jack-o-Pie
    {14331, 25, 40, 0, 0, 0, 121}, -- Shade Tights +1
    {14433, 25, 40, 0, 0, 0, 121}, -- Shade Harness +1
    {14862, 25, 40, 0, 0, 0, 121}, -- Shade Mittens +1
    {15169, 25, 40, 0, 0, 0, 121}, -- Shade Tiara +1
    {15319,251, 40, 0, 0, 0, 121}, -- Shade Leggings +1
    {5339, 1, 59, 0, 0, 2, 121}, -- Bloody Bolt Quiver (x3)
    {17646, 60, 99, 0, 0, 0, 121}, -- Carnage Sword
    {16881, 60, 99, 0, 0, 0, 121}, -- Carnage Lance
    {16827, 60, 99, 0, 0, 0, 121}, -- Carnage Blade
    {16824, 60, 99, 0, 0, 0, 121}, -- Carnage Rapier
    {13773, 60, 99, 0, 0, 0, 121}, -- Carnage Aketon
    {14728, 60, 99, 0, 0, 0, 121}, -- Phantom Earring +1

    -- Goobbues
    {4293, 1, 40, 0, 0, 0, 146}, -- Monastic Sautee
    {5678, 1, 50, 0, 0, 0, 146}, -- Mushroom Salad
    {5931, 40, 99, 0, 0, 0, 146}, -- Shimmy Soup
    {5195, 50, 99, 0, 0, 0, 146}, -- Leremiue Salad
    {5677, 50, 99, 0, 0, 0, 146}, -- Patriarch Saute
    {14585, 1, 30, 0, 0, 0, 146}, -- Fourth Division Tunica
    {15006, 40, 65, 0, 0, 0, 146}, -- Fourth Division Gauntlets
    {15750, 40, 65, 0, 0, 0, 146}, -- Fourth Sabatons
    {14582, 40, 65, 0, 0, 0, 146}, -- Fourth Division Cuirass
    {16142, 40, 65, 0, 0, 0, 146}, -- Fourth Armet
    {16313, 40, 65, 0, 0, 0, 146}, -- Fourth Division Cuisses
    {18494, 65, 99, 0, 0, 0, 146}, -- Fourth Division Toporok
    {18854, 65, 99, 0, 0, 0, 146}, -- Fourth Division Mace
    {18946, 65, 99, 0, 0, 0, 146}, -- Fourth Division Zaghnal
    {16147, 65, 99, 0, 0, 0, 146}, -- Fourth Division Haube
    {15010, 65, 99, 0, 0, 0, 146}, -- Fourth Division Hentzes
    {15756, 65, 99, 0, 0, 0, 146}, -- Fourth Division Schuhs
    {16316, 65, 99, 0, 0, 0, 146}, -- Fourth Division Schoss
    {14589, 65, 99, 0, 0, 0, 146}, -- Fourth Division Brunne


    -- Lizards
    {16386, 1, 15, 0, 0, 0, {174, 438, 97}}, -- Lizard Cesti
    {5645, 1, 15, 0, 0, 1, {174, 438, 97}}, -- Witch Nougat (x2)
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
    {5156, 45, 99, 0, 0, 0, {174, 438, 97}}, -- Porcupine Pie
    {13634, 55, 99, 0, 0, 0, {174, 438, 97}}, -- Empowering Mantle +1

    -- Mandragora
    {4112, 1, 20, 0, 0, 1, 178}, -- Potion (x2)
    {4293, 1, 25, 0, 0, 0, 178}, -- Monastic Sautee
    {4334, 1, 20, 0, 0, 1, 178}, -- Roasted Corn (x2)
    {5678, 1, 50, 0, 0, 0, 178}, -- Mushroom Salad
    {4343, 1, 35, 0, 0, 1, 178}, -- Witch Kabob (x2)
    {4211, 1, 99, 0, 0, 1, 178}, -- Charisma Potion (x2)
    {4116, 21, 40, 0, 0, 1, 178}, -- Hi-Potion (x2)
    {5732, 21, 40, 0, 0, 0, 178}, -- Ratatouille +1
    {4120, 41, 60, 0, 0, 1, 178}, -- X-Potion (x2)
    {5931, 40, 99, 0, 0, 0, 178}, -- Shimmy Soup
    {5195, 50, 99, 0, 0, 0, 178}, -- Leremiue Salad
    {5677, 50, 99, 0, 0, 0, 178}, -- Patriarch Saute
    {4124, 61, 75, 0, 0, 1, 178}, -- Max-Potion (x2)
    {4127, 75, 99, 0, 0, 1, 178}, -- Max-Potion +3 (x2)

    -- Morbols
    {4155, 1, 40, 0, 0, 2, 186}, -- Remedy (x3)
    {4343, 1, 35, 0, 0, 1, 186}, -- Witch Kabob (x2)
    {5732, 1, 99, 0, 0, 1, 186}, -- Ratatouille +1
    {5195, 50, 99, 0, 0, 0, 186}, -- Leremiue Salad
    {5677, 50, 99, 0, 0, 0, 186}, -- Patriarch Saute
    {14586, 1, 35, 0, 0, 0, 186}, -- Cobra Unit Tunica
    {19150, 40, 65, 0, 0, 0, 186}, -- Cobra Unit Claymore
    {15007, 40, 65, 0, 0, 0, 186}, -- Cobra Unit Cuffs
    {15751, 40, 65, 0, 0, 0, 186}, -- Cobra Unit Pigaches
    {16143, 40, 65, 0, 0, 0, 186}, -- Cobra Unit Hat
    {16314, 40, 65, 0, 0, 0, 186}, -- Cobra Unit Slops
    {18756, 65, 99, 0, 0, 0, 186}, -- Cobra Unit Baghnakhs
    {19100, 65, 99, 0, 0, 0, 186}, -- Cobra Unit Knife
    {18728, 65, 99, 0, 0, 0, 186}, -- Cobra Unit Bow
    {16149, 65, 99, 0, 0, 0, 186}, -- Cobra Unit Cloche
    {15011, 65, 99, 0, 0, 0, 186}, -- Cobra Unit Mittens
    {15012, 65, 99, 0, 0, 0, 186}, -- Cobra Unit Gloves
    {16148, 65, 99, 0, 0, 0, 186}, -- Cobra Unit Cap
    {15757, 65, 99, 0, 0, 0, 186}, -- Cobra Unit Leggings
    {15758, 65, 99, 0, 0, 0, 186}, -- Cobra Unit Crackows
    {16317, 65, 99, 0, 0, 0, 186}, -- Cobra Unit Subligar
    {16318, 65, 99, 0, 0, 0, 186}, -- Cobra Unit Trews

    -- Raptors
    {12795, 20, 55, 0, 0, 0, {210, 376, 377}}, -- Dino Gloves
    {17800, 20, 45, 0, 0, 0, {210, 376, 377}}, -- Hosodachi +1
    {16699, 20, 45, 0, 0, 0, {210, 376, 377}}, -- Himantes +1
    {16922, 20, 45, 0, 0, 0, {210, 376, 377}}, -- Sakurafubuki +1
    {12919, 20, 55, 0, 0, 0, {210, 376, 377}}, -- Dino Trousers
    {13049, 20, 55, 0, 0, 0, {210, 376, 377}}, -- Dino Ledelsens
    {13612, 20, 55, 0, 0, 0, {210, 376, 377}}, -- Dino Mantle
    {13727, 20, 55, 0, 0, 0, {210, 376, 377}}, -- Dino Jerkin
    {13835, 20, 55, 0, 0, 0, {210, 376, 377}}, -- Dino Helm
    {16985, 50, 60, 0, 0, 0, {210, 376, 377}}, -- Jindachi +1
    {16939, 50, 60, 0, 0, 0, {210, 376, 377}}, -- Ram-dao +1
    {16923, 50, 60, 0, 0, 0, {210, 376, 377}}, -- Kabutowari +1
    {14990, 40, 65, 0, 0, 0, {210, 376, 377}}, -- Blizzard Glove
    {15651, 40, 65, 0, 0, 0, {210, 376, 377}}, -- Ice Trousers
    {19016, 55, 99, 0, 0, 0, {210, 376, 377}}, -- Raptor Strap +1
    {17803, 55, 70, 0, 0, 0, {210, 376, 377}}, -- Zanbato +1
    {18452, 70, 99, 0, 0, 0, {210, 376, 377}}, -- Rindomaru
    {14197, 70, 99, 0, 0, 0, {210, 376, 377}}, -- Dance Shoes +1

    -- Opo-Opo
    {6064, 32, 99, 0, 0, 1, 188}, -- Queen's Crown (x2)
    {4287, 32, 99, 0, 0, 3, 188}, -- Opo-Opo Tart (x4)
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
    {5195, 40, 99, 0, 0, 0, 216}, -- Leremiue Salad
    {5677, 40, 99, 0, 0, 0, 216}, -- Patriarch Saute
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

    -- Shadows
    {16257, 40, 99, 0, 0, 0, {221, 222, 223}}, -- Ghost Cape
    {14727, 40, 50, 0, 0, 0, {221, 222, 223}}, -- Phantom Earring
    {17722, 55, 99, 0, 0, 0, {221, 222, 223}}, -- Phantom Fleuret
    {18140, 55, 99, 0, 0, 0, {221, 222, 223}}, -- Phantom Tathlum

    -- Skeleton
    {12788, 1, 25, 0, 0, 0, 227}, -- Bone Mittens +1
    {12912, 1, 25, 0, 0, 0, 227}, -- Bone Subligar +1
    {13042, 1, 25, 0, 0, 0, 227}, -- Bone Leggings +1
    {13362, 1, 25, 0, 0, 0, 227}, -- Bone Earring +1
    {13500, 1, 25, 0, 0, 0, 227}, -- Bone Ring +1
    {13826, 1, 25, 0, 0, 0, 227}, -- Bone Mask +1
    {17611, 1, 25, 0, 0, 0, 227}, -- Bone Knife +1
    {17033, 1, 25, 0, 0, 0, 227}, -- Bone Cudgel +1
    {16666, 1, 25, 0, 0, 0, 227}, -- Bone Axe +1
    {16668, 1, 25, 0, 0, 0, 227}, -- Bone Pick +1
    {17477, 1, 25, 0, 0, 0, 227}, -- Bone Patas +1
    {16781, 15, 30, 0, 0, 0, 227}, -- Scythe +1
    {13061, 25, 40, 0, 0, 0, 227}, -- Spike Necklace
    {14331, 25, 40, 0, 0, 0, 227}, -- Shade Tights +1
    {14433, 25, 40, 0, 0, 0, 227}, -- Shade Harness +1
    {14862, 25, 40, 0, 0, 0, 227}, -- Shade Mittens +1
    {15169, 25, 40, 0, 0, 0, 227}, -- Shade Tiara +1
    {15319, 25, 40, 0, 0, 0, 227}, -- Shade Leggings +1
    {16782, 35, 55, 0, 0, 0, 227}, -- Mythril Scythe +1
    {14710, 40, 60, 0, 0, 0, 227}, -- Mana Earring +1
    {16795, 45, 65, 0, 0, 0, 227}, -- Bone Scythe +1
    {14744, 50, 99, 0, 0, 0, 227}, -- Undead Earring
    {13369, 55, 99, 0, 0, 0, 227}, -- Spike Earring
    {16790, 65, 75, 0, 0, 0, 227}, -- Darksteel Scythe +1
    {18047, 65, 99, 0, 0, 0, 227}, -- Havoc Scythe +1
    {16791, 76, 99, 0, 0, 0, 227}, -- Death Scythe +1

    -- Sheep
    {4437, 1, 29, 0, 0, 0, 226}, -- Roast Mutton
    {4435, 1, 29, 0, 0, 0, 226}, -- Juicy Mutton
    {4438, 29, 99, 0, 0, 1, 226}, -- Mutton Enchilada (x2)
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
    {5766, 20, 99, 0, 0, 0, 55}, -- Butter Crepe
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
    {4564, 61, 99, 0, 0, 0, 55}, -- Royal Omelette
    {18169, 70, 99, 0, 0, 0, 55}, -- Tsar's Egg

    -- Manticores
    {17636, 40, 65, 0, 0, 0, 179}, -- Jagdplaute +1
    {13239, 40, 65, 0, 0, 0, 179}, -- Kaiser Belt
    {13907, 70, 74, 0, 0, 0, 179}, -- Ogre Mask +1
    {14057, 70, 74, 0, 0, 0, 179}, -- Ogre Gloves +1
    {14159, 70, 74, 0, 0, 0, 179}, -- Ogre Ledelsens +1
    {14279, 70, 74, 0, 0, 0, 179}, -- Ogre Trousers +1
    {14366, 70, 74, 0, 0, 0, 179}, -- Ogre Jerkin +1
    {15190, 75, 99, 0, 0, 0, 179}, -- Wise Cap
    {14440, 75, 99, 0, 0, 0, 179}, -- Chasuble
    {14880, 75, 99, 0, 0, 0, 179}, -- Wise Gloves
    {14396, 75, 99, 0, 0, 0, 179}, -- Wise Braconi
    {15334, 75, 99, 0, 0, 0, 179}, -- Wise Pigaches
    {14566, 75, 99, 0, 0, 0, 179}, -- Khimaira Jacket
    {14981, 75, 99, 0, 0, 0, 179}, -- Khimaira Wristbands
    {15645, 75, 99, 0, 0, 0, 179}, -- Khimaira Kecks
    {15731, 75, 99, 0, 0, 0, 179}, -- Khimaira Gamashes
    {16104, 75, 99, 0, 0, 0, 179}, -- Khimaira Bonnet
    {18030, 75, 99, 0, 0, 0, 179}, -- Khimaira Jambiya

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

    -- Treants
    {17040, 20, 99, 0, 0, 0, 245}, -- Warp Cudgel
    {17119, 1, 29, 0, 0, 0, 245}, -- Elm Pole +1
    {17126, 1, 29, 0, 0, 0, 245}, -- Elm Staff +1
    {12331, 30, 50, 0, 0, 0, 245}, -- Oak Shield +1
    {5753, 30, 99, 0, 0, 0, 245}, -- Pot-au-feu +1
    {17127, 30, 50, 0, 0, 0, 245}, -- Oak Staff +1
    {17142, 30, 50, 0, 0, 0, 245}, -- Oak Cudgel +1
    {5195, 30, 99, 0, 0, 0, 245}, -- Leremiue Salad
    {5677, 30, 99, 0, 0, 0, 245}, -- Patriarch Saute
    {17173, 45, 60, 0, 0, 0, 245}, -- War Bow +1
    {17562, 50, 75, 0, 0, 0, 245}, -- Revenging Staff +1
    {17433, 50, 75, 0, 0, 0, 245}, -- Mythic Wand +1
    {17526, 50, 75, 0, 0, 0, 245}, -- Mythic Pole +1
    {17834, 50, 75, 0, 0, 0, 245}, -- Mythic Harp +1
    {17545, 50, 75, 0, 0, 0, 245}, -- Fire Staff
    {17547, 50, 75, 0, 0, 0, 245}, -- Ice Staff
    {17549, 50, 75, 0, 0, 0, 245}, -- Wind Staff
    {17551, 50, 75, 0, 0, 0, 245}, -- Earth Staff
    {17553, 50, 75, 0, 0, 0, 245}, -- Thunder Staff
    {17555, 50, 75, 0, 0, 0, 245}, -- Water Staff
    {17557, 50, 75, 0, 0, 0, 245}, -- Light Staff
    {17559, 50, 75, 0, 0, 0, 245}, -- Dark Staff

    -- Rabbits
    {4349, 1, 99, 0, 0, 0, 206}, -- Bunny Ball
    {5554, 1, 99, 0, 0, 0, 206}, -- Squirrel's Delight
    {17467, 1, 20, 0, 0, 0, 206}, -- Cat Baghnakhs +1
    {13599, 1, 20, 0, 0, 0, 206}, -- Rabbit Mantle +1
    {13631, 20, 32, 0, 0, 0, 206}, -- Nomad's Mantle
    {13632, 33, 50, 0, 0, 0, {206, 404, 405}}, -- Nomad's Mantle +1
    {11542, 65, 99, 0, 0, 0, {206, 404, 405}}, -- Kinesis Mantle +1

    -- Rams
    {13502, 1, 20, 0, 0, 0, 208}, -- Horn Ring +1
    {16666, 1, 20, 0, 0, 0, 208}, -- Bone Axe +1
    {17410, 1, 20, 0, 0, 0, 208}, -- Bone Rod +1
    {13828, 1, 20, 0, 0, 0, 208}, -- Horn Hairpin +1
    {15487, 21, 99, 0, 0, 0, 208}, -- High Breath Mantle

    -- Kindred
    {18376, 25, 99, 0, 0, 0, 169}, -- Falx +1

};

local mobDrops2 = {
    -- Crawlers
    {4552, 1, 40, 0, 0, 1, 79}, -- Herb Crawler Eggs (x2)
    {5643, 1, 99, 0, 0, 0, 79}, -- Cibarious Cilbir
    {13833, 1, 30, 0, 0, 0, 79}, -- Noble's Ribbon +1
    {13953, 1, 30, 0, 0, 0, 79}, -- White Mitts +1
    {12917, 1, 30, 0, 0, 0, 79}, -- Mage's Slacks
    {13048, 1, 30, 0, 0, 0, 79}, -- Mage's Sandals
    {13725, 1, 30, 0, 0, 0, 79}, -- Mage's Tunic
    {13610, 25, 45, 0, 0, 0, 79}, -- Black Cape +1
    {13618, 25, 45, 0, 0, 0, 79}, -- White Cape +1
    {14491, 25, 45, 0, 0, 0, 79}, -- Mana Cloak
    {13726, 31, 45, 0, 0, 0, 79}, -- Mage's Robe
    {12793, 31, 45, 0, 0, 0, 79}, -- Mage's Cuffs
    {11348, 31, 50, 0, 0, 0, 79}, -- Salutary Robe +1
    {13611, 38, 60, 0, 0, 0, 79}, -- Red Cape +1
    {14492, 40, 99, 0, 0, 0, 79}, -- High Mana Cloak
    {14543, 46, 65, 0, 0, 0, 79}, -- Magi Coat
    {14956, 46, 65, 0, 0, 0, 79}, -- Magi Cuffs
    {15621, 46, 65, 0, 0, 0, 79}, -- Magi Slops
    {15707, 46, 65, 0, 0, 0, 79}, -- Magi Pigaches
    {16080, 46, 65, 0, 0, 0, 79}, -- Magi Hat
    {13579, 46, 65, 0, 0, 0, 79}, -- Jester's Cape
    {13851, 50, 99, 0, 0, 0, 79}, -- Silk Headband +1
    {13748, 50, 99, 0, 0, 0, 79}, -- Vermillion Cloak
    {12628, 50, 99, 0, 0, 0, 79}, -- Battle Jupon
    {13997, 50, 99, 0, 0, 0, 79}, -- Battle Bracers +1
    {11540, 50, 99, 0, 0, 0, 79}, -- Accura Cape +1
    {13627, 60, 99, 0, 0, 0, 79}, -- Prism Cape

    -- Flies
    {4213, 20, 99, 0, 0, 1, {113, 374, 375}}, -- Icarus Wing (x2)
    {13322, 28, 40, 0, 0, 0, {113, 374, 375}}, -- Wing Earring
    {15170, 28, 50, 0, 0, 0, {113, 374, 375}}, -- Blink Band
    {13144, 35, 99, 0, 0, 0, {113, 374, 375}}, -- Wing Gorget
    {14989, 40, 60, 0, 0, 0, {113, 374, 375}}, -- Aero Mufflers
    {16010, 55, 99, 0, 0, 0, {113, 374, 375}}, -- Pennon Earring +1
    {17730, 60, 99, 0, 0, 0, {113, 374, 375}}, -- Insect Slayer
    {15827, 68, 99, 0, 0, 0, {113, 374, 375}}, -- Insect Ring

    -- Flytrap
    {5646, 1, 28, 0, 0, 3, 114}, -- Bloody Chocolate (x4)
    {5551, 29, 50, 0, 0, 0, 114}, -- Sylvan Excursion

    -- Hecteyes
    {15559, 15, 30, 0, 0, 0, 139}, -- Vision Ring
    {12502, 1, 30, 0, 0, 0, 139}, -- Compound Eye Circlet
    {4205, 1, 99, 0, 0, 1, 139}, -- Agility Potion (x2)
    {5628, 30, 99, 0, 0, 0, 139}, -- Silken Smile
    {4340, 1, 99, 0, 0, 0, 139}, -- Optical Soup
    {5180, 1, 99, 0, 0, 0, 139}, -- Sophic Stew

    -- Dragons
    {4350, 40, 99, 0, 0, 0, 87}, -- Dragon Steak
    {4549, 40, 99, 0, 0, 0, 87}, -- Dragon Soup

    -- Wyverns
    {15812, 50, 75, 0, 0, 0, 266}, -- Wivre Ring +1
    {14737, 50, 60, 0, 0, 0, 266}, -- Wyvern Earring
    {13672, 50, 60, 0, 0, 0, 266}, -- Wyvern Mantle
    {12402, 50, 60, 0, 0, 0, 266}, -- Wyvern Targe
    {17485, 50, 60, 0, 0, 0, 266}, -- Dragon Claws +1
    {16171, 50, 75, 0, 0, 0, 266}, -- Wivre Shield +1
    {16131, 55, 99, 0, 0, 0, 266}, -- Wivre Mask +1
    {13860, 55, 99, 0, 0, 0, 266}, -- Dragon Mask +1
    {13991, 55, 99, 0, 0, 0, 266}, -- Dragon Finger Gauntlets +1
    {14231, 55, 99, 0, 0, 0, 266}, -- Dragon Cuisses +1
    {13762, 55, 99, 0, 0, 0, 266}, -- Dragon Mail +1
    {14107, 55, 99, 0, 0, 0, 266}, -- Dragon Greaves +1
    {14627, 70, 99, 0, 0, 0, 266}, -- Dragon Ring +1
    {13937, 70, 99, 0, 0, 0, 266}, -- Dragon Cap +1
    {14187, 70, 99, 0, 0, 0, 266}, -- Dragon Leggings +1
    {14306, 70, 99, 0, 0, 0, 266}, -- Dragon Subligar +1
    {14390, 70, 99, 0, 0, 0, 266}, -- Dragon Harness +1
    {14824, 70, 99, 0, 0, 0, 266}, -- Dragon Mittens +1
    {16266, 70, 99, 0, 0, 0, 266}, -- Wivre Gorget +1
    {16873, 70, 99, 0, 0, 0, 266}, -- Wyvern Spear +1
    {13921, 70, 99, 0, 0, 0, 266}, -- Wyvern Helm +1
    {14405, 70, 99, 0, 0, 0, 266}, -- Wyvern Helm +1

    -- Goblins
    {4458, 1, 20, 0, 0, 2, {327, 373, 133}}, -- Hobgoblin Bread (x3)
    {4543, 1, 29, 0, 0, 0, {327, 373, 133}}, -- Goblin Mushpot
    {4320, 1, 29, 0, 0, 0, {327, 373, 133}}, -- Apple Pie +1
    {4532, 30, 45, 0, 0, 0, {327, 373, 133}}, -- Melon Pie +1
    {4339, 20, 45, 0, 0, 0, {327, 373, 133}}, -- Rolanberry Pie +1
    {4270, 20, 45, 0, 0, 2, {327, 373, 133}}, -- Sweet Rice Cake (x3)
    {5774, 30, 99, 0, 0, 0, {327, 373, 133}}, -- Crepe Forestiere
    {4465, 30, 99, 0, 0, 0, {327, 373, 133}}, -- Goblin Stew
    {15559, 25, 99, 0, 0, 1, {327, 373, 133}}, -- Hobgoblin Pie (x2)

    -- Hippogryphs
    {14572, 49, 70, 0, 0, 0, {140, 141}}, -- Tabin Jupon +1
    {14994, 49, 70, 0, 0, 0, {140, 141}}, -- Tabin Bracers +1
    {15654, 49, 70, 0, 0, 0, {140, 141}}, -- Tabin Hose +1
    {15739, 49, 70, 0, 0, 0, {140, 141}}, -- Tabin Boots +1
    {16112, 49, 70, 0, 0, 0, {140, 141}}, -- Tabin Beret +1
    {15059, 49, 70, 0, 0, 0, {140, 141}}, -- Finesse Gloves +1

    -- Orcs
    {5591, 1, 30, 0, 0, 1, 189}, -- Balik Sandvici +1 (x2)
    {5751, 30, 50, 0, 0, 0, 189}, -- Goulash +1
    {5601, 20, 50, 0, 0, 1, 189}, -- Balik Sis +1 (x2)
    {5999, 20, 50, 0, 0, 0, 189}, -- Adoulinian Soup +1
    {5589, 30, 50, 0, 0, 1, 189}, -- Karni Yarik +1 (x2)

    -- Yagudo
    {5547, 1, 25, 0, 0, 0, 270}, -- Beef Stewpot
    {5548, 26, 40, 0, 0, 0, 270}, -- Prime Beef Stewpot
    {5549, 41, 99, 0, 0, 0, 270}, -- Prized Beef Stewpot
    {4296, 1, 30, 0, 0, 0, 270}, -- Green Curry
    {4517, 30, 55, 0, 0, 0, 270}, -- Yellow
    {4297, 45, 99, 0, 0, 0, 270}, -- Black Curry
    {4298, 56, 99, 0, 0, 0, 270}, -- Red Curry

    -- Quadav
    {4588, 1, 30, 0, 0, 1, {200,201, 202}}, -- Broiled Eel (x2)
    {4540, 1, 30, 0, 0, 1, {200,201, 202}}, -- Boiled Tuna Head
    {4268, 20, 50, 0, 0, 0, {200,201, 202}}, -- Sea Spray Risotto
    {4285, 35, 65, 0, 0, 0, {200,201, 202}}, -- Ocean Soup

    -- Leeches
    {4341, 1, 25, 0, 0, 0, {172, 369}}, -- Sunset Soup
    {4337, 1, 25, 0, 0, 0, {172, 369}}, -- Stamina Soup
    {5671, 50, 99, 0, 0, 0, {172, 369}}, -- Loach Soup
    {13226, 1, 25, 0, 0, 0, {172, 369}}, -- Blood Stone +1
    {18599, 1, 30, 0, 0, 0, {172, 369}}, -- Pestle
    {16494, 10, 30, 0, 0, 0, {172, 369}}, -- Corrosive Kukri
    {17487, 10, 30, 0, 0, 0, {172, 369}}, -- Corrosive Claws
    {17606, 10, 30, 0, 0, 0, {172, 369}}, -- Corrosive Dagger
    {17607, 10, 30, 0, 0, 0, {172, 369}}, -- Corrosive Baselard
    {17608, 10, 30, 0, 0, 0, {172, 369}}, -- Corrosive Knife
    {5339, 15, 60, 0, 0, 2, {172, 369}}, -- Bloody Bolt Quiver (x3)
    {14723, 28, 45, 0, 0, 0, {172, 369}}, -- Pigeon Earring +1
    {17072, 40, 60, 0, 0, 0, {172, 369}}, -- Lilith's Rod
    {17779, 40, 60, 0, 0, 0, {172, 369}}, -- Muketsu +1
    {17718, 50, 99, 0, 0, 0, 121}, -- Leech Scimitar
    {16580, 50, 99, 0, 0, 0, 121}, -- Bloodsword
    {17562, 50, 99, 0, 0, 0, 121}, -- Revenging Staff +1
    {17574, 55, 99, 0, 0, 0, 121}, -- Archalaus's Pole
    {17646, 60, 99, 0, 0, 0, {172, 369}}, -- Carnage Sword
    {16881, 60, 99, 0, 0, 0, {172, 369}}, -- Carnage Lance
    {16827, 60, 99, 0, 0, 0, {172, 369}}, -- Carnage Blade
    {16824, 60, 99, 0, 0, 0, {172, 369}}, -- Carnage Rapier
    {13773, 60, 99, 0, 0, 0, {172, 369}}, -- Carnage Aketon
    {17576, 65, 99, 0, 0, 0, {172, 369}}, -- Grim Staff

    -- Slimes
    {28510, 1, 25, 0, 0, 0, {228, 229, 230, 66}}, -- Metal Slime Earring
    {28651, 1, 25, 0, 0, 0, {228, 229, 230, 66}}, -- Metal Slime Shield
    {5553, 1, 50, 0, 0, 0, {228, 229, 230, 66}}, -- Dusky Indulgence
    {5578, 1, 50, 0, 0, 0, {228, 229, 230, 66}}, -- Sutlac +1
    {5158, 1, 99, 0, 0, 0, {228, 229, 230, 66}}, -- Vermillion Jelly
    {5628, 30, 99, 0, 0, 0, {228, 229, 230, 66}}, -- Silken Smile
    {4165, 1, 99, 0, 0, 5, {228, 229, 230, 66}}, -- Silent Oil (x6)

    -- Pugils
    {4440, 1, 20, 0, 0, 0, 197}, -- Whitefish Stew
    {4346, 21, 40, 0, 0, 0, 197}, -- Bass Meuniere +1
    {4587, 21, 40, 0, 0, 1, 197}, -- Broiled Trout (x2)
    {5163, 41, 99, 0, 0, 0, 197}, -- Sole Sushi +1
    {5177, 51, 99, 0, 0, 0, 197}, -- Bream Sushi +1
    {5666, 60, 99, 0, 0, 0, 197}, -- Fin Sushi +1

    -- Worms
    {4592, 1, 20, 0, 0, 0, 258}, -- Wisdom Soup
    {4327, 1, 20, 0, 0, 0, 258}, -- Emerald Soup
    {5216, 10, 30, 0, 0, 0, 258}, -- Tentacle Sushi +1
    {4592, 21, 50, 0, 0, 0, 258}, -- Sophic Stew
    {6064, 20, 99, 0, 0, 0, 258}, -- Queen's Crown
    {5200, 20, 99, 0, 0, 1, 258}, -- Pescatora +1 (x2)
    {5199, 20, 99, 0, 0, 1, 258}, -- Carbonara +1 (x2)
    {5212, 35, 99, 0, 0, 1, 258}, -- Arrabbiata +1 (x2)

    -- Sabotender
    {14746, 35, 50, 0, 0, 0, 212}, -- Evasion Earring
    {13885, 35, 50, 0, 0, 0, 212}, -- Juggler's Headband
    {13616, 35, 50, 0, 0, 0, 212}, -- Dodge Cape
    {15974, 48, 65, 0, 0, 0, 212}, -- Velocity Earring
    {11542, 48, 65, 0, 0, 0, 212}, -- Kinesis Mantle +1
    {15524, 50, 65, 0, 0, 0, 212}, -- Fortified Chain
    {11391, 55, 75, 0, 0, 0, 212}, -- Emissary Boots
    {14761, 55, 75, 0, 0, 0, 212}, -- Elusive Earring
    {13148, 65, 99, 0, 0, 0, 212}, -- Evasion Torque
    {14197, 65, 99, 0, 0, 0, 212}, -- Dance Shoes +1

    -- Sea Monks
    {14703, 20, 40, 0, 0, 0, {218, 219}}, -- Loyalty Earring +1
    {13536, 30, 50, 0, 0, 0, {218, 219}}, -- Loyalty Ring +1
    {5216, 1, 39, 0, 0, 0, {218, 219}}, -- Tentacle Sushi +1
    {5611, 1, 39, 0, 0, 0, {218, 219}}, -- Angler Stewpot
    {5611, 40, 59, 0, 0, 0, {218, 219}}, -- Prime Angler Stewpot
    {5613, 60, 99, 0, 0, 0, {218, 219}}, -- Prized Angler Stewpot
    {5694, 20, 50, 0, 0, 1, {218, 219}}, -- Octopus Sushi +1 (x2)
    {4575, 30, 50, 0, 0, 1, {218, 219}}, -- Fish Chiefkabob (x2)
    {4554, 45, 99, 0, 0, 0, {218, 219}}, -- Shallops Tropicale
    {4561, 45, 99, 0, 0, 0, {218, 219}}, -- Seafood Stew
    {13418, 55, 99, 0, 0, 0, {218, 219}}, -- Eris's Earring +1

    -- Spiders
    {13276, 55, 99, 0, 0, 0, {235, 370}}, -- Arachne Obi +1
    {13235, 30, 54, 0, 0, 0, {235, 370}}, -- Prism Obi
    {13815, 30, 65, 0, 0, 0, {235, 370}}, -- Penance Robe
    {13940, 30, 65, 0, 0, 0, {235, 370}}, -- Penance Hat
    {14190, 30, 65, 0, 0, 0, {235, 370}}, -- Penance Sabots
    {14311, 30, 65, 0, 0, 0, {235, 370}}, -- Penance Slops
    {14827, 30, 65, 0, 0, 0, {235, 370}}, -- Penance Cuffs
    {13274, 35, 65, 0, 0, 0, {235, 370}}, -- Twinthread Obi +1
    {13770, 55, 80, 0, 0, 0, {235, 370}}, -- War Shinobi Gi +1
    {13188, 55, 70, 0, 0, 0, {235, 370}}, -- Star Sash
    {821, 70, 99, 0, 0, 0, {235, 370}}, -- Rainbow Thread
    {1294, 70, 99, 0, 0, 1, {235, 370}}, -- Arachne Thread (x2)
    {13998, 70, 99, 0, 0, 0, {235, 370}}, -- War Gloves +1
    {13771, 70, 99, 0, 0, 0, {235, 370}}, -- War Aketon +1
    {13867, 70, 99, 0, 0, 0, {235, 370}}, -- War Beret +1
    {14113, 70, 99, 0, 0, 0, {235, 370}}, -- War Boots +1
    {14238, 70, 99, 0, 0, 0, {235, 370}}, -- War Brais +1
    {13657, 70, 99, 0, 0, 0, {235, 370}}, -- Mahatma Cape
    {13930, 70, 99, 0, 0, 0, {235, 370}}, -- Mahatma Hat
    {14079, 70, 99, 0, 0, 0, {235, 370}}, -- Mahatma Cuffs
    {14183, 70, 99, 0, 0, 0, {235, 370}}, -- Mahatma Pigache
    {14302, 70, 99, 0, 0, 0, {235, 370}}, -- Mahatma Slops
    {14381, 70, 99, 0, 0, 0, {235, 370}}, -- Mahatma Houppelande
    {14540, 70, 99, 0, 0, 0, {235, 370}}, -- Kydogi +1
    {19242, 70, 99, 0, 0, 0, {235, 370}}, -- Aumoniere +1
    {15892, 70, 99, 0, 0, 0, {235, 370}}, -- Moon Sash

    -- Ahriman
    {4164, 1, 99, 0, 0, 5, 4}, -- Prism Powder (x6)

    -- Tauri
    {5255, 40, 99, 0, 0, 1, 240}, -- Hyper Ether (x2)
    {16837, 40, 55, 0, 0, 1, 240}, -- Trident
    {16877, 40, 55, 0, 0, 1, 240}, -- Mythril Lance +1
    {16872, 40, 55, 0, 0, 1, 240}, -- Kamayari +1
    {16880, 45, 60, 0, 0, 1, 240}, -- Holy Lance +1
    {16889, 50, 65, 0, 0, 0, 240}, -- Battle Fork +1
    {16874, 50, 65, 0, 0, 0, 240}, -- Partisan +1
    {16878, 50, 65, 0, 0, 0, 240}, -- Darksteel Lance +1
    {16875, 60, 99, 0, 0, 0, 240}, -- Golden Spear +1
    {18083, 60, 99, 0, 0, 0, 240}, -- Barcha +1
    {17206, 60, 99, 0, 0, 0, 240}, -- Gendawa +1
    {16895, 75, 99, 0, 0, 0, 240}, -- Ice Lance +1
    {18084, 75, 99, 0, 0, 0, 240}, -- Rune Halberd

    -- Bombs
    {13506, 1, 30, 0, 0, 0, 56}, -- Bomb Ring
    {14593, 1, 30, 0, 0, 0, 56}, -- Courage Ring +1
    {14689, 1, 30, 0, 0, 0, 56}, -- Courage Earring +1
    {15558, 1, 30, 0, 0, 0, 56}, -- Courage Earring +1
    {14601, 30, 50, 0, 0, 0, 56}, -- Puissance Ring +1
    {14697, 30, 50, 0, 0, 0, 56}, -- Puissance Earring +1
    {14609, 50, 69, 0, 0, 0, 56}, -- Victory Ring +1
    {14705, 50, 69, 0, 0, 0, 56}, -- Victory Earring +1
    {14618, 70, 99, 0, 0, 0, 56}, -- Triupmh Ring +1
    {14630, 70, 99, 0, 0, 0, 56}, -- Flame Ring
    {14713, 70, 99, 0, 0, 0, 56}, -- Triumph Earring +1

    -- Evil Weapons
    {16634, 20, 30, 0, 0, 0, 110}, -- Broadsword +1
    {17740, 20, 30, 0, 0, 0, 110}, -- Steel Kilij +1
    {16816, 30, 40, 0, 0, 0, 110}, -- Holy Sword +1
    {16635, 30, 40, 0, 0, 0, 110}, -- Mythril Sword +1
    {16826, 35, 45, 0, 0, 0, 110}, -- Divine Sword +1
    {17702, 40, 50, 0, 0, 0, 110}, -- Shotel +1
    {16533, 40, 55, 0, 0, 0, 110}, -- Ancient Sword
    {16817, 45, 60, 0, 0, 0, 110}, -- Holy Degen +1
    {16822, 45, 60, 0, 0, 0, 110}, -- Crimson Blade
    {17726, 45, 60, 0, 0, 0, 110}, -- Immortal's Shotel
    {17663, 55, 65, 0, 0, 0, 110}, -- Kilij +1
    {16813, 55, 65, 0, 0, 0, 110}, -- Schlaeger +1
    {17642, 55, 65, 0, 0, 0, 110}, -- Hanger +1
    {16618, 55, 65, 0, 0, 0, 110}, -- Mailbreaker +1
    {17633, 60, 70, 0, 0, 0, 110}, -- Rapier +1
    {17636, 60, 70, 0, 0, 0, 110}, -- Jagdplaute +1
    {17632, 60, 70, 0, 0, 0, 110}, -- Colichemarde +1
    {17725, 60, 70, 0, 0, 0, 110}, -- Darksteel Kilij +1
    {17730, 60, 99, 0, 0, 0, 110}, -- Insect Slayer
    {17732, 60, 99, 0, 0, 0, 110}, -- Marine
    {17635, 60, 99, 0, 0, 0, 110}, -- Schwert +1
    {16619, 65, 99, 0, 0, 0, 110}, -- Epee +1
    {16563, 65, 99, 0, 0, 0, 110}, -- Rune Blade
    {17700, 65, 99, 0, 0, 0, 110}, -- Durandal
    {17657, 70, 99, 0, 0, 0, 110}, -- Anelace +1
    {17755, 70, 99, 0, 0, 0, 110}, -- Beast Slayer
    {17736, 70, 99, 0, 0, 0, 110}, -- Devil Slayer
    {17734, 70, 99, 0, 0, 0, 110}, -- Wyrm Slayer

    -- Hounds
    {13685, 10, 50, 0, 0, 0, {142, 143}}, -- Invisible Mantle
    {11531, 20, 50, 0, 0, 0, {142, 143}}, -- Fidelity Mantle
    {13609, 10, 40, 0, 0, 0, {142, 143}}, -- Wolf Mantle +1
    {13070, 10, 40, 0, 0, 0, {142, 143}}, -- Wolf Gorget +1
    {15802, 31, 49, 0, 0, 0, {142, 143}}, -- Feral Ring
    {13369, 50, 99, 0, 0, 0, {142, 143}}, -- Spike Earring
    {17490, 50, 99, 0, 0, 0, {142, 143}}, -- Feral Fangs
    {13602, 50, 99, 0, 0, 0, {142, 143}}, -- Feral Mantle
    {13919, 50, 99, 0, 0, 0, {142, 143}}, -- Feral Mask
    {13861, 50, 99, 0, 0, 0, {142, 143}}, -- Feral Helm
    {13992, 50, 99, 0, 0, 0, {142, 143}}, -- Feral Gloves
    {14232, 50, 99, 0, 0, 0, {142, 143}}, -- Feral Trousers
    {13763, 50, 99, 0, 0, 0, {142, 143}}, -- Feral Jerkin

    -- Uragnite
    {4267, 1, 99, 0, 0, 1, 251}, -- Buttered Nebimonite (x2)
    {1449, 1, 99, 0, 0, 1, 251}, -- Tukuku Whiteshell (x3)
    {12350, 30, 99, 0, 0, 1, 251}, -- Strike Shield
    {12328, 30, 99, 0, 0, 1, 251}, -- Heater Shield +1
    {15434, 30, 99, 0, 0, 1, 251}, -- Vanguard Belt
    {13710, 30, 99, 0, 0, 1, 251}, -- Brigandine Armor +1
    {14605, 30, 99, 0, 0, 1, 251}, -- Verve Ring +1
    {14768, 30, 99, 0, 0, 1, 251}, -- Buckler Earring
    {14750, 30, 99, 0, 0, 1, 251}, -- Aquan Earring

    -- Snoll
    {14602, 40, 53, 0, 0, 1, 232}, -- Wisdom Ring +1
    {14698, 40, 53, 0, 0, 1, 232}, -- Wisdom Earring +1
    {14610, 54, 70, 0, 0, 1, 232}, -- Genius Ring +1
    {14706, 54, 70, 0, 0, 1, 232}, -- Genius Earring +1
    {14619, 70, 99, 0, 0, 1, 232}, -- Omniscient Ring +1
    {14714, 70, 99, 0, 0, 1, 232}, -- Omniscient Earring +1
    {14640, 75, 99, 0, 0, 1, 232}, -- Snow Ring
    {5555, 40, 60, 0, 0, 1, 232}, -- Flurry Courante (x2)
    {5556, 50, 60, 0, 0, 1, 232}, -- Seraph's Kiss (x2)
    {6225, 60, 99, 0, 0, 1, 232}, -- Cyclical Coalescence (x2)
}


local function addValidDrops(level, family, zoneid, job, potentialDrops, dropTable)
    for i,v in pairs(dropTable) do
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
                table.insert(potentialDrops, {v[1], v[6]});
            end
        end
    end
end


local function getDropList(mob, player)
    local zoneid = player:getZoneID();
    local family = mob:getFamily();
    local level = mob:getMainLvl();
    local job = mob:getMainJob();

    local dropList = {}
    addValidDrops(level, family, zoneid, job, dropList, commonRewards);
    addValidDrops(level, family, zoneid, job, dropList, zoneRewards);
    addValidDrops(level, family, zoneid, job, dropList, mobDrops);
    addValidDrops(level, family, zoneid, job, dropList, mobDrops2);


--    for i,v in pairs(commonRewards) do
--        if (level >= v[2] and level <= v[3]) then
--            local sameJob = job == v[5];
--            local sameZone = zoneid == v[4];
--            local sameFamily = false;
--            local noRequirements = v[4] == 0 and v[7] == 0 and v[5] == 0;
--            if (type(v[7]) == "table") then
--                for ifamindex, ifamtype in pairs(v[7]) do
--                    if (family == ifamtype) then sameFamily = true; break; end
--                end
--            else
--                sameFamily = family == v[7];
--            end
--
--            -- Add to drop list if family, zoneid, or job matches requirements (or if there are no requirements at all)
--            if (sameJob or sameZone or sameFamily or noRequirements) then
--                table.insert(dropList, {v[1], v[6]});
--            end
--        end
--    end

    return dropList
end

local function dropReward(mob, player)
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

function onMobDeathEx(mob, player, isKiller, isWeaponSkillKill)

    if (not player:isPC()) then return; end;

    local level = player:getMainLvl();
    local diff = mob:getMainLvl() - level;
    local isHot = isHotspot(player:getZoneID());



    -- check to see if temp items dropped
    local tempChance = 10 + diff * 3.5;
    if (diff >= 4) then tempChance = tempChance + 1.5 * diff; end;
    if (tempChance < 0) then tempChance = 1 end;
--    diff = (diff * diff) / 2.5;
    if (tempChance <= 0) then tempChance = 1; end


    if (isHot) then tempChance = tempChance * 1.33; end;

    if (math.random(0, 100) <= tempChance) then
        rewardTemporaryItem(player);
    end

    if (mob:getMobMod(MOBMOD_HARD_MODE) > 0) then
        tempChance = tempChance + 10;
        if (math.random(0, 100) < tempChance) then
            rewardTemporaryItem(player);
        end

        if (math.random(0, 100) < tempChance) then
            rewardTemporaryItem(player);
        end

        if (math.random(0, 100) < tempChance) then
            rewardTemporaryItem(player);
        end
    end

    -- Give a special reward based on location and mob
    local rewardChance = 8;
    if (diff > 0) then rewardChance = rewardChance + diff * 4 else rewardChance = rewardChance + diff end;
    if (rewardChance < 0) then rewardChance = 1 end;
    rewardChance = rewardChance * (1 + player:getMod(MOD_TREASURE_HUNTER) * 0.15);

    if (isHot) then rewardChance = rewardChance * 1.33; end;

    if (math.random(0, 100) <= rewardChance) then
        dropReward(mob, player);
    end

    -- update noteriety
    local noto = "noto_z" .. tostring(player:getZoneID());
    local notoBonus = 1;
    if (diff >= 7) then notoBonus = 4;
    elseif (diff >= 5) then notoBonus = 3;
    elseif (diff >= 2) then notoBonus = 2;
    end




    -- Non-event based mobs drop extra stuff
    if (not mob:isMobType(0x20)) then
        if (mob:isNM() and isKiller) then
            dropReward(mob, player);
            if (diff >= 0) then
                dropReward(mob, player);
                notoBonus = notoBonus + 40;
            else
                notoBonus = notoBonus + 20;
            end;
        end
    end

    if (isHot and math.random(0,100) >= 33) then notoBonus = notoBonus * 2; end;

    player:setVar(noto, player:getVar(noto) + notoBonus);


--    local zid = player:getZoneID()
--    local fid = mob:getFamily()
--    local sid = mob:getSystem()
--    local fname = "achv_f" .. fid .. "_kill"
--    local sname = "achv_s" .. sid .. "_kill"
--    player:setVar(zname, player:getVar(zname) + 1)
--    player:setVar(fname, player:getVar(fname) + 1)
--    player:setVar(sname, player:getVar(sname) + 1)
--    if (mob:isNM()) then
--        local NMname = "achv_NM" .. zid .. "_kill"
--        player:setVar(NMname, player:getVar(NMname) + 1)
--
--        -- special rewards for fighting NM
--        if (not mob:isMobType(0x20) and not mob:isMobType(0x10)) then
--        end
--
--    end









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
