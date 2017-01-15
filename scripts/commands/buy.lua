---------------------------------------------------------------------------------------------------
-- func: buy
-- desc: Adds the given amount cp to the player.
---------------------------------------------------------------------------------------------------
require("scripts/globals/shop");
cmdprops =
{
    permission = 0,
    parameters = "s"
};

local WOOD = "woodworking"
local FISH = "fishing"
local SMIT = "smithing"
local GOLD = "goldsmithing"
local WEAV = "weaving"
local LEAT = "leathercraft"
local BONE = "bonecraft"
local ALCH = "alchemy"
local COOK = "cooking"

local function special_stock(stock, points)
    local newStock = {};
    local counter = 0;
    local i, id, cost, skill, element, threshold = nil, nil, nil, nil, nil, nil;

    while (true) do
        i, id = next(stock, i);
        i, cost = next(stock, i);
        i, element = next(stock, i);
        if (i == nil or id == nil) then
            break
        end

        -- if array, then first element is skill and second element is guild point threshold
        if (type(element) == "table") then
            skill = element[1];
            threshold = element[2];
        else
            skill = element;
            threshold = cost; -- default threshold
        end
        if (threshold == nil) then threshold = cost end

        if (points[skill] > threshold) then
            table.insert(newStock, id);
            table.insert(newStock, cost);
        end
    end
    return newStock;
end


local function attackFood(player, points)
    local stock = {
        4371,   80,    --Grilled Hare
        4507,   110,    --Rarab Meatball
        4411,   220,    --Dhalmel Pie
        4517,   300,    --Yellow Curry
        5190,   310,    --Carbonara
        5598,   390,    --Sis Kebabi
        5166,   450,    --Coeurl Sub
        5211,   600,    --Spaghetti Arrabbiata
        4547,   620,    --Boiled Cockatrice
        5685,   950,    --Rabbit Pie
        5146,   1100,    --Hedgehog Pie
    };
    return stock;
end


local function attackFoodEx(player, points)
    local stock = {
        4516,   120, {COOK, 350},    --Grilled Black Hare
        4349,   200, {COOK, 600},    --Bunny Ball
        6212,   380, {COOK, 1000},    --Marinara Sice +1
        4284,   435, {COOK, 2000},    --Tender Navarin
        5199,   670, {COOK, 2500},    --Carbonara +1
        4349,   200, {COOK, 3200},    --Yellow Curry Bun +1
        4212,   1400, {COOK, 3800},    --Arrabbiata +1
        5156,   1900, {COOK, 5000},    --Porcupine Pie
        4331,   2400, {COOK, 9000},    --Imperial Omelette
    };
    return special_stock(stock, points);
end

local function hybridFood(player, points)
    local stock = {
        5145,   120,    --Fish and Chips
        6217,   150,    --Anchovy Slice
        6466,   380,    --Miso Soup
        5758,   440,    --Black Curry Bun
        6211,   435,    --Marinara Slice
        4584,   550,    --Founder Meuniere
        4488,   900,    --Jack-O-Lantern
    };
    return stock;
end

local function hybridFoodEx(player, points)
    local stock = {
        5159,   240, {COOK, 800},    --Friture Misareaux
        6218,   300, {COOK, 1000},    --Anchovy Slice +1
        4345,   950, {COOK, 1800},    --Flounder Meuniere +1
        6467,   660, {COOK, 2800},    --Miso Soup +1
        6212,   1150, {COOK, 4600},    --Marinara Slice +1
        5764,   1300, {COOK, 6000},    --Black Curry Bun +1
        5685,   1000, {COOK, 8000},    --Rabbit Pie
        6069,   3000, {COOK, 9300},    --Riverfin Soup
    };
    return special_stock(stock, points);
end


local function miscFood(player, points)
    local stock = {
        4281,  35,    --Red Hot Cracker
        5636,  35,    --Shrimp Cracker
        4280,  35,    --Garlic Cracker +1
        4577,  35,    --Wild Cookie
        4576,  35,    --Wizard Cookie
        4520,  35,    --Coin Cookie
        5923,  35,    --Juglan Jumble
        5188,  80,    --Peperoncino
        5214,  200,    --Melanzane +1
        5201,  280,    --Boscaiola +1
    };
    return stock;
end

local function miscFoodEx(player, points)
    local stock = {
        4278,   200, {COOK, 500},    --Shogun Rice Ball
        5188,   160, {COOK, 650},    --Peperoncino +1
    };
    return special_stock(stock, points);
end


local function defenseFood(player, points)
    local stock = {
        4535,  70,    --Boiled Crayfish
        4456,  100,    --Boiled Crab
        5189,  115,    --Vongole Rosso
        4459,  150,    --Nebimonite Bake
        4398,  190,    --Fish Mithkabob
        5191,  200,    --Pescatora
        4398,  250,    --Boiled Barnacles
        6272,  280,    --Fried Popoto
        4554,  365,    --Tavnazian Taco
        4554,  800,    --Shallops Tropicale
    };
    return stock;
end

local function defenseFoodEx(player, points)
    local stock = {
        4338,   155, {COOK, 500},    --Steamed Crayfish
        4342,   225, {COOK, 1000},    --Steamed Crab
        5198,   260, {COOK, 1400},    --Vongole Rosso +1
        4267,   330, {COOK, 1800},    --Buttered Nebimonite
        4575,   410, {COOK, 2500},    --Fish Chiefkabob
        5200,   445, {COOK, 2850},    --Pescatora +1
        6273,   560, {COOK, 3200},    --Fried Popoto +1
        5175,   850, {COOK, 3900},    --Leremieu Taco +1
    };
    return special_stock(stock, points);
end

local function magicFood(player, points)
    local stock = {
        4414,  70,    --Rolanberry Pie
        4413,  100,    --Apple Pie
        4563,  150,    --Pamama Tart
        4556,  200,    --Icecap Rolanberry
        4270,  265,    --Sweet Rice Cake
        5718,  320,    --Cream Puff
        5646,  300,    --Bloody Chocolate
        5773,  480,    --Mushroom Crepe
        5930,  1250,    --Sprightly Soup
        6063,  1400,    --Fruit Parfait
        5766,  600,    --Butter Crepe
        5775,  900,    --Chocolate Crepe
        5777,  1300,    --Pear Crepe
    };
    return stock;
end

local function magicFoodEx(player, points)
    local stock = {
        4339,   160, {COOK, 800},    --Rollanberry Pie +1
        5555,   300, {COOK, 1300},    --Flurry Courante
        4320,   280, {COOK, 1800},    --Apple Pie +1
        4287,   450, {COOK, 2400},    --Opo-opo Tart
        5931,   2000, {COOK, 3200},    --Shimmy Soup
        5158,   900, {COOK, 4000},    --Vermillian Jelly
        5774,   920, {COOK, 4800},    --Crepe Forestiere
        6064,   3300, {COOK, 5250},    --Queen's Crown
        5767,   1450, {COOK, 5800},    --Crepe Delice
        5776,   2200, {COOK, 6800},    --Crepe Caprice
        5778,   3300, {COOK, 8000},    --Crepe Belle Helene
    };
    return special_stock(stock, points);
end


local function accuracyFood(player, points)
    local stock = {
        4440,   150,    --Whitefish Stew
        5215,   120,    --Tentacle Sushi
        4582,   210,    --Bass Meuniere
        5219,   155,    --Ikra Gunkan
        4404,   180,    --Roast Trout
        5721,   210,    --Crab Sushi
        5693,   235,    --Octopus Sushi
        5149,   285,    --Sole Sushi
        5176,   320,    --Bream Sushi
        5665,   320,    --Fin Sushi
        5178,   450,    --Dorado Sushi
        5968,   1400,    --Seafood Paella
    };
    return stock;
end


local function accuracyFoodEx(player, points)
    local stock = {
        4601,   220, {COOK, 800},    --Sopa Pez Blanco
        5216,   240, {COOK, 1350},    --Tentacle Sushi +1
        4582,   490, {COOK, 1600},    --Bass Meuniere +1
        5220,   435, {COOK, 1800},    --Ikra Gunkan +1
        4587,   320, {COOK, 2350},    --Broiled Trout
        5722,   500, {COOK, 2900},    --Crab Sushi +1
        5694,   540, {COOK, 3350},    --Octopus Sushi +1
        5163,   610, {COOK, 4000},    --Sole Sushi +1
        4353,   450, {COOK, 4500},    --Bass Croute
        5177,   700, {COOK, 4800},    --Bream Sushi +1
        5666,   700, {COOK, 4800},    --Fin Sushi +1
        5983,   2200, {COOK, 5450},    --Piscator's Paella
        5179,   1100, {COOK, 6400},    --Dorado Sushi +1
    };
    return special_stock(stock, points);
end



local function automatonParts(player, points)
    local stock = {
        8193,   500,    --Harlequin Head
        8193,   500,    --Harlequin Frame
        8193,   1250,    --Valoredge Head
        8225,   2500,    --Valoredge Frame
        8195,   1250,    --Sharpshot Head
        8226,   2500,    --Sharpshot Frame
        8196,   1250,    --Stormwaker Head
        8227,   2500,    --Stormwaker Frame
        8197,   4000,    --Soulsoother Head
        8198,   4000,    --Spiritreaver Head
    };
    return stock;
end

local function pupEquipment(player, points)
    local stock = {
        18731,   50,    --Automaton Oil
        18732,   100,    --Automaton Oil +1
        18733,   200,    --Automaton Oil +2
        17859,   500,    --Animator
        17858,   4000,    --Turbo Animator
        15686,   15000,    --Puppetry Babouches
        15602,   15000,    --Puppetry Churidars
        14930,   15000,    --Puppetry Dastanas
        15267,   15000,    --Puppetry Taj
        14523,   15000,    --Puppetry Tobe
        12005,   15000,    --Puppetry Torque
    };
    return stock;
end


local function fireAttachments(player, points)
    local stock = {
        8449,   1000, {ALCH, 0},    --Strobe
        8450,   1000, {ALCH, 0},    --Tension Spring
        8451,   2500, {ALCH, 0},    --Inhibitor
        8452,   2000, {ALCH},       --Tension Spring II
        8453,   3500, {ALCH},       --Attuner
        8454,   1000, {ALCH, 0},    --Reactive Shield
        8455,   4000, {ALCH},       --Flame Holder
        8455,   5500, {ALCH},       --Heat Capacitor
        8456,   3000, {ALCH},       --Strobe II
        8457,   7500, {ALCH},       --Tension Spring III
    };
    return special_stock(stock, points);
end

local function iceAttachments(player, points)
    local stock = {
        8481,   2000, {ALCH, 0},    --Mana Booster
        8482,   1000, {ALCH, 0},    --Loudspeaker
        8483,   1500, {ALCH, 0},    --Scanner
        8484,   2000, {ALCH, 0},     --Loudspeaker II
        8485,   2000, {ALCH, 0},     --Tactical Processor
        8486,   6000, {ALCH},       --Tranquilizer
        8487,   3500, {ALCH},       --Ice Maker
        8488,   4500, {ALCH},       --Power Cooler
        8489,   7500, {ALCH},       --Loudspeaker III
        8490,   9500, {ALCH},       --Tranquilizer II
    };
    return special_stock(stock, points);
end

local function windAttachments(player, points)
    local stock = {
        8513,   1000, {ALCH, 0},    --Accelerator
        8514,   1000, {ALCH, 0},    --Scope
        8515,   3000, {ALCH},       --Pattern Reader
        8516,   2000, {ALCH},       --Accelerator II
        8517,   3500, {ALCH, 0},    --Drum Magazine
        8518,   5000, {ALCH},    --Turbo Charger
        8519,   2500, {ALCH, 0},    --Replicator
        8520,   4500, {ALCH},    --Barrage Turbine
        8520,   4500, {ALCH},    --Barrage Turbine
        8521,   9000, {ALCH},    --Turbo Charge II
        8522,   3500, {ALCH},    --Acellerator III
        8523,   2500, {ALCH, 0},    --Scope II
    };
    return special_stock(stock, points);
end


local function earthAttachments(player, points)
    local stock = {
        8545,   2000, {ALCH, 0},    --Shock Absorber
        8546,   1000, {ALCH, 0},    --Armor Plate
        8547,   2000, {ALCH},       --Analyzer
        8548,   2000, {ALCH, 0},    --Armor Plate II
        8549,   3500, {ALCH},       --Equalizer
        8550,   4500, {ALCH},       --Schurzen
        8551,   2000, {ALCH, 0},       --Hammermill
        8552,   3500, {ALCH, 0},       --Barrier Module
        8553,   6000, {ALCH},       --Shock Absorber II
        8554,   4500, {ALCH},       --Armor Plate III
    };
    return special_stock(stock, points);
end


local function thunderAttachments(player, points)
    local stock = {
        8577,   1000, {ALCH, 0},    --Stabilizer
        8578,   2000, {ALCH, 0},    --Volt Gun
        8579,   3000, {ALCH},       --Heat Seaker
        8580,   2000, {ALCH, 0},       --Stabilizer II
        8581,   4500, {ALCH},       --Target Maker
        8582,   3000, {ALCH, 0},       --Dynamo
        8583,   4500, {ALCH, 0},       --Coiler
        8584,   4500, {ALCH},       --Galvanizer
        8585,   6000, {ALCH},       --Stabilizer III
        8586,   7500, {ALCH},       --Coiler II
    };
    return special_stock(stock, points);
end


local function waterAttachments(player, points)
    local stock = {
        8609,   1000, {ALCH, 0},    --Mana Jammer
        8610,   2500, {ALCH, 0},    --Heatsink
        8611,   2000, {ALCH, 0},    --Stealth screen
        8612,   2000, {ALCH, 0},    --Mana Jammer II
        8613,   2500, {ALCH},    --Mana Channeler
        8614,   4500, {ALCH},    --Condenser
        8615,   3500, {ALCH},    --Steam Jacket
        8616,   2500, {ALCH},    --Percolator
        8617,   4500, {ALCH},    --Mana Jammer III
        8618,   3500, {ALCH, 0},    --Stealth Screen II
    };
    return special_stock(stock, points);
end


local function lightAttachments(player, points)
    local stock = {
        8641,   1000, {ALCH, 0},    --Auto-Repair Kit
        8642,   2000, {ALCH, 0},    --Flashbulb
        8643,   2000, {ALCH, 0},    --Damage Gauge
        8644,   2000, {ALCH, 0},    --Auto-Repair Kit II
        8645,   4000, {ALCH, 0},    --Eraser
        8646,   7000, {ALCH, 0},    --Optic Fiber
        8648,   2500, {ALCH, 0},    --Vivi Valve
        8649,   6500, {ALCH},    --Vivi Valve II
        8650,   6500, {ALCH},    --Auto-Repair Kit III
        8651,   3000, {ALCH},    --Arcanic Cell
    };
    return special_stock(stock, points);
end


local function darkAttachments(player, points)
    local stock = {
        8673,   1000, {ALCH, 0},    --Mana Tank
        8674,   2000, {ALCH, 0},    --Mana Converter
        8675,   2000, {ALCH, 0},    --Mana Conserver
        8676,   2000, {ALCH, 0},    --Mana Tank II
        8677,   3000, {ALCH, 0},    --Smoke Screen
        8678,   4000, {ALCH},    --Economizer
        8680,   3000, {ALCH},    --Disruptor
        8681,   7000, {ALCH},    --Mana Tank III
    };
    return special_stock(stock, points);
end


local function black1(player, points)
    local stock = {
        4767,   100,    --Stone
        4862,   250,    --Blind
        4828,   200,    --Poison
        4777,   250,    --Water
        4866,   350,    --Bind
        4838,   450,    --Bio
        4762,   400,    --Aero
        4857,   1500,    --Blaze Spikes
        4752,   600,    --Scroll of Fire
        4853,   2500,    --Drain
        4797,   700,    --Scroll of Stonega
        4847,   750,    --Scroll of Shock
        4757,  800,    --Blizzard
        4869,   4000,    --Warp
        4846,   850,    --Rasp
        4807,   900,    --Waterga
    };
    return stock;
end

local function black2(player, points)
    local stock = {
        4845,   950,    --Choke
        4858,   3500,   --Ice Spikes
        4861,   950,    --Sleep
        4772,   1000,    --Thunder
        4844,   1050,    --Frost
        4792,   1100,    --Aeroga
        4843,   1150,    --Burn
        4833,   1150,    --Poisonga
        4855,   6500,    --Aspir
        4853,   2500,    --Drain
        4872,   1200,    --Tractor
        4768,   1250,    --Scroll of Stone II
        4848,   1350,     --Drown
        4782,   1400,    --Firaga
        4871,   1450,    --Escape
        4859,   6000,    --Shock Spikes
    };
    return stock;
end

local function black3(player, points)
    local stock = {
        4778,   1500,    --Water II
        4881,   1550,   --Sleepga
        4787,   1600,    --Blizzaga
        4763,   1700,    --Aero II
        4839,   1750,    --Bio II
        4802,   1800,    --Thundaga
        4753,   1900,    --Fire II
        4798,   2000,    --Stonega II
        4870,   10000,    --Warp II
        4867,   2050,    --Sleep II
        4758,   2100,    --Blizzard II
        4829,   2150,    --Poison II
        4808,   2200,     --Waterga II
        4860,   4500,    --Stun
        4773,   2300,    --Thunder II
        4793,   2400,    --Aeroga II
    };
    return stock;
end

local function black4(player, points)
    local stock = {
        4814,   5000,    --Freeze
        4769,   2600,   --Stone III
        4816,   5400,    --Tornado
        4782,   2800,    --Firaga II
        4818,   5800,    --Quake
        4779,   3000,    --Water III
        4820,   6200,    --Burst
        4881,   15000,    --Sleepga II
        4787,   3300,    --Blizzaga II
        4822,   6800,    --Flood
        4764,   3500,    --Aero III
        4812,   7200,    --Flare
        4803,   3700,     --Thundaga II
        4754,   3800,    --Fire III
        4799,   3900,    --Stonega III
        4759,   4000,    --Blizzard III
    };
    return stock;
end

local function black5(player, points)
    local stock = {
        4809,   4100,    --Waterga III
        4774,   4200,   --Thunder III
        4794,   4300,    --Aeroga III
        4770,   4400,    --Stone IV
        4784,   4500,    --Firaga III
        4780,   4600,    --Water IV
        4789,   4700,    --Blizzaga III
        4765,   4800,    --Aero IV
        4755,   4900,    --Fire IV
        4804,   4900,    --Thundaga III
        4760,   5000,    --Blizzard IV
        4775,   5100,    --Thunder IV
    };
    return stock;
end


local function red1(player, points)
    local stock = {
        4712,   800,   --Enthunder
        4711,   900,    --Enstone
        4710,   1000,    --Enaero
        4824,   1050,    --Gravity
        4709,   1100,    --Enblizzard
        4708,   1200,    --Enfire
        4713,   1350,    --Enwater
        4868,   8000,    --Dispel
        4912,   1750,    --Distract
        4717,   10000,  --Refresh
        4914,   1850,     --Frazzle
        5104,   1950,    --Flurry
    };
    return stock;
end

local function red2(player, points)
    local stock = {
        4726,   5000,   --Enthunder II
        4725,   6000,    --Enstone II
        4724,   7000,    --Enaero II
        4723,   8000,    --Enblizzard II
        4722,   9000,    --Enfire II
        4727,   10000,    --Enwater II
        5106,   11000,    --Inundation
    };
    return stock;
end

local function sch1(player, points)
    local stock = {
        6045,   2500,   --Geohelix
        6042,   3000,   --Hydrohelix
        6046,   3500,    --Anemohelix
        6041,   4000,    --Pyrohelix
        6044,   4500,    --Cryohelix
        6043,   5000,    --Ionohelix
        6048,   6000,    --Noctohelix
        6047,   7000,    --Luminohelix
    };
    return stock;
end

local function sch2(player, points)
    local stock = {
        6053,   10000,   --Sandstorm
        6050,   10000,   --Rainstorm
        6054,   10000,    --Windstorm
        6049,   10000,    --Firestorm
        6052,   10000,    --Hailstorm
        6058,   20000,    --Klimaform
        6051,   10000,    --Thunderstorm
        6056,   10000,    --Voidstorm
        6055,   10000,    --Aurorastorm
    };
    return stock;
end

local function smn1(player, points)
    local stock = {
        4896,   3000,   --Fire Spirit
        4897,   3000,   --Ice Spirit
        4898,   3000,   --Air Spirit
        4899,   3000,   --Earth Spirit
        4900,   3000,   --Thunder Spirit
        4901,   3000,   --Water Spirit
        4902,   3000,   --Light Spirit
        4903,   8000,   --Dark Spirit
    };
    return stock;
end

local function nin1(player, points)
    local stock = {
        4961,   4000,   --Tonko Ichi
        4946,   10000,   --Utsusemi Ichi
        4928,   1000,   --Katon Ichi
        4931,   1000,   --Hyoton Ichi
        4934,   1000,   --Huton Ichi
        4937,   1000,   --Doton Ichi
        4940,   1000,   --Raiton Ichi
        4943,   15000,   --Suiton Ichi
        4955,   5000,   --Kurayami Ichi
        4952,   6000,   --Hojo Ichi
        4958,   7000,   --Dokumori Ichi
        4949,   8000,   --Jubaku Ichi
        4962,   8000,   --Tonko Ni
        4947,   15000,   --Utsusemi Ni
    };
    return stock;
end

local function nin2(player, points)
    local stock = {
        4929,   8000,   --Katon Ni
        4932,   8000,   --Hyoton Ni
        4935,   8000,   --Huton Ni
        4938,   8000,   --Doton Ni
        4941,   8000,   --Raiton Ni
        4944,   8000,   --Suiton Ni
        4956,   12000,   --Kurayami Ni
        4953,   15000,   --Hojo Ni
    };
    return stock;
end

local function tools(player, points)
    local stock = {
        5314,   3000,   --Shihei
        5867,   5000,   --Inoshi
        5868,   5000,   --Shikan
        5869,   5000,   --Cho
        5870,   5000,   --Trump Card Case
        18259,  100,   --Angon
        18258,  100,   --Tomahawk
    };
    return stock;
end

local function dark1(player, points)
    local stock = {
        4879,   2500,   --Absorb Mnd
        4880,   3000,    --Absorb Chr
        4876,   3500,    --Absorb Vit
        4877,   4000,    --Absorb Agi
        4878,   4500,    --Absorb Int
        4874,   5000,    --Absorb Str
        4883,   9000,    --Absorb TP
        4886,   12500,    --Absorb Acc
        4854,   12500,    --Drain II
        4885,   15000,    --Dread Spikes
    };
    return stock;
end

local function bard1(player, points)
    local stock = {
        4997,   100,    --Minne
        5002,   200,    --Minuet
        4986,   300,    --Paeon
        4976,   400,    --Requiem
        5014,   500,    --Pastoral
        5068,   550,    --Light Threnody
        5007,   600,    --Sword Madrigal
        5069,   650,    --Dark Threnody
        5011,   700,    --Sheepfoe Mambo
        5065,   750,    --Earth Threnody
        4987,   800,    --Paeon II
        5071,   850,    --Foe Lullaby
        5067,   850,    --Water Threnody
        4977,   900,    --Requiem II
        5064,   950,    --Wind Threnody
        5017,   1000,    --Operetta
    };
    return stock;
end

local function bard2(player, points)
    local stock = {
        5062,   1050,    --Fire Threnody
        4998,   1100,    --Minne II
        5038,   1150,    --Enchanting Etude
        5063,   1150,    --Ice Threnody
        5003,   1200,    --Minuet II
        5066,   1250,    --Lightning Threnody
        5037,   1300,    --Spirited Etude
        4994,   5000,    --Ballad
        5036,   1400,    --Learned Etude
        4984,   2800,    --Horde Lullaby
        5035,   1500,    --Quick Etude
        5027,   1550,    --Advancing March
        5034,   1600,    --Vivacious Etude
        5009,   1650,    --Prelude
        5033,   1700,    --Dextrous Etude
        5013,   1750,    --Aubade
    };
    return stock;
end

local function bard3(player, points)
    local stock = {
        5070,   8000,    --Magic Finale
        5032,   1850,    --Sinewy Etude
        4988,   1900,    --Paeon III
        5052,   1950,    --Light Carol
        4978,   2000,    --Requiem III
        5075,   2050,    --Mazurka
        5049,   2100,    --Earth Carol
        5028,   4200,    --Battlefield Elegy
        5051,   2200,    --Water Carol
        4999,   2250,    --Minne III
        5048,   2300,    --Wind Carol
        5004,   2350,    --Minuet III
        5046,   2400,    --Fire Carol
        4989,   2450,    --Paeon IV
        5047,   2500,    --Ice Carol
        4979,   2550,    --Requiem IV
    };
    return stock;
end

local function bard4(player, points)
    local stock = {
        5050,   2600,    --Lightning Carol
        5023,   2650,    --Gavotte
        5053,   2700,    --Dark Carol
        5008,   2800,    --Blade Madrigal
        5020,   3000,    --Capriccio
        4995,   15000,    --Ballad II
        5016,   3200,    --Fantasia
        4980,   3300,    --Requiem V
        5030,   15000,    --Carnage Elegy
        5028,   3600,    --Victory March
        5000,   3700,    --Minne IV
        5045,   3800,    --Bewitching Etude
        5005,   3900,    --Minuet IV
        5044,   4000,    --Logical Etude
        4990,   4100,    --Paeon V
        5043,   4200,    --Sage Etude
    };
    return stock;
end

local function bard5(player, points)
    local stock = {
        4981,   4300,    --Requiem VI
        5042,   4400,    --Swift Etude
        5018,   4500,    --Operetta
        5041,   4600,    --Vital Etude
        5010,   4700,    --Archer's Prelude
        5072,   4800,    --Hymnus
        5040,   4900,    --Uncanny Etude
        5073,   5000,    --Chocobo Mazurka
        5022,   5100,    --Warding Round
        5039,   5200,    --Herculean Etude
        5074,   10000,    --Virelai
    };
    return stock;
end

local function dice1(player, points)
    local stock = {
        5493,   500,    --Corsair Die
        5489,   800,    --Ninja Die
        5487,   1100,    --Ranger Die
        5484,   1400,    --Dark Knight Die
        5492,   1700,    --Blue Mage Die
        5479,   2000,    --White Mage Die
        5490,   2300,    --Dragoon Die
        5486,   2600,    --Bard Die
        5478,   3100,    --Monk Die
        5485,   3400,    --Beastmaster Die
        5488,   3700,    --Samurai Die
        5491,   4000,    --Summoner Die
        5482,   4300,    --Thief Die
        5481,   4600,    --Red Mage Die
        5477,   4900,    --Warrior Die
        5494,   5200,    --Puppetmaster Die
    };
    return stock;
end

local function dice2(player, points)
    local stock = {
        5483,   5500,    --Paladin Die
        5480,   5800,    --Black Mage Die
        5495,   6100,    --Dancer Die
        5496,   6400,    --Scholar Die
        6368,   6700,    --Geomancer Die
        6369,   7000,    --Rune Fencer Die
    };
    return stock;
end


local function white1(player, points)
    local stock = {
        4609,   100,    --Cure
        4631,   150,    --Dia
        4666,   350,    --Paralyze
        4636,   150,    --Banish
        4677,   400,    --Barstonra
        4671,   300,    --Barstone
        4622,   100,    --Poisona
        4651,   150,    --Protect
        4733,   150,    --Protectra
        4680,   300,    --Barsleep
        4694,   300,    --Barsleepra
        4673,   500,    --Barwater
        4679,   500,    --Barwatera
        4623,   250,    --Paralyna
        4663,   500,    --Aquaveil
        4681,   500,    --Barpoison
    };
    return stock;
end

local function white2(player, points)
    local stock = {
        4695,   500,    --Barpoisonra
        4610,   750,    --Cure II
        4682,   800,    --Barparalyze
        4696,   800,    --Barparalyzra
        4664,   1500,   --Slow
        4670,   700,    --Baraero
        4676,   700,    --Baraera
        4624,   450,    --Blindna
        4667,   900,    --Silence
        4646,   900,    --Banishga
        4615,   1500,   --Curaga
        4656,   1000,   --Shell
        4738,   1000,   --Shellra
        4668,   1200,   --Barfire
        4674,   1200,   --Barfira
        4683,   1300,   --Barblind
    };
    return stock;
end

local function white3(player, points)
    local stock = {
        4697,   1300,   --Barblindra
        4641,   800,    --Diaga
        4625,   700,    --Silena
        4661,   1000,   --Blink
        4745,   1000,   --Sneak
        4716,   1200,   --Regen
        4669,   1200,   --Barblizzard
        4675,   1200,   --Barblizzara
        4611,   1600,   --Cure III
        4684,   1600,   --Barsilence
        4698,   1600,   --Barsilencra
        4620,   1800,   --Raise
        4743,   1800,   --ReRaise
        4672,   1800,   --Barthunder
        4678,   1800,   --Barthundra
        4744,   1800,   --Invisible
    };
    return stock;
end

local function white4(player, points)
    local stock = {
        4652,   2000,   --Protect II
        4734,   2000,   --Protectra II
        4662,   2000,   --Stoneskin
        4628,   2000,   --Cursna
        4637,   2000,   --Banish II
        4616,   2200,   --Curaga II
        4751,   2200,   --Erase
        4627,   2400,   --Viruna
        4730,   20000,  --Teleport Holla
        4731,   20000,  --Teleport Dem
        4732,   20000,  --Teleport Mea
        4632,   2600,   --Dia II
        4657,   2600,   --Shell II
        4793,   2600,   --Shellra II
        4728,   35000,  --Teleport Yhoat
    };
    return stock;
end

local function white5(player, points)
    local stock = {
        4729,   35000,  --Teleport Altep
        4626,   2800,   --Stona
        4686,   2800,   --Barvirus
        4700,   2800,   --Barvira
        4665,   3000,   --Haste
        4647,   3000,   --Banishga II
        4701,   3000,   --Cura
        4612,   3200,   --Cure IV
        4747,   50000,  --Teleport Vahzl
        4685,   3400,   --Barpetrify
        4699,   3400,   --Barpetra
        4718,   3400,   --Regen II
        4720,   3600,   --Flash
        4653,   3600,   --Protect III
        4735,   3600,   --Protectra III
        4721,   3800,   --Repose
    };
    return stock;
end

local function white6(player, points)
    local stock = {
        4629,   3800,   --Holy
        4617,   3800,   --Curaga III
        4704,   3800,   --Auspice
        4621,   4000,   --Raise II
        4749,   4000,   --Reraise II
        4658,   4000,   --Shell III
        4740,   4000,   --Shellra III
        4703,   4200,   --Esuna
        4613,   4200,   --Cure V
        4715,   4200,   --Reprisal
        4714,   10000,  --Phalanx
        4654,   4200,   --Protect IV
        4736,   4200,   --Protectra IV
        4702,   4400,   --Sacrifice
        4638,   4400,   --Banish III
        4719,   4400,   --Regen III
    };
    return stock;
end

local function white7(player, points)
    local stock = {
        4659,   4600,   --Shell IV
        4741,   4600,   --Shellra IV
        4748,   4800,   --Raise III
        4750,   4800,   --ReRaise III
        4618,   5000,   --Curaga IV
    };
    return stock;
end

local function misc(player, points)
    local stock = {
        19010,  2500,   --Brass Grip +1
        19012,  650,    --Lizad Lthr Srap +1
        19186,  1200,   --Tiny Tathlum
        18136,  2000,   --Morion Tathlum
        19243,  2000,   --Brio Dart
        18137,  500,    --Holy Ampulla
    };
    return stock;
end

local function grips(player, points)
    local stock = {
        19010,  500,   --Lizard Lthre Strap +1
        19010,  1500,   --Brass Grip +1
        19015,  2000,   --Raptor Leather Strap
        19013,  3000,   --Mythril Grip
        19022,  3800,   --Axe Grip
        19027,  4800,   --Claymore Grip
        19026,  5500,   --Spear Strap
    };
    return stock;
end

local function gripsEx(player, points)
    local stock = {
        19043,  800, {LEAT},   --Tenax Strap
        19045,  800, {GOLD},   --Succubus Grip
        19044,  800, {GOLD},   --Disciple Grip
        19047,  1900, {GOLD},   --Reaver Grip +1
        19039,  2500, {LEAT},   --Orca Strap
        19015,  3250, {LEAT},   --Raptor Leather Strap +1
        19018,  4800, {LEAT},   --Bugard Leather Strap +1
        19013,  5500, {GOLD},   --Mythril Grip + 1
        19023,  6500, {LEAT},   --Staff Strap
        19040,  7800, {LEAT},   --Shark Strap
        19025,  8000, {GOLD},   --Pole Grip
        19051,  13500, {LEAT},   --Vivid Strap +1
    };
    return special_stock(stock, points);
end

local function jugs(player, points)
    local stock = {
        17860,  200,{COOK, 400},  --Carrot
        17864,  200,{COOK, 400},  --Herbal
        17876,  200, {COOK, 400}, --Fish
        17877,  350, {COOK, 1100}, --Fish Oil
        17822,  400, {COOK, 700}, --Alchemist's
        17905,  400, {COOK, 800}, --Wormy
        17868,  450, {COOK, 1000}, --Humus
        17870,  700, {COOK, 1600}, --Meat
        17885,  500, {COOK, 1300}, --Grass
        17862,  800, {COOK, 1800}, --Bug
        17866,  700,{COOK, 2200},     --Carrion
        17880,  750,{COOK, 2200},     --Seedbed
        17887,  800,{COOK, 2500},     --Mole
        17872,  850,{COOK, 2900},     --Tree
        17891,  900,{COOK, 3100}     --Antica
    };
    return special_stock(stock, points);
end

local function jugs2(player, points)
    local stock = {
        17861,  700,{COOK, 3400},     --Famous Carrot
        17865,  700,{COOK, 3400},     --Singing Herbal
        17889,  800,{COOK, 3700},     --Blood
        17869,  950,{COOK, 4800},     --Rich Humus
        17871,  950,{COOK, 4800},     --Warm Meat
        17863,  1050,{COOK, 5400},     --Quadav
        17867,  1050,{COOK, 5400},     --Cold Carrion
        17886,  1050,{COOK, 5400},     --Noisy Grass
        17888,  1050,{COOK, 5400},     --Lively Mole
        17873,  1100,{COOK, 6400},     --Scarlet Sap
        17890,  1100,{COOK, 7000},     --Clear Blood
        17892,  1100,{COOK, 7000},     --Fragrant Antica
        17884,  1700,{COOK, 8000}    --Sun Water
    };
    return special_stock(stock, points);
end

local function treats(player, points)
    local stock = {
        17016,  15, {COOK, 0},  --Pet Food Alpha
        17017,  30, {COOK, 500}, --Pet Food Beta
        17018,  50, {COOK, 1500}, --Pet Food Gamma
        17019,  80, {COOK, 3000}, --Pet Food Delta
        17020,  120, {COOK, 5000}, --Pet Food Epsilon
        17021,  150, {COOK, 7000} --Pet Food Zeta
    };
    return special_stock(stock, points);
end



local function instruments(player, points)
    local stock = {
        17354,  1000,    --Harp
        17372,  1000,    --Flute +1
        17347,  1000,    --Piccolo
        17351,  1500,    --Gemshorn
        17348,  2000,    --Traversiere
        17355,  2500,    --Rose Harp
        17352,  3000,    --Horn
        17350,  3000,    --Angel's Flute
        17361,  3800,    --Crumhorn
        17362,  5000,    --Shofar
        17357,  6000,    --Ebony Harp
        17850,  7000,    --Hellish Bugle +1
        17364,  9000,    --Cythara Anglica
    };
    return stock;
end

local function instrumentsEx(player, points)
    local stock = {
        17844,  1500, {WOOD},  --Flute +2
        17374,  2000, {WOOD},  --Harp +1
        17368,  3000, {WOOD},  --Picollo +1
        17370,  3000, {WOOD},  --Gemshorn +1
        17845,  4000, {WOOD},  --Traversiere +2
        17376,  4500, {WOOD},  --Rose Harp +1
        17371,  6000, {WOOD},  --Horn +1
        17378,  6000, {WOOD},  --Angel's Flute +1
        17847,  8000, {WOOD},  --Crumhorn +2
        17848,  9000, {WOOD},  --Ebony Harp +2
        17832,  9000, {WOOD},  --Shofar +1
        17842,  12000, {WOOD},  --Sorrowful Harp
        17837,  20000, {WOOD, 9000},  --Cythara Anglica +1
    };
    return special_stock(stock, points);
end

local function greataxes2(player, points)
    local stock = {
        16724,  5000,    --Heavy Darksteel Axe
        16730,  5300,    --Colossal Axe
        16707,  8000,    --Bhuj
    };
    return stock;
end

local function greataxesEx2(player, points)
    local stock = {
        16725,  6000, {SMIT},  --Massive Darksteel Axe
        16731,  6300, {SMIT},  --Colossal Axe +1
        18197,  9000, {SMIT},  --Bhuj +1
    };
    return special_stock(stock, points);
end


local function greataxes(player, points)
    local stock = {
        16704,  150,    --Butterfly Axe
        16713,  200,    --Inferno Axe
        16705,  280,    --Greataxe
        18214,  1800,    --Voulge
        16706,  2100,    --Heavy Axe
        18208,  3000,    --Kheten
        18506,  3500,    --Tewhatewha
        18218,  4000,    --Leucous Voulge
    };
    return stock;
end

local function greataxesEx(player, points)
    local stock = {
        17016,  250, {SMIT},  --Butterfly Axe +1
        16713,  800, {ALCH},  --Hellfire Axe
        16717,  400, {SMIT},  --Greataxe +1
        18215,  2500, {SMIT},  --Voulge +1
        16718,  2900, {SMIT},  --Heavy Axe +1
        18208,  4000, {SMIT},  --Kheten +1
        18509,  4800, {SMIT},  --Tewhatewha +1
        18219,  5500, {SMIT},  --Leucous Voulge +1
    };
    return special_stock(stock, points);
end

local function knuckles2(player, points)
    local stock = {
        16389,  4000,    --Coeurl Cesti
        16413,  4400,    --Darksteel Claws
        16394,  4600,    --Darksteel Knuckles
        18362,  4900,    --Sainti
        16420,  5000,    --Bone Patas
        16418,  5400,    --Venom Claws
        16414,  5800,    --Cermet Claws
        18750,  6200,    --Black Adargas
        16404,  6450,    --Venom Katars
        18743,  6800,    --Darksteel Sainti
        16416,  7200,    --Dragon Claws
        16395,  8400,    --Diamond Knuckles
        16423,  9800,    --Manoples
    };
    return stock;
end


local function knucklesEx2(player, points)
    local stock = {
        17473,  6200, {LEAT},    --Torama Cesti
        16697,  6200, {SMIT},    --Darksteel Claws +1
        16698,  6400, {SMIT},    --Darksteel Knuckles +1
        18363,  6800, {GOLD},    --Sainti +1
        17477,  6800, {BONE},    --Bone Patas +1
        16425,  7200, {ALCH},    --Venom Claws +1
        17488,  7500, {ALCH},    --Cermet Claws +1
        18751,  8200, {SMIT},    --Black Adargas +1
        17483,  8800, {ALCH},    --Venom Katars +1
        18744,  8800, {SMIT},    --Darksteel Sainti +1
        17485,  9200, {BONE},    --Dragon Claws +1
        17480,  9800, {SMIT},    --Diamond Knuckles +1
        17518,  11000, {SMIT},    --Manoples +1
        18361,  13000, {ALCH},    --Ponderous Manoples
        16396,  20000, {SMIT},    --Koenig's Knuckles [UPGRADE]
    };
    return special_stock(stock, points);
end


local function knuckles(player, points)
    local stock = {
        16405,  100,    --Cat Baghnakhs
        16385,  100,    --Cesti
        16390,  150,    --Bronze Knuckles
        16391,  200,    --Brass Knuckles
        16407,  250,    --Brass Baghnakhs
        16386,  325,    --Lizard Cesti
        16392,  800,    --Metal Knuckles
        16406,  1000,    --Baghnakhs
        16411,  1500,    --Claws
        16399,  1800,    --Katars
        16417,  2300,    --Poison Claws
        16393,  2650,    --Mythril Knuckles
        16403,  2900,    --Poison Katars
        16430,  3300,    --Acid Claws
        16412,  3300,    --Mythril Claws
        16419,  4000,    --Patas
    };
    return stock;
end


local function knucklesEx(player, points)
    local stock = {
        17476,  200, {BONE},    --Cat Baghnakhs +1
        16690,  200, {LEAT},    --Cesti +1
        16440,  280, {SMIT},    --Bronze Knuckles +1
        16689,  350, {GOLD},    --Brass Knuckles +1
        16441,  420, {GOLD},    --Brass Baghnakhs +1
        16398,  580, {LEAT},    --Burning Cesti
        16438,  1000, {ALCH},    --Silence Baghnakhs +1
        16437,  1200, {SMIT},    --Metal Knuckles +1
        16444,  1400, {SMIT},    --Baghnakhs +1
        16700,  2000, {ALCH},    --Poison Cesti +1
        16445,  2200, {SMIT},    --Claws +1
        16695,  2600, {SMIT},    --Katars +1
        16439,  3000, {ALCH},    --Poison Claws +1
        16446,  3800, {SMIT},    --Mythril Knuckles +1
        18354,  5000, {LEAT},    --Adargas +1
        16696,  5000, {SMIT},    --Patas +1
    };
    return special_stock(stock, points);
end


local function polearms2(player, points)
    local stock = {
        16888,  5000,    --Battle Fork
        18094,  6800,    --Couse +1
        16846,  7800,    --Bloody Lance
        16849,  9000,    --Cermet Lance
        18083,  10000,    --Barchha +1
        16840,  14000,    --Ox Tongue
    };
    return stock;
end

local function polearmsEx2(player, points)
    local stock = {
        16880,  7000, {WOOD},    --Holy Lance +1
        18119,  9000, {WOOD, 8000},    --Dark Mezraq +1
        16881,  10000, {WOOD, 8500},    --Carnage Lance
        16879,  14000, {WOOD, 10000},    --Cermet Lance +1
        18116,  30000, {WOOD, 10000},    --Engetsuto +1
        18105,  40000, {WOOD, 10000},    --Orichalcum Lance
    };
    return special_stock(stock, points);
end


local function polearms(player, points)
    local stock = {
        16832,  100,    --Harpoon
        16833,  200,    --Bronze Spear
        16834,  350,    --Brass Spear
        16835,  725,    --Spear
        16845,  1250,    --Lance
        16836,  1700,    --Halberd
        16890,  2800,    --Obelisk Lance
        16847,  3600,    --Mythril Lance
    };
    return stock;
end

local function polearmsEx(player, points)
    local stock = {
        16862,  200, {WOOD},    --Harpoon +1
        16589,  350, {WOOD},    --Bronze Spear +1
        16864,  500, {WOOD},    --Brass Spear +1
        16865,  1250, {WOOD},    --Spear +1
        16876,  2100, {WOOD},    --Lance +1
        16866,  2800, {WOOD},    --Halberd +1
        16891,  3800, {WOOD},    --Obelisk Lance +1
        18122,  4500, {WOOD},    --Broach Lance
        16877,  5000, {WOOD},    --Mythril Lance +1
    };
    return special_stock(stock, points);
end



local function scythes2(player, points)
    local stock = {
        16794,  4800,    --Bone Scythe
        18054,  5350,    --Ivory Sickle
        16789,  6500,    --Darksteel Scythe
        18954,  8000,    --Ogre Sickle
        18058,  12000,    --Orichalcum Scythe
    };
    return stock;
end


local function scythesEx2(player, points)
    local stock = {
        16795,  6300, {BONE},    --Bone Scythe +1
        18055,  7000, {BONE},    --Ivory Sickle +1
        16790,  8000, {SMIT},    --Darksteel Scythe +1
        18060,  12000, {ALCH, 8000},    --Blizzard Scythe
        18942,  38000, {BONE, 10000},    --Naigama +1
        18059,  44000, {GOLD, 10000},    --Triton's Scythe
    };
    return special_stock(stock, points);
end


local function scythes(player, points)
    local stock = {
        16768,  100,    --Bronze Zaghnal
        16769,  200,    --Brass Zaghnal
        18956,  325,    --Serpette
        16774,  500,    --Scythe
        16770,  625,    --Zaghnal
        16784,  1200,    --Frostreaper
        16785,  1500,    --Harvester
        16775,  2400,    --Mythril Scythe
        16796,  3000,    --Mythril Zaghnal
        18050,  3800,    --Mandibular Sickle
    };
    return stock;
end


local function scythesEx(player, points)
    local stock = {
        16778,  200, {SMIT},    --Bronze Zaghnal +1
        16772,  350, {SMIT},    --Brass Zaghnal +1
        18959,  550, {BONE},    --Serpette +1
        16781,  800, {SMIT},    --Scythe +1
        16779,  950, {SMIT},    --Zaghnal +1
        16782,  3200, {SMIT},    --Mythril Scythe +1
        16797,  3400, {SMIT},    --Mythril Zaghnal +1
        18051,  5000, {BONE},    --Antlion Sickle
        18945,  6400, {BONE},    --Jet Sickle
    };
    return special_stock(stock, points);
end





local function greatswords2(player, points)
    local stock = {
        16585,  4800,    --Darksteel Claymore
        18382,  5200,    --Darksteel Falx
        16591,  5500,    --Zweihander
        16956,  6500,    --Flamberge
        16597,  8000,    --Nagan
    };
    return stock;
end

local function greatswordsEx2(player, points)
    local stock = {
        16933,  6000, {SMIT},    --Darksteel Claymore +1
        18383,  6200, {SMIT},    --Darksteel Falx +1
        16616,  6800, {SMIT},    --Zweihander +1
        16941,  8800, {SMIT},    --Flamberge +1
        16955,  11000, {SMIT, 8900},    --Nagan +1
        16955,  12500, {ALCH, 9000},    --Pealing Nagan
        16587,  30000, {ALCH, 10000},    --Gold Algol [UPGRADE]
        19151,  30000, {SMIT, 10000},    --Bahadur [UPGRADE]
    };
    return special_stock(stock, points);
end


local function greatswords(player, points)
    local stock = {
        16606,  100,    --Claymore
        16589,  450,    --Two-Handed Sword
        18375,  1500,    --Falx
        16584,  1900,    --Mythril Claymore
        16590,  2500,    --Greatsword
        16957,  3500,    --Faussar
    };
    return stock;
end

local function greatswordEx(player, points)
    local stock = {
        16638,  200, {SMIT},    --Claymore +1
        16929,  500, {ALCH},    --Burning Claymore
        16931,  750, {SMIT},    --Two-handed Sword +1
        16928,  1800, {ALCH},    --Hellfire Sword
        18376,  2200, {SMIT},    --Falx +1
        16639,  2650, {SMIT},    --Fine Claymore
        16937,  3200, {ALCH},    --Ice Brand
        16932,  3500, {SMIT},    --Greatsword +1
        16958,  4800, {SMIT},    --Faussar +1
    };
    return special_stock(stock, points);
end


local function greatkatanas2(player, points)
    local stock = {
        16984,  4400,    --Jindachi
        16964,  5200,    --Zanbato
        16975,  5400,    --Kanesada
        16972,  6300,    --Kazaridachi
        18439,  9000,    --Shirogatana
    };
    return stock;
end

local function greatkatanasEx2(player, points)
    local stock = {
        16985,  5400, {SMIT},    --Jindachi +1
        17803,  7200, {SMIT},    --Zanbato +1
        17818,  7400, {SMIT},    --Kanesada +1
        17805,  7900, {SMIT},    --Kazaridachi +1
        18440,  11000, {SMIT},    --Shirgatana +1
    };
    return special_stock(stock, points);
end


local function greatkatanas(player, points)
    local stock = {
        16966,  150,    --Tachi
        16960,  225,    --Uchigatana
        16982,  350,    --Nodachi
        16988,  800,    --Kotetsu
        16973,  1250,    --Homura
        16962,  1900,    --Ashura
        16970,  2400,    --Hosodachi
        16967,  3400,    --Mikazuki
    };
    return stock;
end

local function greatkatanasEx(player, points)
    local stock = {
        16981,  250, {SMIT},    --Tachi +1
        16978,  350, {SMIT},    --Uchigatana +1
        16983,  500, {SMIT},    --Nodachi
        17816,  1200, {SMIT},    --Kotetsu +1
        16986,  2200, {ALCH},    --Homura +1
        16979,  2400, {SMIT},    --Ashura +1
        17800,  3100, {SMIT},    --Hosodachi +1
        16989,  4800, {SMIT},    --Mikazuki +1
    };
    return special_stock(stock, points);
end

local function swords(player, points)
    local stock = {
        16535,  200,    --bronze sword
        16530,  400,    --xiphos
        16565,  800,    --spatha ->bee spatha +1
        16512,  1200,   --bilbo → spark bilbo +1
        16536,  1800,   --iron sword → flame sword
        16532,  2500,   --gladius → strider sword
        17739,  2800,   --steel kilij  → tulwar +1
        16537,  3200,   --mithril sword
        16516,  4800,   --junior msk. tuck → tck +2
        17701,  4800,   --shotel → falchion +1
        16558,  5200,   --falchion
        16822,  5600,   --crimson blade
        16571,  6200,   --tmpl knt army → +3 version
    };
    return stock;
end

local function swords2(player, points)
    local stock = {
        16814,  6800,    --Crescent Sword
        16808,  7400,    --Wise Wizard
        16554,  8000,    --Hanger
        16825,  8600,    --Cermet Sword +1
        16618,  8900,    --Mailbreaker +1
        17641,  9500,    --Gold Sword +1
        17636,  10100,    --Jagdplaute +1
        16548,  10700,    --Coral Sword
        17662,  11600,    --Company Sword
        16563,  11600,    --Rune Blade
        17719,  12100,    --Rune Blade
    };
    return stock;
end

local function swords2Ex(player, points)
    local stock = {
        16557,  10600, {SMIT},    --Muskateer Commander's Falchion
        16805,  11200, {SMIT},    --Royal Guard Fleuret
        17718,  12500, {SMIT},    --Leech Scimitar
        17634,  13200, {SMIT},    --Wasp Fleuret
        17677,  14000, {SMIT},    --Tact Espadon +2
        17714,  15200, {SMIT},    --Macuahuitl +1
        16620,  15800, {SMIT},    --Merman's Sword
        17637,  16500, {SMIT},    --Wing Sword +1
        17712,  18500, {SMIT},    --Kaskara +1
        17656,  19800, {SMIT},    --Verdun +1
        17694,  21000, {SMIT},    --Guespiere
        17728,  22000, {SMIT},    --Adaman Kilij
        17751,  24500, {SMIT},    --Fragarach
    };
    return special_stock(stock, points);
end

local function swordsEx(player, points)
    local stock = {
        16610,  300, {SMIT},    --Wax Sword +1
        16801,  700, {SMIT},    --Sapara +1
        16611,  1300, {SMIT},    --Bee Spatha +1
        17679,  1800, {SMIT},    --Kingdom Sword
        16621,  2500, {SMIT},  --Flame Sword
        16819,  3200, {SMIT},   --Mithran Scimitar
        16806,  5000, {SMIT},   --Centurion's Sword → Republic Sword
        16812,  6500, {SMIT},   --War Sword
        16816,  7500, {SMIT},   --Holy Sword +1
        16804,  8250, {SMIT},   --Flame Blade + 1
        16810,  9200, {SMIT},   --Tact Espadon
    };
    return special_stock(stock, points);
end

local function clubs(player, points)
    local stock = {
        17024, 80,    --Ash Club
        17034, 100,    --Bronze Mace
        17059, 125,    --Bronze Rod
        17043,  250,    --Brass Hammer
        17081, 250,    --Brass Rod
        17035, 600,    --Mace
        17060, 850,    --Rod
        17044,  1200,   --Warhammer
        17045, 2400,    --Maul
        17036,  2800,   --Mythril Mace
        17062,  3000,   --Bone Rod
        17030,  3200,   --Great Club
    };
    return stock;
end

local function clubs2(player, points)
    local stock = {
        17037, 4500,    --Darksteel Mace
        17063, 4500,    --Darksteel Rod
        17046, 5800,    --Darksteel Maul
        17085, 6500,    --Holy Wand
        17039, 6500,    --Platinum Mace
        17065, 7300,    --Platinum Rod
        18848, 7800,    --Brass Jadagna
        17459, 8500,    --Scepter + 1
    };
    return stock;
end

local function clubsEx2(player, points)
    local stock = {
        17427,  4000, {WOOD},    --Ebony Wand +1
        17430,  5000, {WOOD},    --Fey Wand
        17433,  6200, {WOOD},    --Mythic Wand +1
        18860,  7000, {SMIT},    --Flanged Mace +1
        18406,  9400, {SMIT},    --Jadagna +1
    };
    return special_stock(stock, points);
end

local function clubsEx(player, points)
    local stock = {
        17087,  150, {WOOD},    --Maple Wand +1
        17138,  250, {WOOD},    --Willow Wand +1
        17048,  680, {SMIT},    --Decurion's Hammer
        17140,  850, {WOOD},    --Yew Wand +1
        17076,  1450, {WOOD},    --Earth Wand
        17414,  1900, {SMIT},    --Pixie Mace
        17071,  2300, {SMIT},   --Heat Rod
        17442,  2200, {WOOD},   --Eremite's Wand+1
        17114,  2900, {SMIT},   --Holy Maul +1
        17411,  3500, {SMIT},   --Holy Mace +1
        17143,  3400, {WOOD},   --Rose Wand +1
        17072,  4500, {WOOD},   --Lilith's Wand
        17040,  6000, {WOOD},   --Warp Cudgel
    };
    return special_stock(stock, points);
end



local function staves2(player, points)
    local stock = {
        17545,  6000,    --Fire Staff
        17547,  6000,    --Ice Staff
        17549,  6000,    --Wind Staff
        17551,  6000,    --Earth Staff
        17553,  6000,    --Thunder Staff
        17555,  6000,    --Water Staff
        17557,  6000,    --Light Staff
        17559,  6000,    --Dark Staff
        17520,  5000,    --Heavy Staff
        17099,  5500,    --Mahogany Pole
        17543,  5800,    --Battle Staff
        17101,  7200,    --Mythic Pole
        17102,  11000,    --Eight-Sided Pole
    };
    return stock;
end


local function stavesEx2(player, points)
    local stock = {
        17521,  6800, {WOOD},    --Mahogany Pole +1
        17544,  7200, {WOOD},    --Battle Staff +1
        17526,  9800, {WOOD},    --Mythic Pole +1
        17592,  20000, {WOOD, 10000},    --Kinkobo
        17596,  13000, {ALCH, 9000},    --Steel-Splitter
        17546,  20000, {WOOD, 8000},    --Vulcan's Staff
        17548,  20000, {WOOD, 8000},    --Aquilo's Staff
        17550,  20000, {WOOD, 8000},    --Auster's Staff
        17552,  20000, {WOOD, 8000},    --Terra's Staff
        17554,  20000, {WOOD, 8000},    --Jupiter's Staff
        17556,  20000, {WOOD, 8000},    --Neptune's Staff
        17558,  20000, {WOOD, 8000},    --Apollo's Staff
        17560,  20000, {WOOD, 8000},    --Pluto's Staff
    };
    return special_stock(stock, points);
end


local function staves(player, points)
    local stock = {
        17088,  100,    --Ash Staff
        17095,  150,    --Ash Pole
        17089,  185,    --Holly Staff
        17096,  250,    --Holly Pole
        17090,  380,    --Elm Staff
        17424,  550,    --Spiked Club
        17097,  900,    --Elm Pole
        17091,  1300,    --Oak Staff
        18606,  3000,    --Passaddhi Staff
        17098,  2100,    --Oak Pole
        18611,  2650,    --Qi Staff
        17523,  3000,    --Quarterstaff
    };
    return stock;
end


local function stavesEx(player, points)
    local stock = {
        17123,  225, {WOOD},    --Ash Staff +1
        17122,  280, {WOOD},    --Ash Pole +1
        17125,  340, {WOOD},    --Holly Staff +1
        17124,  400, {WOOD},    --Holly Pole +1
        17126,  550, {WOOD},    --Elm Staff +1
        17425,  900, {WOOD},    --Spiked Club +1
        17134,  950, {ALCH},    --Dolphin Staff
        17117,  1100, {ALCH},    --Hypno Staff
        17119,  1350, {WOOD},    --Elm Pole +1
        17534,  2100, {ALCH},    --Whale Staff +1
        17127,  1900, {WOOD},    --Oak Staff +1
        18615,  4500, {WOOD},    --Passaddhi Staff +1
        17120,  2800, {WOOD},    --Oak Pole +1
        18616,  3400, {WOOD},    --Qi Staff +1
        17524,  4200, {WOOD},    --Footman's Staff
    };
    return special_stock(stock, points);
end


local function axes2(player, points)
    local stock = {
        16645,  5100,    --Darksteel Axe
        16652,  5800,    --Darksteel Pick
        16658,  6200,    --Darksteel Tabar
        16653,  7200,    --Nadziak
        16659,  9000,    --Tabarzin
    };
    return stock;
end


local function axesEx2(player, points)
    local stock = {
        16677,  6300, {SMIT},    --Darksteel Axe +1
        16682,  7100, {SMIT},    --Darksteel Pick +1
        16683,  8100, {SMIT},    --Darksteel Tabar +1
        16685,  9000, {SMIT},    --Nadziak +1
        16647,  10000, {SMIT},    --Rune Axe
        17949,  11500, {SMIT, 8000},    --Furnace Tabarzin
        17953,  21000, {SMIT, 10000},    --Zoraal Ja's Axe
        17966,  32000, {SMIT, 10000},    --Erlking's Tabar
    };
    return special_stock(stock, points);
end


local function axes(player, points)
    local stock = {
        16640,  100,    --Bronze Axe
        16661,  200,    --Brass Axe
        16642,  325,    --Bone Axe
        16649,  580,    --Bone Pick
        16663,  920,   --Battleaxe
        16650,  1500,   --War Pick
        16664,  2500,   --Mythril Axe
        16657,  3500,   --Tabar
        16651,  4500,   --Mythril Pick
    };
    return stock;
end


local function axesEx(player, points)
    local stock = {
        17943,  900, {SMIT},    --Tomahawk +1
        17940,  2100, {SMIT},    --Military Pick
        17957,  3100, {SMIT},    --Navy Axe
        18531,  4000, {SMIT},    --Veldt Axe +1
        16671,  4800, {SMIT},    --Tabar +1
    };
    return special_stock(stock, points);
end




local function katanas2(player, points)
    local stock = {
        17778,  4800,    --Muketsu
        16903,  5000,    --Kabutowari
        16909,  6300,    --Kororito
        18420,  8000,    --Hayabusa
    };
    return stock;
end

local function katanasEx2(player, points)
    local stock = {
        17779,  6000, {ALCH},    --Muketsu +1
        16923,  6500, {SMIT},    --Kabutowari +1
        17769,  8200, {ALCH},    --Kororito +1
        18421,  9000, {SMIT},    --Hayabusa +1
        18415,  12000, {ALCH},    --Tojaki
    };
    return special_stock(stock, points);
end



local function katanas(player, points)
    local stock = {
        16896,  100,    --Kunai
        16900,  150,    --Wakizashi
        16919,  200,    --Shinobi Gatana
        17776,  400,    --Hibari
        16901,  900,    --Kodachi
        19276,  1350,    --Midare
        16902,  2200,    --Sakurafubuki
        17795,  3500,    --Sai
    };
    return stock;
end

local function katanasEx(player, points)
    local stock = {
        16914,  200, {SMIT},    --Kunai +1
        16918,  250, {SMIT},    --Wakizashi +1
        16920,  350, {SMIT},    --Shinobi Gatana +1
        16925,  800, {ALCH},    --Mokuto +1
        17777,  800, {SMIT},    --Hibari +1
        16927,  1200, {ALCH},    --Busuto +1
        16921,  1300, {SMIT},    --Kodachi +1
        19281,  2300, {SMIT},    --Midare +1
        16926,  2300, {ALCH},    --Bokuto +1
        16922,  3200, {SMIT},    --Sakurafubuki +1
        17768,  4000, {ALCH},    --Yoto +1
        17796,  5000, {SMIT},    --Sai +1
    };
    return special_stock(stock, points);
end

local function throwing(player, points)
    local stock = {
        17307,  1,  --Dart
        17308,  1,  --Hawkeye
        17301,  2,  --Shuriken
        17313,  2,  --Grenade
        17309,  2,  --Pinwheel
        17302,  6,  --Juji Shuriken
        17314,  3,  --Quake Grenade
        17298,  2,  --Tathlum
        17310,  2,  --Hyo
        17315,  4,  --Riot Grenade
        17303,  9,  --Manji Shuriken
        17299,  4,  --Astragalos
    };
    return stock;
end

local function boomerangs(player, points)
    local stock = {
        17280,  200,    --Boomerange +1
        17291,  500,    --Flame Boomerange
        18171,  650,    --Platoon Disc
        18170,  800,    --Platoon Edge
        17288,  1000,   --Wingedge +1
        17289,  1300,   --Chakram +1
        17292,  1750,   --Long Boom
        18133,  2100,   --Cmbt Boom
        18135,  2100,   --Jnr Mskt
        17293,  2600,   --Yag Freezer
    };
    return stock;
end

local function shields(player, points)
    local stock = {
        12290,  300,    --Maple Shield → Nymph Shield +1
        12325,  550,    --Aspis +1
        12291,  550,    --Elm Shield → Strong Shield
        12333,  900,   --Mahogany Shield
        12337,  1000,    --Decurion's Shield → Republic Targe
        12326,  1600,   --Kite Shield +1
        12335,  2000,   --Targe +1
        12293,  2500,   --Oak Shield
        12328,  3000,   --Heater Shield +1
        12327,  3500,   --Buckler +1
        12312,  4000,   --Royal Tmpl Army Shield
    };
    return stock;
end

local function shieldsEx(player, points)
    local stock = {
        16185,  500, {WOOD},    --Pelte
        12413,  1800, {BONE},    --Turtle Shield +1
        12338,  2400, {WOOD},    --Frost Shield
        12343,  2800, {WOOD},    --Faerie Shield
        16185,  3200, {SMIT},    --Lantern Shield
        12365,  4000, {WOOD},    --Nymph Shield +1
        12336,  4800, {WOOD},    --Royal Squire Shield
        16185,  5500, {SMIT},    --Flat Shield
        12350,  6100, {WOOD},    --Strike Shield
        16186,  6550, {WOOD},    --Spellcaster's Ecu
        12375,  6800, {SMIT},    --Light Buckler
        12380,  7200, {SMIT},    --Divine Shield
        12356,  7800, {WOOD},    --Viking Shield
    };
    return special_stock(stock, points);
end



local function shields2(player, points)
    local stock = {
        12339,  5200,   --Scutum +1
        12412,  5500,   --Hoplon +1
        16171,  6000,   --Wivre Shield +1
        12347,  6500,   --Spiked Buckler
        12352,  6800,   --Round Shield +1
        12354,  7000,   --Tower Shield +1
        12309,  8200,   --Ritter Shield +1
        12387,  9000,   --Koenig Shield
    };
    return stock;
end

local function shields2Ex(player, points)
    local stock = {
        12348,  8200, {SMIT},    --Serket Shield
        12344,  8800, {SMIT},    --Master Shield
        12369,  10800, {SMIT},    --Royal Knight Army Shield +2
        12410,  12000, {WOOD},    --Numinous Shield +1
        12360,  15000, {WOOD, 12000},    --Tatami Shield
        16179,  13000, {SMIT, 12000},    --Airy Buckler
        12388,  14500, {SMIT, 12000},    --Kaiser Shield
        16162,  16000, {SMIT, 12500},    --Tariqah
        16180,  18000, {WOOD, 13000},    --Harpy Shield
        16162,  29000, {SMIT, 12000},    --Acheron's Shield
        16164,  38000, {SMIT, 13000},    --Tariqah +1
        12386,  48000, {SMIT, 13000},    --Acheron's Shield +1
    };
    return special_stock(stock, points);
end

local function rings(player, points)
    local stock = {
        13443,  2000,   --Opal Ring
        13444,  2000,   --Sardonyx Ring
        13468,  2000,   --Tourmaline Ring
        13470,  2000,   --Clear Ring
        13471,  2000,   --Amethyst Ring
        13472,  2000,   --Lapis Ring
        13473,  2000,   --Amber Ring
        13474,  2000,   --Onyx Ring
        13554,  1000,   --Aegis Ring
        14606,  3500,   --Aura Ring+1
        13501,  3500,   --Beetle Ring +1 >Marksman's Ring
        13550,  6000,    --Crossbow Ring
        13514,  7000,    --Archer's Ring
        13503,  10000,   --Carapace Ring +1
        14676,  15000,   --Assailant's Ring
        13516,  4500,   --Phalanx Ring
    };
    return stock;
end


local function rings2(player, points)
    local stock = {
        13476,  4000,   --Peridot Ring
        13477,  4000,   --
        13478,  4000,   --
        13479,  4000,   --
        13480,  4000,   --
        13481,  4000,   --
        13482,  4000,   --
        13483,  4000,   --
        13545,  15000,   -- Demon's Ring + 1
        15789,  18000,   -- Marid Ring + 1
        15855,  18000,   -- Krousis Ring + 1
        15722,  24000,   -- Scintilant Ring + 1
    };
    return stock;
end

local function rings3(player, points)
    local stock = {
        13448,  8000,   --Emerald Ring
        13449,  8000,   --Emerald Ring
        13450,  8000,   --Emerald Ring
        13451,  8000,   --Emerald Ring
        13452,  8000,   --Emerald Ring
        13453,  8000,   --Emerald Ring
        13454,  8000,   --Emerald Ring
        13455,  8000,   --Emerald Ring
    };
    return stock;
end

local function ringsEx(player, points)
    local stock = {
        13499,  800,{LEAT},     -- Leather Ring + 1
        13521,  3000,{GOLD},     --Reflex Ring
        13522,  3000,{GOLD},     --Courage Ring
        13523,  3000,{GOLD},     --Courage Ring
        13524,  3000,{GOLD},     --Courage Ring
        13525,  3000,{GOLD},     --Courage Ring
        13526,  3000,{GOLD},     --Courage Ring
        13527,  3000,{GOLD},     --Courage Ring
        13528,  3000,{GOLD},     --Courage Ring
        13549,  6000,{GOLD},   --Ether Ring
        14650,  9000,{GOLD},   --Marksman's Ring
        15817,  10000,{GOLD},   --Ecphoria Ring
        15802,  12000,{GOLD},   --Feral Ring
        14675,  15000,{GOLD},   --Woodsman Ring
        15814,  16000,{GOLD},   --Nereid Ring
    };
    return special_stock(stock, points);
end


local function rings2Ex(player, points)
    local stock = {
        14600,  6000,{GOLD},     --Alacrity Ring + 1
        14601,  6000,{GOLD},     --Alacrity Ring
        14602,  6000,{GOLD},     --Alacrity Ring
        14603,  6000,{GOLD},     --Alacrity Ring
        14604,  6000,{GOLD},     --Alacrity Ring
        14605,  6000,{GOLD},     --Alacrity Ring
        14606,  6000,{GOLD},     --Alacrity Ring
        14607,  6000,{GOLD},     --Alacrity Ring
        13552,  18000,{GOLD},   --Serket Ring
        15789,  25000,{GOLD},   -- Serene Ring
        15812,  30000,{GOLD},   -- Wivre Ring + 1
        13556,  30000,{GOLD},   -- Behemoth Ring + 1
    };
    return special_stock(stock, points);
end

local function rings3Ex(player, points)
    local stock = {
        14617,  12000,{GOLD},     --Nimble Ring + 1
        14618,  12000,{GOLD},     --Nimble Ring + 1
        14619,  12000,{GOLD},     --Nimble Ring + 1
        14620,  12000,{GOLD},     --Nimble Ring + 1
        14621,  12000,{GOLD},     --Nimble Ring + 1
        14622,  12000,{GOLD},     --Nimble Ring + 1
        14623,  12000,{GOLD},     --Nimble Ring + 1
        14624,  12000,{GOLD},     --Nimble Ring + 1
        15781,  38000,{GOLD},     --Cerberus Ring
    };
    return special_stock(stock, points);
end




local function neck2(player, points)
    local stock = {
        13108,   4500,    --Coral Gorget
        13126,   6800,    --Torque +1
        13132,   2500,    --Torama Gorget
        13133,   2800,    --Torama Gorget
        13130,   5000,    --Jeweled Collar +1
        15532,   7500,    --Shark Necklace
        13109,   9500,    --Harmonia's Torque
        15539,   9500,    --Orochi Nodowa
    };
    return stock;
end

local function neckEx2(player, points)
    local stock = {
        13171, 5500,{BONE},     --Reraise Gorget
        13171, 7000,{BONE},     --Merman's Gorget
        16266, 11000,{BONE},     --Wivre Gorget +1
        15522, 7800,{GOLD},     --Enlightened Chain
        11580, 12000,{GOLD},     --Fylgja Torque +1
        15531, 9500,{LEAT},     --Qiqirn Collar
    };
    return special_stock(stock, points);
end


local function neck(player, points)
    local stock = {
        13075,   100,    --Feather Collar
        13081,   100,    --Leather Gorget
        13071,   200,    --Scale Gorget
        13090,   350,    --Beetle Gorget
        13059,   600,    --Fine Gorget
        13076,   900,    --Fang Necklace
        13070,   900,    --Wolf Gorget +1
        13065,   1200,    --Gorget +1
        13124,   1800,    --Nodowa +1
        13067,   1800,    --Noble's Gorget
        16261,   2400,    --Mohbwa Scarf
        13077,   2400,    --Star Pendant
        16263,   3000,    --Beak Necklace
    };
    return stock;
end

local function neckEx(player, points)
    local stock = {
        15526, 900,{LEAT},     --Regen Collar
        16282,  3000,{WEAV},     --Buffoon's Collar +1
        13144,  3000,{GOLD},     --Wing Gorget
        13169,  4000,{GOLD},     --Benign Necklace
        16301,  4000,{GOLD},     --Focus Collar
        16262,  4500,{WEAV},     --Mohbwa Scarf +1
        16262,  5500,{BONE},     --Beak Necklace +1
        13166, 5500,{LEAT},     --Hateful Collar
    };
    return special_stock(stock, points);
end


local function back2(player, points)
    local stock = {
        13679,   2000,    --Templar's Mantle
        15463,   2500,    --Safety Mantle
        13638,   3000,    --Gaia Mantle +1
        13579,   3500,    --Jester's Cape
        15493,   3500,    --Bushido Cape
        15492,   3500,    --Intensifying Cape
        16232,   4500,    --Smilodon Mantle +1
        13630,   6500,    --Peace Cape +1
        13626,   6500,    --Blue Cape +1
        13591,   9000,    --Behemoth Mantle
        16236,   9000,    --Lynx Mantle +1
        13656,   9000,    --Errant Cape
    };
    return stock;
end


local function backEx2(player, points)
    local stock = {
        11540,  6000,{WEAV},     --Accura Cape +1
        13610,  7000,{WEAV},     --Jester's Cape +1
        11542,  6000,{LEAT},     --Kinesis Mantle +1
        15491,  9000,{WEAV},     --Bullseye Cape
        13651,  9000,{WEAV},     --Cheviot Cape
        13627,  12000,{WEAV},     --Prism Cape
        13604,  12000,{LEAT},     --Behemoth Mantle +1
        11541,  18000,{LEAT},     --Fowler's Mantle +1
        13646,  21000,{LEAT},     --Amemet Mantle +1
    };
    return special_stock(stock, points);
end


local function back(player, points)
    local stock = {
        13594,   70, --Rabbit Mantle
        13583,   100,    --Cape
        13592,   200,    --Lizard Mantle
        13584,   240,    --Cotton Cape
        11530,   1500,    --Exactitude Mantle
        13609,   800,    --Wolf Mantle +1
        13612,   1800,    --Dino Mantle
        13577,  1800,     --Black Cape
        13585,  1800,     --White Cape
        13586,   3000,    --Red Cape
        13636,   3000,    --Cavalier's Mantle +1
        };
    return stock;
end


local function backEx(player, points)
    local stock = {
        13632,  1200,{LEAT},     --Nomad's Mantle +1
        13610,  2800,{WEAV},     --Black Cape +1
        13618,  2800,{WEAV},     --White Cape +1
        11539,  3800,{LEAT},     --Exactitude Mantle +1
        13611,  4500,{WEAV},     --Red Cape +1
    };
    return special_stock(stock, points);
end



local function hands2(player, points)
    local stock = {
        14956,  5000,    --Magi Cuffs
        12707,  5000,    --Scorpion Mittens
        13959,  5500,    --Gilt Gauntlets
        13988,  6000,    --Merman's Bangles
        14008,  6300,    --Carapace Gauntlets
        12702,  7000,    --Tiger Gloves
        14942,  7300,    --Marid Mittens +1
        14993,  8000,    --Tabin Bracers
        13989,  8000,    --Darksteel Gauntlets +1
        13993,  8500,    --Torama Gloves
        13986,  8500,    --Platinum Bangles +1
        14871,  9200,    --Trainer's Gloves
        12213,  9800,    --Ebon Mitts
        14829,  9800,    --Gavial Fng Gauntlets
        14881,  13500,    --Wise Gloves +1
        14847,  16500,    --Sheikh Gages
    };
    return stock;
end

local function handsEx2(player, points)
    local stock = {
        14934,  7000,{SMIT},     --Jaridah Bazubands
        13999,  7000,{WEAV},     --Aristocrat's Mitts
        13997,  8000,{WEAV},     --Battle Bracers +1
        14012,  10000,{SMIT},     --Thick Mufflers +1
        14828,  18000,{SMIT, 8000},     --Gem Gauntlets
        15059,  15000,{LEAT, 7000},     --Finesse Gloves +1
        14878,  25000,{SMIT, 9800},     --Hachiman Kote +1
        14883,  28000,{GOLD, 9500},     --King's Gauntlets +1
        14011,  28000,{SMIT, 9500},     --Onyx Gadlings
        14851,  16000,{LEAT, 9500},     --Brave's Wristbands
        14079,  30000,{WEAV, 9500},     --Mahatma Cuffs
        13998,  40000,{WEAV, 9500},     --War Gloves +1
        14882,  40000,{WEAV, 9500},     --Yasha Tekko +1
        14849,  19000,{SMIT, 7000},     --Conte Manopolas
        12189,  24000,{SMIT, 7000},     --Ebon Gauntlets
        14056,  35000,{SMIT, 9800},     --Unicorn Mittens +1
    };
    return special_stock(stock, points);
end



local function hands(player, points)
    local stock = {
        12696,  100,    --Leather Gloves
        12736,  100,    --Mitts
        12710,  300,    --Bone Mittens
        12697,  350,    --Lizard Gloves
        12769,  350,    --Chain Mittens +1
        12730,  800,    --Wool Cuffs +1
        14856,  1200,    --Seer's Mitts
        12698,  1500,    --Studded Gloves
        12787,  2100,    --Cuir Gloves +1
        12793,  2100,    --Mage's Cuffs
        12791,  2400,    --Gauntlets +1
        12790,  3000,    --Carapace Mitts +1
        12795,  3500,    --Dino Gloves
        13958,  4000,    --Mythril Gauntlets +1
        12794,  4000,    --Mage's Mitts
        13955,  4000,    --Shinobi Tekko +1
    };
    return stock;
end

local function handsEx(player, points)
    local stock = {
        12778,  500,{WEAV},     --Linen Cuffs +1
        14054,  800,{WEAV},     --Baron's Cuffs
        13953,  800,{WEAV},     --White Mitts +1
        14863,  1200,{SMIT},     --Kampf
        14859,  2200,{WEAV},     --Seer's Mitts +1
        14025,  3000,{WEAV},     --Devotee's Mitts +1
        15053,  4000,{WEAV},     --Combat Mittens
        14987,  4500,{BONE},     --Thunder Mittens
        14987,  4500,{GOLD},     --Aero Mufflers
        14490,  4500,{LEAT},     --Blizzard Gloves
        14052,  6500,{SMIT},     --Luisant Moufles
        14826,  6500,{LEAT},     --Austere Cuffs
        14908,  6500,{WEAV},     --Raven Bracers
    };
    return special_stock(stock, points);
end



local function belts2(player, points)
    local stock = {
        13187,  2000, --Tiger Belt
        15914,  3500, --Peiste Belt +1
        13239,  4500, --Kaiser Belt
        13188,  5000, --Star Sash
        15890,  6800, --Marid Belt
        15952,  9000, --Toxon Belt +1
    };
    return stock;
end

local function beltsEx2(player, points)
    local stock = {
        13279,  6000,{GOLD},     --Muscle Belt +1
        13276,  6000,{WEAV},     --Arachne Obi +1
        15892,  9800,{WEAV},     --Moon Sash
        14950,  14000,{WEAV},     --Pythia Sash +1
        13249,  9000,{LEAT},     --Sonic Belt
    };
    return special_stock(stock, points);
end


local function belts(player, points)
    local stock = {
        13192,  75, --Leather Belt
        13204,  100, --Heko Obi
        13193,  200, --Lizard Belt
        13213,  350, --Chain Belt +1
        15947,  400, --Griot Belt +1
        13916,  550, --Silver Belt
        13214,  1500, --Waistbelt +1
        13230,  1500, --Adept's Rope
        13234,  2500, --Brocade Obi +1
    };
    return stock;
end

local function beltsEx(player, points)
    local stock = {
        13226,  300,{BONE},     --Blood Stone +1
        13210,  300,{LEAT},     --Leather Belt +1
        13240,  400,{LEAT},     --Warrior's Belt +1
        13219,  800,{LEAT},     --Magic Belt +1
        15906,  1300,{WEAV},     --Mohbwa Sash +1
        13233,  1300,{WEAV},     --Gold Obi +1
        13272,  2000,{LEAT},     --Corsette +1
        15290,  2800,{LEAT},     --Haste Belt
        14908,  3100,{WEAV},     --Qiqirn Sash +1
        13232,  5000,{LEAT},     --Swordbelt +1
    };
    return special_stock(stock, points);
end



local function legs2(player, points)
    local stock = {
        15621,  5000,    -- Magi Slops
        12838,  5800,    -- Scorpion Subligar
        14212,  6200,    -- Gilt Cuisse
        12930,  6800,    -- Tiger Trousers
        14253,  6800,    -- Arhat's Hakama
        14229,  7200,    -- Darksteel Cuisses +1
        14235,  7200,    -- Merman Subligar
        14288,  7200,    -- Clown's Subligar
        14233,  9200,    -- Torama Trousers
        12249,  10000,    -- Ebon Slops
    };
    return stock;
end

local function legsEx2(player, points)
    local stock = {
        14255,  6000,{WEAV},     -- Master's Sitabaki +1
        14239,  7200,{WEAV},     -- Aristocrat's Slacks
        15605,  7500,{SMIT},     -- Thick Breeches +1
        14318,  9000,{LEAT},     -- Conte Cosciales
        12228,  51000,{LEAT, 8000},     -- Ebon Brais
        12225,  51000,{SMIT, 8000},     -- Ebon Hose
        15605,  7500,{WEAV},     -- Jaridah Salvars
        15391,  52000,{WEAV, 11000},     -- Blessed Trousers
        15618,  30000,{WEAV, 11000},     -- Vendor's Slops
        14302,  33500,{WEAV, 13500},     -- Mahatma Slops
        15399,  31000,{GOLD, 11000},     -- King's Cuisses
        15407,  51000,{BONE, 11000},     -- Unicorn Subligar +1
        15401,  31000,{SMIT, 11000},     -- Onyx Cuisses
    };
    return special_stock(stock, points);
end




local function legs(player, points)
    local stock = {
        12824,  100,    -- Leather Trousers
        12864,  140,    -- Slacks
        12863,  210,    -- Solid Cuisses
        12833,  260,    -- Brass Subligar
        12857,  280,    -- Linen Slops
        12825,  520,    -- Lizard Trousers
        12849,  680,    -- Cotton Brais
        12890,  750,    -- Chain Hose +1
        14332,  1250,    -- Kampfdiechlings
        12826,  1350,    -- Studded Trousers
        12827,  2250,    -- Cuir Trousers
        12918,  2250,    -- Mage's Slops
        12916,  2900,    -- Cuisses +1
        12837,  3200,    -- Carapace Subligar
        14211,  4100,    -- Mythril Cuisses +1
        12907,  4100,    -- Wool Hose +1
    };
    return stock;
end

local function legsEx(player, points)
    local stock = {
        12917,  800,{WEAV},     -- Mage's Slacks
        12905,  900,{WEAV},     -- Soil Sitabaki +1
        14325,  1250,{WEAV},     -- Seer's Slacks
        15405,  800,{WEAV},     -- Baron's Slops
        12922,  1300,{WEAV},     -- Martial Slacks
        12925,  3000,{WEAV},     -- Shinobi Hakama +1
        12926,  4100,{WEAV},     -- White Slacks +1
        12924,  4400,{SMIT},     -- Magic Cuisses
        15403,  6000,{SMIT},     -- Luisant
        15579,  6000,{LEAT},     -- Raven Hose
        14310,  6000,{LEAT},     -- Austere Slops
    };
    return special_stock(stock, points);
end



local function feet2(player, points)
    local stock = {
        15707,  4500,    --Magi Pigaches
        12980,  5500,    --Battle Boots
        14084,  6000,    --Darksteel Sollerets +1
        12958,  6800,    --Tiger Ledelsens
        15697,  6800,    --Marid Leggings +1
        14111,  6800,    --Merman's Leggings
        14114,  6800,    --Aristocrat's Pumps
        14109,  7500,    --Torama Ledelsens
        12285,  7500,    --Ebon Clogs
        12264,  9000,    --Ebon Boots
        15337,  10000,    --King's Sabatons
        15340,  10000,    --Onyx Sollerets
        13002,  10000,    --Yasha Sune-Ate
        14194,  12000,    --Gavial Greaves +1
        14159,  9500,    --Ogre Ledelsens +1
        14192,  9500,    --Heroic Boots +1
    };
    return stock;
end


local function feetEx2(player, points)
    local stock = {
        15699,  5000, {SMIT},  -- Templar Sabatons
        15689,  7200, {SMIT},  -- Jaridah Nails
        11375,  8000, {WEAV},  -- Seihanshi Habaki
        14127,  9500, {SMIT},  -- Thick Sollerets +1
        14193,  9500, {SMIT},  -- Gem Sabatons
        15700,  8000, {LEAT},  -- Skanda Boots
        14197,  9000, {WEAV},  -- Dance Shoes +1
        15739,  9000, {LEAT, 7000},  -- Tabin Boots +1
        14183,  11000, {LEAT, 8000},  -- Mahatma Pigaches
        15304,  11000, {LEAT, 8000},  -- Sheikh Crackos
        14113,  11000, {LEAT, 8000},  -- War Boots +1
        15335,  11000, {LEAT, 8000},  -- Wise Pigaches +1
        15329,  13000, {LEAT},  -- Blessed Pumps
        15732,  13000, {LEAT},  -- Stout Gamashes
        15305,  13000, {GOLD},  -- Barone Gambieras
    };
    return special_stock(stock, points);
end


local function feet(player, points)
    local stock = {
        12952,  80, --Leather Highboots
        12992,  80,    --Solea
        13024,  250,    --Solid Greaves
        12985,  300,    --Holly Clogs
        12966,  400,    --Bone Leggings
        15344,  600,    --Baron's Pigaches
        13025,  900,    --Greaves +1
        14134,  1500,    --Air Solea
        14207,  2300,    --Noct Gaiters +1
        13029,  2500,    --Silver Greaves +1
        12987,  3000,    --Ebony Sabots
        13044,  3500,    --Carapace Leggings +1
        13055,  3800,    --Spirit Moccasins
        14086,  4000,    --Mythril Leggings +1
    };
    return stock;
end


local function feetEx(player, points)
    local stock = {
        13048,  900, {LEAT},  -- Mage's Sandles
        14133,  1500, {LEAT},  -- Winged Boots +1
        14135,  2300, {LEAT},  -- Air Solea +1
        11412,  2000, {BONE},  -- Mettle Leggings +1
        14189,  4500, {LEAT},  -- Austere Sabots
        15320,  4200, {LEAT},  -- Powder Boots
        15342,  5000, {SMIT},  -- Luisant Solerets
        15664,  7000, {LEAT},  -- Raven Gaiters
    };
    return special_stock(stock, points);
end




local function earrings2(player, points)
    local stock = {
        13315,  3600,  -- Gold Earring
        13324,  3600,  -- Tortoise Earring
        13350,  4000,  -- Moon Earring
        13349,  4000,  -- Night Earring
        14705,  4000,  -- Victory Earring +1
        14706,  4000,  -- Genius Earring +1
        14707,  4000,  -- Grace Earring +1
        14708,  4000,  -- Serenity Earring +1
        14709,  4000,  -- Vigor Earring +1
        14725,  5000,  -- Melody Earring
        13325,  5000,  -- Fang Earring
        16009,  8000,  -- Pennon Earring
        13406,  15000,  -- Merman's Earring
        13434,  15000,  -- Triton Earring
        14762,  20000,  -- Attila's Earring
    };
    return stock;
end

local function earringsEx2(player, points)
    local stock = {
        13372,  5000, {GOLD},  -- Gold Earring +1
        13363,  5000, {BONE},  -- Tortoise Earring
        14711,  6000, {GOLD},  -- Allure Earring +1
        14710,  6000, {GOLD},  -- Mana Earring +1
        13369,  9000, {GOLD},  -- Spike Earring
        13418,  12000, {GOLD},  -- Eriss Earring
        14712,  25000, {GOLD, 12000},  -- Nimble Earring +1
        14713,  25000, {GOLD, 12000}, --Triumph Earring +1
        14714,  25000, {GOLD, 12000}, --Omniscient Earring +1
        14715,  25000, {GOLD, 12000}, --Adroit Earring +1
        14716,  25000, {GOLD, 12000}, --Communion Earring +1
        14717,  25000, {GOLD, 12000}, --Robust Earring +1
        14719,  25000, {GOLD, 12000}, --Heaven's Earring +1
        15994,  30000, {GOLD, 12000}, --Harmonius Earring
        16052,  35000, {GOLD, 12000}, --Incubus Earring
    };
    return special_stock(stock, points);
end



local function earrings(player, points)
    local stock = {
        13336,  200,  -- Onyx Earring
        13337,  200,  -- Opal Earring
        13327,  380,  -- Silver Earring
        13362,  380,  -- Bone Earring
        13328,  800,  -- Mythril Earring
        13323,  800,  -- Beetle Earring
        13323,  1350,  -- Beetle Earring
        13317,  1800,  -- Pearl Earring
        13320,  1800,  -- Black Earring
        14699,  2100,  -- Deft Earring +1
        14696,  2100,  -- Alacrity Earring +1
        14697,  2100,  -- Puissance Earring +1
        14700,  2100,  -- Solace Earring +1
        14701,  2100,  -- Verve Earring +1
        14698,  2100,  -- Wisdom Earring +1
    };
    return stock;
end

local function earringsEx(player, points)
    local stock = {
        14694,  500, {GOLD},  -- Energy Earring +1
        14695,  500, {GOLD},  -- Hope Earring +1
        13370,  650, {GOLD},  -- Silver Earring +1
        13362,  650, {BONE},  -- Bone Earring +1
        13371,  1200, {GOLD},  -- Mythril Earring +1
        13326,  1200, {BONE},  -- Beetle Earring +1
        14790,  1500, {GOLD},  -- Reraise Earring
        14702,  2500, {GOLD},  -- Aura Earring +1
        14703,  2500, {GOLD},  -- Loyalty Earring +1
        14720,  3200, {GOLD},  -- Morion Earring
        13322,  3200, {WEAV},  -- Wing Earring
        13361,  6000, {WEAV},  -- Drone Earring
    };
    return special_stock(stock, points);
end



local function headgear2(player, points)
    local stock = {
        12503,    4000,    -- Silk Headband
        12451,    4350,    -- Scorpion Mask
        16061,    4800,    -- Sipahi Turban
        13854,    4000,    -- Green Ribbon +1
        13878,    5400,    -- Carapace Helm
        13881,    6300,    -- Arhat's Jinpachi
        12446,    6800,    -- Tiger Helm
        12468,    6800,    -- Green Beret
        12504,    6800,    -- Rainbow Headband
        16128,    7200,    -- Wivre Hairpin
        12447,    7600,    -- Coeurl Mask
        13918,    8000,    -- Tiger Mask
        12141,    8500,    -- Ebon Beret
        12490,    9000,    -- Yasha Jinpachi
        15191,    11000,    -- Wise Cap +1
    };
    return stock;
end

local function headgearEx2(player, points)
    local stock = {
        16080,  4300, {WEAV},  -- Magi Hat
        16068,  6000, {WEAV},  -- Akinji Khud
        15206,  7000, {BONE},  -- Zeal Cap
        16112,  7800, {WEAV},  -- Tabin Beret +1
        13907,  8000, {LEAT},  -- Ogre Mask +1
        16131,  8500, {LEAT},  -- Wivre Mask +1
        15211,  8500, {BONE},  -- Reraise Hairpin
        15181,  9000, {WEAV},  -- Pineal Hat
        13929,  11000, {WEAV},  -- Errant Hat
        12120,  9000, {LEAT},  -- Ebon Mask
        13942,  11000, {LEAT},  -- Panther Mask
        13867,  11000, {LEAT},  -- War Beret +1
        13951,  13500, {WEAV},  -- Elite Beret
    };
    return special_stock(stock, points);
end

local function helmets2(player, points)
    local stock = {
        12439,   4500,    --Bascinet +1
        13848,   5500,    --Gilt Armet
        12423,   6800,    --Darksteel Armet +1
        13860,   7000,    --Dragon Mask +1
        12428,   8000,    --Celata
        12117,   9200,    --Ebon Armet
        13944,   9800,    --Gavial Mask +1
        13887,    11000,    -- Black Sallet
    };
    return stock;
end

local function helmetsEx2(player, points)
    local stock = {
        15206,  3900, {SMIT},  -- Luisant Salade
        11785,  9000, {GOLD},  -- Barone Zuchetto
        15193,  9000, {GOLD},  -- King's Armet
        13923,  12000, {BONE},  -- Demon Helm +1
        15210,  12000, {BONE},  -- Unicorn Cap +1
    };
    return special_stock(stock, points);
end





local function headgear(player, points)
    local stock = {
        12448,    60,    --Bronze Cap
        12472,    60,    --Circlet
        12440,    100,    --Leather Bandana
        12529,    150,    --Brass Hairpin +1
        12464,    200,    --Headgear
        12454,    300,    -- Bone Mask
        12457,    300,    -- Cotton Hachimaki
        15207,    400,    -- Trader's Chapeua
        12465,    550,    -- Cotton Headgear
        12474,    950,    -- Wool Hat
        12458,    1100,    -- Soil Hachimaki
        12442,    1300,    -- Studded Bandana
        12466,    1600,    -- Red Cap
        12443,    2200,    -- Cuir Bandana
        13832,    3100,    -- Banded Helm +1
        12541,    3500,    -- Wool Cap
    };
    return stock;
end

local function headgearEx(player, points)
    local stock = {
        12530,  380, {GOLD},  -- Sage's Circlet
        12536,  400, {WEAV},  -- Erudite's Headband
        15208,  550, {WEAV},  -- Baron's Chapeu
        13833,  680, {WEAV},  -- Noble's Ribbon
        15166,  1350, {GOLD},  -- Seer's Crown +1
        15172,  1500, {WEAV},  -- Noct Beret +1
        13883,  3200, {WEAV},  -- Corsair's Hat +1
        13885,  4800, {WEAV},  -- Juggler's Headband
        15243,  5800, {WEAV},  -- Raven Beret
        13939,  6000, {LEAT},  -- Austere Hat
    };
    return special_stock(stock, points);
end

local function helmets(player, points)
    local stock = {
        12487,   250,    --Faceguard +1
        12480,   380,    --Lizard Helm +1
        12524,   800,    --Iron Mask +1
        12533,   1900,    --Silver Mask +1
        13831,   2600,    --Sallet +1
        13847,   3900,    --Mythril Sallet +1
    };
    return stock;
end

local function helmetsEx(player, points)
    local stock = {
        15171,  1200, {SMIT},  -- Kampfschaller
        13865,  2000, {SMIT},  -- Zunari Kabuto +1
        15206,  3900, {SMIT},  -- Luisant Salade
    };
    return special_stock(stock, points);
end


local function clothing(player, points)
    local stock = {
        12600,    80,    --Robe
        12568,    100,    --Leather Vest
        12608,   200,    --Tunic
        12592,   280,   --Doublet
        12601,   330,   --Linen Robe
        12569,   650,   -- Lizard Jerkin
        13725,   780,   --Mage's Tunic
        12593,   950,   --Cotton Doublet
        12602,   1300,   --Wool Robe
        14424,   1550,   --Seer's Tunic
        12570,   1850,   --Studded Vest
        13750,   2100,   --Linen Doublet
        12610,   2350,   --Cloak
        12571,   3100,   --Cuir Boulli
        12603,   3100,   --Velvet Robe
        12572,   4100,   --Raptor Jerkin
    };
    return stock;
end

local function clothing2(player, points)
    local stock = {
        14543,    5000,    --Magi Coat
        13699,    6000,    --Beak Jerkin
        11351,    6800,    --Alacer Aketon +1
        11350,    6800,    --Styrne Byrnie +1
        11352,    6800,    --Vela Justaucorps +1
        13795,    7300,    --Arhat's Gi
        12574,    7300,    -- Tiger Jerkin
        14285,    8100,    -- Tundra Jerkin
        13775,    8100,    -- Blue Cotehardie
        13772,    9000,    -- Bloody Aketon
        13772,    9000,    -- Coeurl Jerkin
        14418,    9800,    -- Bison Jacket
        12177,    11000,    -- Ebon Frock
        14372,    13000,    -- Cardinal Vest
        14441,    15000,    -- Chausable
        13787,    15000,    -- Dalmatica
    };
    return stock;
end

local function clothingEx2(player, points)
    local stock = {
        13801,  6000, {WEAV},  -- Master's Gi +1
        11349,  6500, {WEAV},  -- Vivacity Coat +1
        14496,  6500, {BONE},  -- Healing Justaucorps
        13745,  6500, {BONE},  -- Justaucorps +1
        13755,  6800, {LEAT},  -- Flora Cotehardie
        13742,  7500, {LEAT},  -- Aketon +1
        14526,  8000, {LEAT},  -- Jaridah Peti
        14572,  8000, {WEAV},  -- Tabin Jupon +1
        13749,  9500, {WEAV},  -- Royal Cloak
        13770,  11000, {WEAV},  -- War Shinobi Gi +1
        14544,  11000, {LEAT},  -- Corselet +1
        14540,  13000, {WEAV},  -- Kyudogi +1
        13779,  25000, {WEAV, 15000},  -- Black Cloak
        12605,  25000, {WEAV, 15000},  -- Noble's Tunic
    };
    return special_stock(stock, points);
end

local function clothingEx(player, points)
    local stock = {
        12590,  650, {WEAV},  -- Power Gi
        14447,  900, {WEAV},  -- Baron's Saio
        14490,  1200, {WEAV},  -- Mana Tunic
        14493,  1650, {WEAV},  -- Healing Vest
        14434,  1800, {WEAV},  -- Noct Doublet +1
        13797,  2500, {WEAV},  -- Bishop's Robe +1
        13726,  3500, {WEAV},  -- Mage's Robe
        14491,  3500, {WEAV},  -- Mana Cloak
        14491,  3500, {WEAV},  -- Mana Cloak
        13753,  3600, {WEAV},  -- Wool Doublet +1
        11340,  4400, {WEAV},  -- Shinobi Gi +1
        12651,  4400, {WEAV},  -- White Cloak +1
        13733,  4900, {WEAV},  -- Salutary Robe +1
        14492,  5800, {WEAV},  -- High Mana Cloak
        14499,  6400, {WEAV},  -- Raven Jupon
        13814,  7000, {LEAT},  -- Austere Robe
    };
    return special_stock(stock, points);
end

local function armor(player, points)
    local stock = {
        12576,   100,   --Bronze Harness
        12577,   300,   -- Brass Harness
        12661,   400,   -- Solid Mail
        12582,   500,   -- Bone Harness
        12583,   700,   -- Beetle Harness
        12552,   950,   -- Chainmail
        12665,   1200,  --Brass Scale Mail +1
        12578,   1650,  --Padded Armor
        12666,   1650,  --Silver Mail +1
        13724,   2200,  --Breastplate +1
        13712,   3300,  --Carapace Harness
        12667,   4100,  --Banded Mail +1
        13737,   4800,  --Mythril Breastplate +1
    };
    return stock;
end

local function armor2(player, points)
    local stock = {
        12558,   5650,   --Royal Knight's Chainmail
        13789,   7100,   --Carapace Breastplate
        13738,   7100,   --Gilt Cuirass
        12580,   7800,   --Darksteel Harness
        13756,   8300,   --Darksteel Cuirass +1
        12581,   8300,   --Coral harness
        13768,   9200,   --Demon's Harness +1
        13758,   9200,   --King's Cuirass
        13762,   9200,   --Dragon Mail +1
        12153,   10000,   --Ebon Breastplate
        12156,   10000,   --Ebon Harness
        13747,   11000,   --Gavial Mail +1
        14383,   12000,   --Plastron +1
        13746,   13500,   --Gem Cuirass
    };
    return stock;
end

local function armorEx2(player, points)
    local stock = {
        12579, 7000, {BONE},  -- Scorpion Harness
        12555, 8000, {SMIT},  -- Haubergeon
        13741, 8000, {LEAT},  -- Byrnie +1
        12556, 9000, {SMIT},  -- Hauberk
        13823, 9000, {SMIT},  -- Regen Cuirass
        14390,   12000, {SMIT},   --Dragon Harness +1
        14449,   12000, {SMIT},   --Unicorn Harness +1
    };
    return special_stock(stock, points);
end

local function armorEx(player, points)
    local stock = {
        14495, 1000, {SMIT},  -- Bannaret Mail
        14495, 1000, {BONE},  -- Healing Harness
        14433, 1200, {BONE},  -- Shade Harness + 1
        14435, 1450, {SMIT},  -- Kampfbrust
        14445, 2900, {SMIT},  -- Luisant Haubert
        13710, 3200, {LEAT},  -- Brigandine Armor +1
        13813, 3500, {SMIT},  -- Divine Breastplate
        14497, 4500, {BONE},  -- High Healing Harness
    };
    return special_stock(stock, points);
end



local function bows2(player, points)
    local stock = {
        17240,  5000,    --Lightning Bow
        17157,  5400,    --Rapid Bow
        17205,  6800,    --Gendawa
        17200,  7200,    --Rosenbogen
    };
end

local function bowsEx2(player, points)
    local stock = {
        17241, 6500, {WOOD},  -- Lightning Bow +1
        17189, 7000, {WOOD},  -- Rapid Bow +1
        17189, 8000, {WOOD},  -- Gendawa +1
        17201, 9000, {WOOD},  -- Rosenbogen +1
    };
    return special_stock(stock, points);
end


local function bows(player, points)
    local stock = {
        17152,  100,    --Shortbow
        17160,  150,    --Longbow
        17153,  180,    --Self Bow
        17161,  330,    --Power Bow
        17154,  400,    --Wrapped Bow
        17162,  750,    --Great Bow
        17193,  1250,    --Shadow Bow
        17155,  1800,    --Composite Bow
        17163,  2500,    --Battle Bow
        17156,  3800,    --Kaman
        17164,  4200,    --War Bow
    };
end

local function bowsEx(player, points)
    local stock = {
        17175, 350, {WOOD},  -- Shortbow +1
        17177, 800, {WOOD},  -- Longbow +1
        17176, 800, {WOOD},  -- Selfbow +1
        17178, 1250, {WOOD},  -- Power Bow +1
        17172, 1450, {WOOD},  -- Wrapped Bow +1
        17194, 1500, {WOOD},  -- Shadow Bow +1
        17180, 1900, {WOOD},  -- Great Bow +1
        17179, 2450, {WOOD},  -- Composite Bow +1
        17181, 3800, {WOOD},  -- Battle Bow +1
        17182, 5000, {WOOD},  -- Kaman +1
        17173, 6800, {WOOD},  -- War Bow +1
    };
    return special_stock(stock, points);
end

local function arrows(player, points)
    local stock = {
        4219,  1,  --Stone Arrow Quiver
        4220,  125,  --Bone Arrow Quiver
        4225,  150,  --Iron Arrow Quiver
        17332,  2,  --Fang Arrow
        4221,  300,  --Beetle Arrow Quiver
        4226,  300,  --Silver Arrow Quiver
        4222,  400,  --Horn Arrow Quiver
        4223,  650,  --Scorpion Arrow Quiver
        18178,  9,  --Bodkin Arrow
        18730, 10, --Obsidian Arrow
        18697, 12, --Marid Arrow
        5332,  1300,  --Kabura Arrow Quiver
    };
    return stock;
end

local function arrowsEx(player, points)
    local stock = {
        18157,  3, {WOOD, 400},  --Poison Arrow
        5333,  1500,  {WOOD, 1200}, --Sleep Arrow Quiver
        17322,  10,  {WOOD, 3500}, --Fire Arrow
        17323,  10,  {WOOD, 3500}, --Ice Arrow
        18699,  10,  {WOOD, 3500}, --Earth Arrow
        18698,  10,  {WOOD, 3500}, --Water Arrow
        18700,  10,  {WOOD, 3500}, --Wind Arrow
        17324,  10,  {WOOD, 3500}, --Lightning Arrow
        18696,  4,  {WOOD, 7500}, --Paralysis Arrow
        17317,  3, {WOOD, 2225},  --Gold Arrow
        17334,  4, {WOOD, 4500},  --Platinum Arrow
        4224, 1100, {WOOD, 6000} --Demon Arrow Quiver
    };
    return special_stock(stock, points);
end


local function crossbows2(player, points)
    local stock = {
        17236,  5000,    --Leo Crossbow
        17220,  5500,    --Heavy Crossbow
        17242,  6250,    --Velocity Bow
        17213,  12000,    --Staurobow
    };
    return stock;
end

local function crossbowsEx2(player, points)
    local stock = {
        17237,  6250, {WOOD},  --Leo Crossbow +1
        17227,  7000, {WOOD},  --Heavy Crossbow +1
        17243,  8500, {WOOD},  --Velocity Bow +1
        17221,  20000, {WOOD, 9500},  --Repeating Crossbow [UPGRADE]
        17214,  25000, {WOOD, 9500},  --Staurobow +1
    };
    return special_stock(stock, points);
end

local function guns2(player, points)
    local stock = {
        17250,  5000,    --Matchlock Gun
        19226,  6000,    --Blunderbuss
        17222,  6500,    --Hexagun
        17251,  7800,    --Hellfire
        17262,  12000,    --Corsair's Gun
    };
    return stock;
end

local function gunsEx2(player, points)
    local stock = {
        17261,  6250, {SMIT},  --Matchlock Gun +1
        19227,  7250, {SMIT},  --Blunderbuss +1
        18687,  8000, {SMIT},  --Hexagun +1
        17264,  11000, {SMIT, 9000},  --Hellfire +1
        19206,  20000, {GOLD, 9000},  --Silver Cassandra [UPGRADE]
        17252,  30000, {SMIT, 10000},  --Culverin [UPGRADE]
    };
    return special_stock(stock, points);
end

local function crossbows(player, points)
    local stock = {
        17228,  100,    --Light Crossbow +1
        17217,  200,    --Crossbow
        17218,  1200,    --Zamburak
        19231,  3400,    --Tracker's Bow
        17219,  4400,    --Arbalest
    };
    return stock;
end

local function crossbowsEx(player, points)
    local stock = {
        17228,  200, {WOOD},  --Light Crossbow +1
        17225,  300, {WOOD},  --Crossbow +1
        17229,  2000, {WOOD},  --Zamburak +1
        19241,  4800, {WOOD},  --Tracker's Bow +1
        17226,  600, {WOOD},  --Arbalest +1
    };
    return special_stock(stock, points);
end

local function guns(player, points)
    local stock = {
        19224,  150,    --Musketoon
        17257,  250,    --Bandit's Gun
        17265,  250,    --Tanegashima
        17248,  400,    --Arquebus
        17259,  650,    --Priate's Gun
        18715,  1000,    --Mars's Hexagun
        18704,  2000,    --Darksteel Hexagun
        17267,  2800,    --Negoroshiki
        18710,  4400,    --Seadog Gun
    };
    return stock;
end

local function gunsEx(player, points)
    local stock = {
        19225,  250, {SMIT},  --Musketoon +1
        17258,  350, {SMIT},  --Bandit's Gun +1
        17266,  350, {SMIT},  --Tanegashima +1
        17254,  550, {SMIT},  --Arquebus +1
        17260,  950, {SMIT},  --Pirate's Gun +1
        18716,  1500, {SMIT},  --Mars's Hexagun +1
        18705,  3000, {SMIT},  --Darksteel Hexagun +1
        17268,  3800, {SMIT},  --Negoroshiki +1
        18711,  6000, {SMIT},  --Seadog Gun +1
    };
    return special_stock(stock, points);
end

local function bolts(player, points)
    local stock = {
        17339,  1,  --Bronze Bolt
        18150,  1,  --Blind Bolt
        18148,  2,  --Acid Bolt
        18149,  2,  --Sleep Bolt
        18190,  1,  --Dogbolt +1
        18151,  4,  --Bloody Bolt
        18152,  3,  --Venom Bolt
        18191,  1,  --Dogbolt +2
        18153,  3,  --Holy Bolt
        18192,  2,  --Dogbolt +3
        17337,  4,  --Mythril Bolt
        18193,  2,  --Dogbolt +4
        19200,  5,  --Black Bolt
    };
    return stock;
end

local function drinks(player, points)
    local stock = {
        4387,    30,     --Selbina Milk
        16223,    450,     --Orange Tank
        16224,    650,     --Apple Tank
        16226,    900,     --Pamama Tank
        16225,    1200,     --Pear Tank
        16227,    2200,     --Persikos Tank
        4442,    125,     --Pineapple Juice
        4558,    500,     --Yagudo Drink
        5932,    1150,     --Kitron Juice
    };
    return stock;
end

local function drinksEx(player, points)
    local stock = {
        5570,  400, {COOK, 1000},  --Chai +1
        4286,  500, {COOK, 2000},  --Healing Tea
        4541,  580, {COOK, 2500},  --Goblin Drink
        5593,  600, {COOK, 3000},  --Imperial Coffee +1
        4524,  725, {COOK, 3500},  --Royal Tea
        5927,  750, {COOK, 4000},  --Caravan Tea
        6257,  790, {COOK, 4500},  --Jungle Nectar
        4283,  850, {COOK, 5000},  --Choco Delight
    };
    return special_stock(stock, points);
end

local function coins(player, points)
    local stock = {
        4378,    100,     --Beastcoin
        750,    250,     --Silver Beastoin
        749,    500,     --Mythril Beastoin
        748,    1000,     --Gold Beastoin
        751,    2500     --Platinum Beastoin
    };
    return stock;
end


local function bullets(player, points)
    local stock = {
        17343,  2,  --Bronze Bulet
        19229,  3,  --Tin Bullet
        18713,  3,  --Copper Bullet
        17340,  6,  --Bullet
        18160,  6,  --Spartan Bullet
        19228,  8,  --Paktong Bullet
        17276,  8,  --Antq Bul +1
        17300,  10, --Plat Bullet
        17312,  10, --Iron Bullet
        17341,  15, --Silver Bullet
    };
    return stock;
end

local function medicine(player, points)
    local stock = {
        4112,  150,  --Potion
        4116,  300,  --Hi-Potion
        4120,  600,  --X-Potion
        4124,  1000,  --Max Potio
        4128,  250,  --Ether
        4132,  500,  --Hi-Ether
        4136,  900,  --Super-Ether
        4140,  1800,  --Pro-Ether
        4148,  200,  --Antidote
        4150,  350,  --Eye Drops
        4158,  600,  --Echo Drops
        4154,  800,  --Holy Water
        5418,  800,  --Tincture
        4155,  1500,  --Remedy
        4164,  500,  --Prism Powder
        4165,  500,  --Silent Oil
    };
    return stock;
end

local function medicineEx(player, points)
    local stock = {
        4115,  240, {ALCH, 1000},  --Potion +3
        4119,  450, {ALCH, 2500},  --Hi-Potion +3
        4123,  780, {ALCH, 4500},  --X-Potion +3
        4125,  1250, {ALCH, 6500},  --Max-Potion +1
        4126,  1500, {ALCH, 8500},  --Max-Potion +2
        4127,  1750, {ALCH, 10000},  --Max-Potion +3
        4131,  380, {ALCH, 1300},  --Ether +3
        4135,  780, {ALCH, 1300},  --Hi-Ether +3
        4139,  1350, {ALCH, 1300},  --Super Ether +3
        4143,  2650, {ALCH, 1300},  --Pro Ether +3
        4149,  3500, {ALCH, 8000},  --Panacea
    };
    return special_stock(stock, points);
end



local function daggers2(player, points)
    local stock = {
        16468,  4800,    --Darksteel Knife
        19103,  5200,    --Darksteel Jambiya
        17612,  5400,    --Beetle Knife
        16759,  6000,    --Darksteel Kris
        16476,  6300,    --Darksteel Kukri
        16477,  6600,    --Cermet Kukri
        16505,  7000,    --Venom Kukri
        16453,  3000,    --Orichalcum Dagger
        17620,  10000,    --Misericorde
        17621,  15000,    --Gully +1
    };
    return stock;
end

local function daggersEx2(player, points)
    local stock = {
        16751,  5800, {SMIT},  --Darksteel Knife +1
        16762,  6400, {ALCH},  --Venom Knife +1
        19104,  7400, {SMIT},  --Darksteel Jambiya +1
        17613,  6000, {BONE},  --Beetle Knife +1
        16760,  7200, {SMIT},  --Darksteel Kris +1
        16761,  8000, {ALCH},  --Venom Kris +1
        16763,  8000, {SMIT},  --Darksteel Kukri +1
        17603,  8000, {ALCH},  --Cermet Kukri +1
        16510,  8500, {ALCH},  --Venom Baselard +1
        17604,  9500, {ALCH},  --Venom Kukri +1
        17992,  3000, {GOLD},  --Triton's Dagger
        17620,  13000, {SMIT, 10000},  --Triton's Dagger
        18032,  30000, {ALCH, 10000},  --Adder Jambiya [UPGRADE]
        17625,  13000, {ALCH, 10000},  --Ponderous Gully
    };
    return special_stock(stock, points);
end


local function daggers(player, points)
    local stock = {
        16448,  100,    --Bronze Dagger
        16449,  200,    --Brass Dagger
        16450,  325,    --Dagger
        16455,  580,    --Baselard
        16473,  800,    --Kukri
        16451,  1000,    --Mythril Dagger
        19119,  1250,    --Ranging Knife
        16460,  2000,    --Kris
        17630,  2400,    --Hawker's Knife
        16467,  2600,    --Mythril Knife
        16475,  3000,    --Mythril Kukri
        17610,  3800,    --Bone Knife
    };
    return stock;
end

local function daggersEx(player, points)
    local stock = {
        16492,  200, {SMIT},  --Bronze Dagger +1
        16493,  500, {ALCH},  --Blind Dagger +1
        16740,  350, {GOLD},  --Brass Dagger +1
        16736,  500, {SMIT},  --Dagger +1
        16508,  800, {ALCH},  --Silence Dagger +1
        16737,  800, {SMIT},  --Baselard +1
        16748,  1200, {SMIT},  --Kukri +1
        16741,  1500, {ALCH},  --Poison Dagger +1
        17606,  2000, {ALCH},  --Corrosive Dagger
        16738,  1750, {SMIT},  --Mythril Dagger +1
        16489,  3000, {ALCH},  --Poison Kukri +1
        19127,  2000, {BONE},  --Ranging Knife +1
        16749,  3000, {SMIT},  --Kris +1
        17631,  3800, {ALCH},  --Hawker's Knife +1
        16494,  4800, {ALCH},  --Corrosive Kukri
        17611,  5000, {BONE},  --Bone Knife +1
    };
    return special_stock(stock, points);
end

local function default_error(player, points)
    return false;
end



local funcs = {
    ["earrings"] = earrings, ["earrings2"] = earrings2, ["earringsEx"] = earringsEx, ["earringsEx2"] = earringsEx2,
    ["rings"] = rings, ["rings2"] = rings2, ["rings3"] = rings3, ["ringsEx"] = ringsEx, ["rings2Ex"] = rings2Ex, ["rings3Ex"] = rings3Ex,
    ["grips"] = grips, ["gripsEx"] = gripsEx,
    ["feet"] = feet, ["feet2"] = feet2, ["feetEx"] = feetEx, ["feetEx2"] = feetEx2,
    ["hands"] = hands, ["hands2"] = hands2, ["handsEx"] = handsEx, ["handsEx2"] = handsEx2,
    ["legs"] = legs, ["legsE2"] = legs2, ["legsEx"] = legsEx, ["legsEx2"] = legsEx2,
    ["back"] = back, ["back2"] = back2, ["backEx"] = backEx, ["backEx2"] = backEx2,
    ["belts"] = belts, ["belts2"] = belts2, ["beltsEx"] = beltsEx, ["beltsEx2"] = beltsEx2,
    ["neck"] = neck, ["neck2"] = neck2, ["neckEx"] = neckEx, ["neckEx2"] = neckEx2,
    ["headgear"] = headgear, ["headgear2"] = headgear2, ["headgearEx"] = headgearEx, ["headgearEx2"] = headgearEx2,
    ["helmets"] = helmets, ["helmets2"] = helmets2, ["helmetsEx"] = helmetsEx, ["helmetsEx2"] = helmetsEx2,
    ["clothing"] = clothing, ["clothing2"] = clothing2,
    ["clothingEx"] = clothingEx, ["clothingEx2"] = clothingEx2,
    ["armor"] = armor, ["armor2"] = armor2, ["armorEx"] = armorEx, ["armorEx2"] = armorEx2,
    ["shields"] = shields, ["shieldsEx"] = shieldsEx, ["shields2"] = shields2, ["shields2Ex"] = shields2Ex,
    ["throwing"] = throwing,
    ["coins"] = coins,
    ["drinks"] = drinks, ["drinksEx"] = drinksEx,
    ["bows"] = bows, ["bows2"] = bows2, ["bowsEx"] = bowsEx, ["bowsEx2"] = bowsEx2,
    ["arrows"] = arrows, ["arrowsEx"] = arrowsEx,
    ["crossbows"] = crossbows, ["crossbows2"] = crossbows2, ["crossbowsEx"] = crossbowsEx, ["crossbowsEx2"] = crossbowsEx2,
    ["bolts"] = bolts,
    ["guns"] = guns, ["guns2"] = guns2, ["gunsEx"] = gunsEx, ["gunsEx2"] = gunsEx2,
    ["bullets"] = bullets,
    ["daggers"] = daggers, ["daggers2"] = daggers2, ["daggersEx"] = daggersEx, ["daggersEx2"] = daggersEx2,
    ["swords"] = swords, ["swordsEx"] = swordsEx, ["swords2"] = swords2, ["swords2Ex"] = swords2Ex,
    ["clubs"] = clubs, ["clubs2"] = clubs2, ["clubsEx"] = clubsEx, ["clubsEx2"] = clubsEx2,
    ["staves"] = staves, ["staves2"] = staves2, ["stavesEx"] = stavesEx, ["stavesEx2"] = stavesEx2,
    ["axes"] = axes, ["axes2"] = axes2, ["axesEx"] = axesEx, ["axesEx2"] = axesEx2,
    ["katanas"] = katanas, ["katanas2"] = katanas2, ["katanasEx"] = katanasEx, ["katanasEx2"] = katanasEx2,
    ["knuckles"] = knuckles, ["knuckles2"] = knuckles2, ["knucklesEx"] = knucklesEx, ["knucklesEx2"] = knucklesEx2,
    ["polearms"] = polearms, ["polearms2"] = polearms2, ["polearmsEx"] = polearmsEx, ["polearmsEx2"] = polearmsEx2,
    ["scythes"] = scythes, ["scythes2"] = scythes2, ["scythesEx"] = scythesEx, ["scythesEx2"] = scythesEx2,
    ["greatswords"] = greatswords, ["greatswords2"] = greatswords2, ["greatswordsEx"] = greatswordEx, ["greatswordsEx2"] = greatswordsEx2,
    ["greatkatanas"] = greatkatanas,
    ["greataxes"] = greataxes, ["greataxes2"] = greataxes2, ["greataxesEx"] = greataxesEx, ["greataxesEx2"] = greataxesEx2,
    ["misc"] = misc,
    ["jugs"] = jugs, ["jugs2"] = jugs,
    ["treats"] = treats,
    ["instruments"] = instruments, ["instrumentsEx"] = instrumentsEx,
    ["boomerangs"] = boomerangs,
    ["medicine"] = medicine, ["medicineEx"] = medicineEx,
    ["accuracyFood"] = accuracyFood, ["accuracyFoodEx"] = accuracyFoodEx, ["attackFood"] = attackFood, ["attackFoodEx"] = attackFoodEx, ["magicFood"] = magicFood, ["magicFoodEx"] = magicFoodEx, ["miscFood"] = miscFood, ["miscFoodEx"] = miscFoodEx, ["hybridFood"] = hybridFood, ["hybridFoodEx"] = hybridFoodEx, ["defenseFood"] = defenseFood, ["defenseFoodEx"] = defenseFoodEx,
    ["dice1"] = dice1, ["dice2"] = dice2,
    ["sch1"] = sch1, ["sch2"] = sch2,
    ["smn1"] = smn1,
    ["red1"] = red1, ["red2"] = red2, ["dark1"] = dark1,
    ["nin1"] = nin1, ["nin2"] = nin2, ["tools"] = tools,
    ["bard1"] = bard1, ["bard2"] = bard2, ["bard3"] = bard3, ["bard4"] = bard4, ["bard5"] = bard5,
    ["black1"] = black1, ["black2"] = black2, ["black3"] = black3, ["black4"] = black4, ["black5"] = black5,
    ["white1"] = white1, ["white2"] = white2, ["white3"] = white3, ["white4"] = white4, ["white5"] = white5, ["white6"] = white6, ["white7"] = white7,
    ["darkAttachments"] = darkAttachments, ["lightAttachments"] = lightAttachments, ["fireAttachments"] = fireAttachments,
    ["thunderAttachments"] = thunderAttachments, ["waterAttachments"] = waterAttachments, ["earthAttachments"] = earthAttachments,
    ["windAttachments"] = windAttachments, ["iceAttachments"] = iceAttachments, ["automatonParts"] = automatonParts,
    ["puppetmasterEquipment"] = pupEquipment,
};

local function getGuildPoints(player)
    return {
        ["fishing"] = player:getCurrency("guild_fishing"),
        ["woodworking"] = player:getCurrency("guild_woodworking"),
        ["smithing"] = player:getCurrency("guild_smithing"),
        ["goldsmithing"] = player:getCurrency("guild_goldsmithing"),
        ["weaving"] = player:getCurrency("guild_weaving"),
        ["leathercraft"] = player:getCurrency("guild_leathercraft"),
        ["bonecraft"] = player:getCurrency("guild_bonecraft"),
        ["alchemy"] = player:getCurrency("guild_alchemy"),
        ["cooking"] = player:getCurrency("guild_cooking")
    };
end


function onTrigger(player, shop)
    local id = player:getZoneID();
    local stock = false;
    if (id < 230 or id > 250) then
        return
    end

    local points = getGuildPoints(player);

    local result = funcs[shop];
    if (result == nil) then
        stock = false;
    else
        stock = result(player, points);
    end

    if ( stock == false or next(stock) == nil ) then
        return;
    end
    
    showShop(player, 7, stock);

    
end;

