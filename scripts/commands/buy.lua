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


function white1(player)
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

function white2(player)
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

function white3(player)
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

function white4(player)
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
        4717,   10000,  --Refresh
        4793,   2600,   --Shellra II
        4728,   35000,  --Teleport Yhoat
    };
    return stock;
end

function white5(player)
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

function white7(player)
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

function white8(player)
    local stock = {
        4659,   4600,   --Shell IV
        4741,   4600,   --Shellra IV
        4748,   4800,   --Raise III
        4750,   4800,   --ReRaise III
        4618,   5000,   --Curaga IV
    };
    return stock;
end

function misc(player)
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

function jugs(player)
    local stock = {
        17860,  20, --Carrot
        17864,  20, --Herbal
        17876,  20, --Fish
        17877,  55, --Fish Oil
        17822,  35, --Alchemist's
        17905,  35, --Wormy
        17868,  50, --Humus
        17870,  80, --Meat
        17885,  65, --Grass
        17862,  90, --Bug
        17866,  110,    --Carrion
        17880,  110,    --Seedbed
        17887,  125,    --Mole
        17872,  145,    --Tree
        17891,  155,    --Antica
    };
    return stock;
end

function jugs2(player)
    local stock = {
        17861,  170,    --Famous Carrot
        17865,  170,    --Singing Herbal
        17889,  190,    --Blood
        17869,  240,    --Rich Humus
        17871,  240,    --Warm Meat
        17863,  270,    --Quadav
        17867,  270,    --Cold Carrion
        17886,  270,    --Noisy Grass
        17888,  270,    --Lively Mole
        17873,  350,    --Scarlet Sap
        17890,  350,    --Clear Blood
        17892,  350,    --Fragrant Antica
        17884,  450,    --Sun Water
    };
    return stock;
end

function treats(player)
    local stock = {
        17016,  5,  --Pet Food Alpha
        17017,  10, --Pet Food Beta
        17018,  20, --Pet Food Gamma
        17019,  30, --Pet Food Delta
        17020,  40, --Pet Food Epsilon
        17021,  60, --Pet Food Zeta
    };
    return stock;
end

function greataxes(player)
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

function knuckles(player)
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

function spears(player)
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

function scythes(player)
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

function greatswords(player)
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

function greatkatanas(player)
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

function swords(player)
    local stock = {
        16535,  200,    --Bronze Sword
        16610,  600,    --Wax Sword +1
        16530,  400,    --Xiphos
        16801,  900,    --Sapara +1
        16565,  800,    --Spatha ->Bee Spatha +1
        16512,  1200,   --Bilbo → Spark Bilbo +1
        16536,  1800,   --Iron Sword → Flame Sword
        16532,  2500,   --Gladius → Strider Sword
        16806,  6000,   --Centurion's Sword → Republic Sword
        17739,  3200,   --Steel Kilij  → Tulwar +1
        16537,  4200,   --Mithril Sword
        15416,  5000,   --Junior Msk. Tuck → Tck +2
        17701,  5000,   --Shotel → Falchion +1
        16564,  6500,   --Flame Blade
        16822,  4500,   --Crimson Blade
        16571,  7000,   --Tmpl Knt Army → +3 version
    };
    return stock;
end

function clubs(player)
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

function staves(player)
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

function axes(player)
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

function katanas(player)
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

function throwing(player)
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

function boomerangs(player)
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

function shields(player)
    local stock = {
        12290,  300,    --Maple Shield → Nymph Shield +1
        12325,  900,    --Aspis +1
        12291,  500,    --Elm Shield → Strong Shield
        12292,  6750,   --Mahogany Shield
        12337,  900,    --Decurion's Shield → Republic Targe
        12413,  1200,   --Turtle's Shield +1
        12326,  1600,   --Kite Shield +1
        12335,  2000,   --Targe +1
        12328,  2500,   --Heater Shield +1
        12378,  3200,   --Hard Shield → Divine Shield +1
    };
    return stock;
end

function rings(player)
    local stock = {
        13282,  1500,   --Saintly Ring >Sol Ring+1
        13284,  1500,   --Eremite Ring >Wis Ring+1
        14670,  400,    --Safeguard Ring >Aegis Ring
        13522,  2500,   --Courage Ring >Puis Ring+1
        13524,  2500,   --Balance Ring >Deft Ring+1
        14597,  1200,   --Stamina Ring +1 >Verve Ring+1
        14599,  1200,   --Hope Ring +1 >Loyal Ring+1
        13501,  2000,   --Beetle Ring +1 >Marksman's Ring
        15837,  3800,   --Smilodon Ring +1
        14606,  4000,   --Aura Ring+1
        13549,  5500,   --Ether Ring
        13550,  2000,    --Crossbow Ring
        15802,  3800,   --Feral Ring
        14676,  6000,   --Assailant's Ring
        15817,  8000   --Ecphoria Ring
    };
    return stock;
end

function template(player)
    stock = {
    };
    return stock;
end

function neck(player)
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

function back(player)
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

function hands(player)
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

function belts(player)
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

function legs(player)
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


function feet(player)
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

function earrings(player)
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

function hats(player)
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

function helmets(player)
    local stock = {
        0x3090,   250,    --Faceguard >augment
        0x30C0,   650,    --Lizard Helm +1
        0x3603,   900,    --Beetle Mask +1
        0x30F5,   2200,   --Silver Mask +1
        0x3607,   3200,   --Sallet +1
    };
    return stock;
end


function clothing(player)
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

function armor(player)
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

function bows(player)
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
    return stock;
end

function arrows(player)
    local stock = {
        17318,  1,  --Wooden Arrow
        17319,  1,  --Bone Arrow
        17320,  1,  --Iron Arrow
        17332,  2,  --Fang Arrow
        18154,  3,  --Beetle Arrow
        18157,  3,  --Poison Arrow
        17321,  3,  --Silver Arrow
        18156,  4,  --Horn Arrow
        18158,  4,  --Sleep Arrow
        17317,  4,  --Gold Arrow
        18155,  5,  --Scorpion Arrow
        17322,  5,  --Fire Arrow
        17323,  5,  --Ice Arrow
        17324,  5,  --Lightning Arrow
        17334,  6,  --Platinum Arrow
        18178,  9,  --Bodkin Arrow
    };
    return stock;
end

function crossbows(player)
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

function bolts(player)
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

function drinks(player)
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

function coins(player)
    local stock = {
        656,    100,     --Beastcoin
        750,    250,     --Silver Beastoin
        749,    500,     --Mythril Beastoin
        748,    1000,     --Gold Beastoin
        751,    2500     --Platinum Beastoin
    };
    return stock;
end

function guns(player)
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

function bullets(player)
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

function daggers(player)
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

function default_error(player)
    return false;
end


funcs = {
    ["earrings"] = earrings,
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
    ["throwing"] = throwing,
    ["hats"] = hats,
    ["coins"] = coins,
    ["drinks"] = drinks,
    ["bows"] = bows,
    ["arrows"] = arrows,
    ["crossbows"] = crossbows,
    ["bolts"] = bolts,
    ["guns"] = guns,
    ["bullets"] = bullets,
    ["daggers"] = daggers,
    ["swords"] = swords,
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
    ["treats"] = jugs,
    ["boomerangs"] = boomerangs,
    ["white1"] = white1,
    ["white2"] = white2,
    ["white3"] = white3,
    ["white4"] = white4,
    ["white5"] = white5,
    ["white6"] = white6,
    ["white7"] = white7,
    ["white8"] = white8,
};

function onTrigger(player, shop)
    local id = player:getZoneID();
    local stock = false;
    if (id < 230 or id > 250) then
        return
    end


    local result = funcs[shop];
    if (result == nil) then
        stock = false;
    else
        stock = result(player);
    end







    if ( stock == false ) then
        return;
    end
    
    showShop(player, 7, stock);

    
end;

