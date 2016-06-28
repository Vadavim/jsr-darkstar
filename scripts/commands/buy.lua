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

        if (points[skill] > threshold) then
            table.insert(newStock, id);
            table.insert(newStock, cost);
        end
    end
    return newStock;
end


local function automatonParts(player, points)
    local stock = {
        8193,   2500,    --Valoredge Head
        8225,   5000,    --Valoredge Frame
        8195,   2500,    --Sharpshot Head
        8226,   5000,    --Sharpshot Frame
        8196,   2500,    --Stormwaker Head
        8227,   5000,    --Stormwaker Frame
        8197,   8000,    --Soulsoother Head
        8198,   8000,    --Spiritreaver Head
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
        4896,   5000,   --Fire Spirit
        4897,   5000,   --Ice Spirit
        4898,   5000,   --Air Spirit
        4899,   5000,   --Earth Spirit
        4900,   5000,   --Thunder Spirit
        4901,   5000,   --Water Spirit
        4902,   15000,   --Light Spirit
        4903,   15000,   --Dark Spirit
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
        17860,  20,{COOK, 400},  --Carrot
        17864,  20,{COOK, 400},  --Herbal
        17876,  20, {COOK, 400}, --Fish
        17877,  55, {COOK, 1100}, --Fish Oil
        17822,  35, {COOK, 700}, --Alchemist's
        17905,  35, {COOK, 800}, --Wormy
        17868,  50, {COOK, 1000}, --Humus
        17870,  80, {COOK, 1600}, --Meat
        17885,  65, {COOK, 1300}, --Grass
        17862,  90, {COOK, 1800}, --Bug
        17866,  110,{COOK, 2200},     --Carrion
        17880,  110,{COOK, 2200},     --Seedbed
        17887,  125,{COOK, 2500},     --Mole
        17872,  145,{COOK, 2900},     --Tree
        17891,  155,{COOK, 3100}     --Antica
    };
    return special_stock(stock, points);
end

local function jugs2(player, points)
    local stock = {
        17861,  170,{COOK, 3400},     --Famous Carrot
        17865,  170,{COOK, 3400},     --Singing Herbal
        17889,  190,{COOK, 3700},     --Blood
        17869,  240,{COOK, 4800},     --Rich Humus
        17871,  240,{COOK, 4800},     --Warm Meat
        17863,  270,{COOK, 5400},     --Quadav
        17867,  270,{COOK, 5400},     --Cold Carrion
        17886,  270,{COOK, 5400},     --Noisy Grass
        17888,  270,{COOK, 5400},     --Lively Mole
        17873,  320,{COOK, 6400},     --Scarlet Sap
        17890,  350,{COOK, 7000},     --Clear Blood
        17892,  350,{COOK, 7000},     --Fragrant Antica
        17884,  400,{COOK, 8000}    --Sun Water
    };
    return special_stock(stock, points);
end

local function treats(player, points)
    local stock = {
        17016,  10, {FOOD, 0},  --Pet Food Alpha
        17017,  20, {FOOD, 500}, --Pet Food Beta
        17018,  40, {FOOD, 1500}, --Pet Food Gamma
        17019,  60, {FOOD, 3000}, --Pet Food Delta
        17020,  80, {FOOD, 5000}, --Pet Food Epsilon
        17021,  100, {FOOD, 7000} --Pet Food Zeta
    };
    return special_stock(stock, points);
end

local function greataxes(player, points)
    local stock = {
        16716,  200,    --Butterfly Axe +1
        16713,  400,    --Hellfire Axe
        16717,  650,    --Greataxe +1
        16714,  980,    --Neckchopper
        18212,  1200,   --Military Axe
        18215,  1650,   --Voulge +1 > Horror Voulge
        16718,  2000,   --Heavy Axe +1
        16721,  2300,   --Huge Moth Axe
        18210,  2650,   --Raifu
        18509,  3300,   --Tewhatewha +1
        16710,  3750,   --Gigant Axe
        18219,  4800,   --Leucous Voulge +1
    };
    return stock;
end

local function knuckles(player, points)
    local stock = {
        16690,  150,    --Cesti +1 >Cougar Bag
        16640,  250,    --Bronze Knuckles +1 > Snic Knuckles
        16441,  380,    --Brass Bag +1
        16398,  525,    --Burning Cesti
        16701,  800,    --Strike Baghnakhs
        16437,  1000,   --Metal Knuckles +1
        16700,  1350,   --Poison Cesti +1
        16703,  1900,   --Impact Knuckles
        16439,  2300,   --Poison Claws +1
        17487,  2800,   --Corrosive Claws
        16696,  3400,   --Patas +1
        17472,  4200,   --Cross Counters
    };
    return stock;
end

local function spears(player, points)
    local stock = {
        16862,  150,    --Harpoon +1
        16859,  250,    --Bronze Spear +1 > Wind Spear
        16864,  380,    --Brass Spear +1
        16863,  700,    --Cruel Spear
        16865,  1000,   --Spear +1
        18090,  1350,   --Military Spear
        16853,  1700,   --Lizard Piercer
        16876,  2100,   --Lance +1
        16891,  2500,   --Obelisk Lance +1
        16867,  2900,   --Orc Piercer
        16837,  3400,   --Trident
        16877,  4200,   --Mythril Lance +1
    };
    return stock;
end

local function scythes(player, points)
    local stock = {
        16778,  100,    --Bronze Zaghnal +1
        16772,  250,    --Brass Zaghnal +1
        18039,  400,    --Republic Scythe
        16773,  800,    --Cruel Scythe
        16784,  1000,   --Frostreaper
        18037,  1300,   --Federation Scythe
        16785,  1600,   --Harvester
        16782,  2000,   --Mythril Scythe +1
        16797,  2400,   --Mythril Zaghnal +1
        18051,  2900,   --Antlion Sickle
        16771,  3400,   --Falcastra
        16786,  4000,   --Barbarian's Scythe
    };
    return stock;
end

local function greatswords(player, points)
    local stock = {
        16606,  100,    --Rusty Greatsword
        16638,  250,    --Claymore +1
        16929,  400,    --Burning Claymore
        19160,  650,    --Estramacon
        16934,  800,    --Braveheart
        16931,  1000,   --Two-handed Sword +1
        16928,  1250,   --Hellfire Sword
        16936,  1650,   --Demonic Sword
        16639,  1950,   --Fine Claymore
        16937,  2350,   --Ice Brand
        18369,  3150,   --Gust Sword +1
        19150,  4250,   --Cobra Unit Claymore
    };
    return stock;
end

local function greatkatanas(player, points)
    local stock = {
        16981,  300,    --Tachi +1
        16978,  550,    --Uchigatana +1
        16983,  850,    --Nodachi +1
        16987,  1100,   --Okanehira
        16988,  1400,   --Kotetsu
        16986,  1900,   --Homura +1
        17800,  2450,   --Hosodachi +1
        16989,  2900,   --Mikazuki +1
        16991,  3200,   --Odenta
        16965,  4300,   --Koryukagemitsu
    };
    return stock;
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
        15416,  4800,   --junior msk. tuck → tck +2
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
        17087,  150,    --Maple Wand +1
        17138,  250,    --Willow Wand +1
        17149,  350,    --Brass Hammer +1
        17445,  500,    --Federation Club
        17048,  680,    --Decurion's Hammer
        17140,  850,    --Yew Wand +1
        17115,  1200,   --Warhammer +1
        17076,  1450,   --Earth Wand
        17414,  1900,   --Pixie Mace
        17442,  2200,   --Eremite's Wand+1
        17449,  2450,   --Kingdom Mace
        17040,  9000,   --Warp Cudgel
        17411,  3000,   --Holy Mace +1
        17143,  3400,   --Rose Wand +1
        17072,  4000,   --Lilith's Wand
        17083,  4000,   --Time Hammer
    };
    return stock;
end

local function staves(player, points)
    local stock = {
        17123,  100,    --Ash Staff +1 >Chanter's Staff
        17122,  200,    --Ash Pole +1
        17125,  350,    --Holly Staff +1 >Misery Staff
        17124,  480,    --Holly Pole +1 >Pastoral Staff
        17126,  750,    --Elm Staff +1 >Himmel Stock
        17425,  1100,   --Spiked Club +1
        17134,  1300,   --Dolphin Staff >Whale Staff +1
        17119,  1650,   --Elm Pole +1
        17120,  2000,   --Oak Pole +1
        17524,  2450,   --Footman's Staff
        17135,  3200,   --Walrus Staff
    };
    return stock;
end

local function axes(player, points)
    local stock = {
        16646,  100,    --Bronze Axe +1
        16661,  225,    --Brass Axe +1 >Tabar+1
        16666,  480,    --Bone Axe +1
        16663,  850,    --Battleaxe +1
        16664,  1200,   --War Pick +1
        16673,  1600,   --Warrior's Axe
        16665,  2100,   --Mythril Axe +1
        16675,  2800,   --Storm Axe
        16676,  5200,   --Viking Axe
        16670,  3400,   --Mythril Pick +1
    };
    return stock;
end

local function katanas(player, points)
    local stock = {
        16914,  150,    --Kunai +1
        16918,  250,    --Wakazashi +1
        16920,  400,    --Shinobi-gatana +1
        16917,  700,    --Suzume
        17777,  1000,   --Hibari +1
        16927,  1300,   --Busuto +1
        16921,  1700,   --Kodachi +1
        19281,  2300,   --Midare +1
        16926,  3000,   --Bokuto +1
        17768,  3800,   --Yoto +1
        17796,  4400,   --Sai +1
        18411,  5000,   --Buboso
        16897,  5000,   --Kagboshi
    };
    return stock;
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
        12360,  15000, {WOOD},    --Tatami Shield
        16179,  13000, {SMIT},    --Airy Buckler
        12388,  14500, {SMIT},    --Kaiser Shield
        16162,  16000, {SMIT},    --Tariqah
        16180,  18000, {WOOD},    --Harpy Shield
        16162,  19000, {SMIT},    --Acheron's Shield
        16164,  28000, {SMIT},    --Tariqah +1
        12386,  38000, {SMIT},    --Acheron's Shield +1
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

local function neck(player, points)
    local stock = {
        0x3319,   100,    --Leather Gorget
        0x330f,   150,    --Scale Gorget
        0x3fad,   1200,   --Focus Collar
        0x3305,   2100,   --Spike Necklace
        0x330c,   900,    --Hemp Gorget +1
        0x330e,   1200,   --Wolf Gorget +1
        0x336c,   2800,   --Agile Gorget
        0x336d,   4200,   --Jagd Gorget
        0x3f86,   4200,   --Mohbwa Scarf +1
        0x3358,   5000,   --Wing Gorget
        0x3f88,   5000,   --Beak Necklace +1
    };
    return stock;
end

local function back(player, points)
    local stock = {
        0x350f,   120,    --Cape
        0x351a,   80, --Rabbit Mantle
        0x3528,   225,    --Lizard Mantle +1
        0x3510,   225,    --Cotton Cape
        0x3c7e,   350,    --Breath Mantle
        0x3529,   600,    --Wolf Mantle +1
        0x352a,   1500,   --Black Cape +1
        0x3511,   1500,   --White Cape +1
        0x3c7f,   1500,   --High Breath Mantle
        0x3544,   1500,   --Cavalier's Mtle +1
        0x352b,   2200,   --Red Cape +1
        0x351e,   3000,   --Bat Cape
        0x356c,   3000,   --Heavy Mante
        };
    return stock;
end

local function hands(player, points)
    local stock = {
        12696,  100,    --Leather Gloves
        12736,  100,    --Mitts >Seer's Mitts +1
        12778,  250,    --Linen Cuffs +1 >Concealing Cuffs
        12785,  350,    --Fine Gloves
        12789,  550,    --Beetle Mittens +1 >Combat Mitts +1
        14863,  800,    --Kampfhentzes
        12726,  1500,   --Gigas Bracelets
        12793,  2000,   --Mage's Cuffs
        12791,  2250,   --Gauntlets +
        14052,  2750,   --Luisant Moufles
        12795,  3100,   --Dino Gloves
        13958,  4000,   --Mythril Gauntts +1
        12794,  4000,   --Mage's Mitts
    };
    return stock;
end

local function belts(player, points)
    local stock = {
        13192,  75, --Leather Belt >Warrior's Belt +1
        13226,  300,    --Blood Stone +1 >Augment +5 HP
        15889,  500,    --Augmentig Belt
        13190,  500,    --Heko Obi +1 >Gold Obi +1
        13181,  350,    --Lizard Belt +1
        15906,  900,    --Mohbwa Sash +1 >Qiqirn Sash +1
        13213,  900,    --Chain Belt +1
        13272,  2000,   --Corsette +1
        15290,  3500,   --Haste Belt
        15286,  5000,   --Tilt Belt >Life Belt
        15434,  3000,   --Vanguard Belt
        13220,  3000,   --Royl Kgt Belt
        15945,  2500,   --Volant Belt
    };
    return stock;
end

local function legs(player, points)
    local stock = {
        12824,  125,    --Leather Trousers >Cuir Trousers +1
        12898,  200,    --Slacks +1 >Mage's Slacks
        12912,  650,    --Bone Subligar +1
        15405,  900,    --Baron's Slops
        12808,  1200,   --Chain Hose +1
        14328,  2250,   --Seer's Slacks +1
        14332,  2250,   --Kampfdiechlings
        12910,  2500,   --Strong Trousers >Magic Cuisses
        12891,  3200,   --Iron Subligar +1
        12918,  3800,   --Mage's Slops
        12919,  4800,   --Dino Trousers
        14211,  6400,   --ythril Cuisses +1
        12926,  7000,   --White Slacks +1
    };
    return stock;
end


local function feet(player, points)
    local stock = {
        12952,  70, --Leather Highboots
        13027,  250,    --Brass Leggins +1
        12991,  250,    --Holly Clogs +1
        13052,  900,    --Light Soleas >Air Solea +1
        13042,  500,    --Bone Leggings +1 >Mettle Leggings +1
        13048,  800,    --Mage's Sandles >Seer's Pumps +1
        14133,  1200,   --Winged Boots +1
        15321,  1600,   --Kampfschuhs
        13041,  2400,   --Cuir Highboots +1
        13023,  2400,   --Ebony Sabots +1
        13715,  3200,   --Carapace Legs +1
        14086,  3800,   --Mythril Legs +1
        13050,  4000,   --Mocassins +1
    };
    return stock;
end

local function earrings(player, points)
    local stock = {
        14694,  1500,   --Energy Ear +1 >Astral Earring
        14695,  1500,   --Hope Ear +1 >Bloodbead Ear
        13370,  800,    --Silver Ear +1
        13362,  1800,   --Bone Ear +1
        13326,  2500,   --Beetle Ear +1
        13371,  1400,   --Myhril Ear +1
        14760,  3000,   --Cunning Ear >Morion Ear +1
        13322,  4500,   --Wing Earring
        14769,  3000,   --Buckler Ear
        14766,  3000,   --Geist Ear
        14711,  7000,   --Allure Ear +1
        14710,  7000,   --Mana Ear +1
    };
    return stock;
end

local function hats(player, points)
    local stock = {
        0x2FD0,   150,    --Leather Bandana >Kingdom Bandana
        0x30D1,   250,    --Brass Hairpin >augment
        0x30F2,   900,    --Sage's Circlet
        0x30D2,   400,    --Cotton Headband >Blink Band
        0x3609,   400,    --Noble's Ribbon >Rival Ribbon
        0x3B68,   1200,   --Baron's Chap >Penance Hat
        0x25E5,   5500,   --Precision Bandana
        0x3B3E,   4200,   --Seer's Crown +1
        0x3600,   1200,   --Strong Bandana
        0x3B42,   8000,   --Blink Band
    };
    return stock;
end

local function helmets(player, points)
    local stock = {
        0x3090,   250,    --Faceguard >augment
        0x30C0,   650,    --Lizard Helm +1
        0x3603,   900,    --Beetle Mask +1
        0x30F5,   2200,   --Silver Mask +1
        0x3607,   3200,   --Sallet +1
    };
    return stock;
end


local function clothing(player, points)
    local stock = {
        0x3118,   300,    --Leather Vest
        0x3148,   500,    --Tunic +1
        0x389a,   2500,    --  Mana Cloak>High Mana Cloak, --Mana Tunic
        0x312f,   1000,   --Doublet +1
        0x3581,   1800,   --Fine Jerkin
        0x386f,   2500,   --Baron's Saio
        0x35a3,   4000,   --Faerie Tunic
        0x358b,   5200,   --Strong Vest
        0x2c4b,   6300,   --Channeling Robe
        0x2c54,   10000,  --Salutary Robe +1
        0x359f,   12500,  --Dino Jerkin
        0x316b,   17000,  --White Cloak +1
    };
    return stock;
end

local function armor(player, points)
    local stock = {
        0x3175,   1000,   --Solid Mail
        0x3117,   4000,   --Steam Scale Mail
        0x3595,   3200,   --Beetle Harness
        0x3177,   7000,   --Strong Harness
        0x389f,   1500,   --Healing Harness >High Heal Harness
        0x3592,   11000,  --Carapace Harness +1
        0x35a9,   15000,  --Mithril Breaste+1
        0x359c,   9000,   --Breastplate +1
        0x358d,   8000,   --Cuir Bouilli +1 >Brigandine Armor +1
    };
    return stock;
end

local function bows(player, points)
    local stock = {
        17160,  100,    --Longbow
        17176,  250,    --Self Bow +1
        17183,  400,    --Hunter's Longbow
        17178,  700,    --Power Bow +1
        17172,  1000,   --Wrapped Bow +1
        17180,  1600,   --Great Bow +1
        17181,  2500,   --Battle Bow +1
        17173,  4000,   --War Bow +1
    };
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

local function crossbows(player, points)
    local stock = {
        17228,  150,    --Light Crossbow +1
        17217,  300,    --Crossbow
        17211,  600,    --Almogavar Bow
        17230,  1000,   --Power Crossbow
        17229,  1600,   --Zamburak +1
        17247,  2000,   --Rikondo
        19241,  3200,   --Tracker's Bow +1
        17226,  4500,   --Arbalest +1
    };
    return stock;
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
        0x1146,    40,     --Orange Juice
        0x1147,    60,     --Apple Juice
        0x115A,    100,     --Pineapple Juice
        0x1148,    180,     --Melon Juice
        0x1149,    300,     --Tomato Juice
        0x1159,    500,     --Grape Juice
        0x11CE,    900,     --Yagudo Drink
        0x11A0,    1400,     --Vampire Juice
        0x172C,    2000,     --Kitron Juice
        0x15C8,    100,     --Ayran
        0x10CB,    250,     --Orange Au Lait
        0x10CC,    400,     --Apple Au Lait
        0x10CD,    600,     --Pear Au Lait
        0x10CE,    900,     --Pamama Au Lait
        0x10CF,    1500,     --Persikos Au Lait
        0x172D,    2100     --Dragon Au Lait
    };
    return stock;
end

local function coins(player, points)
    local stock = {
        656,    100,     --Beastcoin
        750,    250,     --Silver Beastoin
        749,    500,     --Mythril Beastoin
        748,    1000,     --Gold Beastoin
        751,    2500     --Platinum Beastoin
    };
    return stock;
end

local function guns(player, points)
    local stock = {
        19225,  300,    --Musketoon +1 > Serpentine Gun
        17258,  750,    --Bandit's Gun +1
        17254,  1100,   --Arquebus +1
        17260,  1900,   --Pirate's Gun +1
        17272,  2500,   --Military Gun
        18716,  2500,   --Mar's Hexgun +1
        18705,  3200,   --Dark Hexgun +1
        17269,  4500,   --Negorishikj +1
        17274,  5500,   --Deluxe Carbine
        17253,  6500,   --Musketeer Gun
        18710,  6500,   --Seadog Gun +1
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

local function daggers(player, points)
    local stock = {
        16491,  100,    --Bronze Knife +1 >Kris +1
        16490,  250,    --Blind Knife +1
        16508,  350,    --Silence Dagger +1
        16614,  500,    --Knife +1 > Poison Knife +1
        16741,  700,    --Poison Dagger +1
        16748,  900,    --Kukri +1 > Poison Kukri +1
        17606,  1200,   --Corrosive Dagger > Corrosive Knife
        19127,  1600,   --Ranging Knife+1
        16754,  1900,   --Parrying Knife
        16497,  2600,   --Sleep Dagger
        17631,  3000,   --Hawker's Knife +1
        19106,  3200,   --Thug Jambiya +1
        17973,  3800,   --Kingdom Dagger
        17607,  4450,   --Corrosive Baselard
        17661,  5000,   --Bone Knife +1
        16757,  6000,   --Corsair's Knife
    };
    return stock;
end

local function default_error(player, points)
    return false;
end



funcs = {
    ["earrings"] = earrings,
    ["rings"] = rings,
    ["rings2"] = rings2,
    ["rings3"] = rings3,
    ["ringsEx"] = ringsEx,
    ["rings2Ex"] = rings2Ex,
    ["rings3Ex"] = rings3Ex,
    ["grips"] = grips,
    ["gripsEx"] = gripsEx,
    ["feet"] = feet,
    ["hands"] = hands,
    ["legs"] = legs,
    ["back"] = back,
    ["belts"] = belts,
    ["neck"] = neck,
    ["helmets"] = helmets,
    ["clothing"] = clothing,
    ["armor"] = armor,
    ["shields"] = shields,
    ["shieldsEx"] = shieldsEx,
    ["shields2"] = shields2,
    ["shields2Ex"] = shields2Ex,
    ["throwing"] = throwing,
    ["hats"] = hats,
    ["coins"] = coins,
    ["drinks"] = drinks,
    ["bows"] = bows,
    ["arrows"] = arrows,
    ["arrowsEx"] = arrowsEx,
    ["crossbows"] = crossbows,
    ["bolts"] = bolts,
    ["guns"] = guns,
    ["bullets"] = bullets,
    ["daggers"] = daggers,
    ["swords"] = swords,
    ["swordsEx"] = swordsEx,
    ["swords2"] = swords2,
    ["swords2Ex"] = swords2Ex,
    ["clubs"] = clubs,
    ["staves"] = staves,
    ["axes"] = axes,
    ["katanas"] = katanas,
    ["knuckles"] = knuckles,
    ["spears"] = spears,
    ["scythes"] = scythes,
    ["greatswords"] = greatswords,
    ["greatkatanas"] = greatkatanas,
    ["greataxes"] = greataxes,
    ["misc"] = misc,
    ["jugs"] = jugs,
    ["jugs2"] = jugs,
    ["treats"] = treats,
    ["boomerangs"] = boomerangs,
    ["dice1"] = dice1,
    ["dice2"] = dice2,
    ["sch1"] = sch1,
    ["sch2"] = sch2,
    ["red1"] = red1,
    ["red2"] = red2,
    ["dark1"] = dark1,
    ["nin1"] = nin1,
    ["nin2"] = nin2,
    ["tools"] = tools,
    ["bard1"] = bard1,
    ["bard2"] = bard2,
    ["bard3"] = bard3,
    ["bard4"] = bard4,
    ["bard5"] = bard5,
    ["black1"] = black1,
    ["black2"] = black2,
    ["black3"] = black3,
    ["black4"] = black4,
    ["black5"] = black5,
    ["white1"] = white1,
    ["white2"] = white2,
    ["white3"] = white3,
    ["white4"] = white4,
    ["white5"] = white5,
    ["white6"] = white6,
    ["white7"] = white7,
    ["darkAttachments"] = darkAttachments,
    ["lightAttachments"] = lightAttachments,
    ["fireAttachments"] = fireAttachments,
    ["thunderAttachments"] = thunderAttachments,
    ["waterAttachments"] = waterAttachments,
    ["earthAttachments"] = earthAttachments,
    ["windAttachments"] = windAttachments,
    ["iceAttachments"] = iceAttachments,
    ["automatonParts"] = automatonParts,
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

