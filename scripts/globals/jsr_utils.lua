require("scripts/globals/status");
require("scripts/globals/utils");
require("scripts/globals/jsr_augment");

WOOD = "woodworking"
FISH = "fishing"
SMIT = "smithing"
GOLD = "goldsmithing"
WEAV = "weaving"
LEAT = "leathercraft"
BONE = "bonecraft"
ALCH = "alchemy"
COOK = "cooking"




function noDominantRune(target)
    local ignis = target:getEffectsCount(EFFECT_IGNIS);
    local gelus = target:getEffectsCount(EFFECT_GELUS);
    local flabra = target:getEffectsCount(EFFECT_FLABRA);
    local tellus = target:getEffectsCount(EFFECT_TELLUS);
    local sulpor = target:getEffectsCount(EFFECT_SULPOR);
    local unda = target:getEffectsCount(EFFECT_UNDA);
    local lux = target:getEffectsCount(EFFECT_LUX);
    local tenebrae = target:getEffectsCount(EFFECT_TENEBRAE);
    
    return (ignis < 2 and gelus < 2 and flabra < 2 and tellus < 2 and sulpor < 2 and unda < 2 and lux < 2 and tenebrae < 2);
end;



function addRune(player, rune)
    local runLevel = 0;
    local minRunes = 0;
    if(player:getMainJob() == JOBS.RUN or player:getMainJob() == JOBS.GEO) then
        runLevel = player:getMainLvl();
    else
        runLevel = player:getSubLvl();
    end
    if (runLevel < 35) then
        minRunes = 1;
    elseif (runLevel < 65) then
        minRunes = 2;
    else
        minRunes = 3;
    end
        
    if (player:getActiveRunes() >= minRunes) then
        player:removeOldestRune();
    end
    local power = math.floor(5 + runLevel * 0.3);
    player:addStatusEffect(rune,power,3,300);
end;

local runeTypes = {
    [EFFECT_IGNIS] = 1,
    [EFFECT_GELUS] = 2,
    [EFFECT_FLABRA] = 3,
    [EFFECT_TELLUS] = 4,
    [EFFECT_SULPOR] = 5,
    [EFFECT_UNDA] = 6,
    [EFFECT_LUX] = 7,
    [EFFECT_TENEBRAE] = 8,
};

function getRuneSpecEffect(player, target, ability, action, mult)
    if (mult == nil) then mult = 1; end
    local highest = 0;
    local position = 0;
    local runes = {
        player:getEffectsCount(EFFECT_IGNIS),
        player:getEffectsCount(EFFECT_GELUS),
        player:getEffectsCount(EFFECT_FLABRA),
        player:getEffectsCount(EFFECT_TELLUS),
        player:getEffectsCount(EFFECT_SULPOR),
        player:getEffectsCount(EFFECT_UNDA),
        player:getEffectsCount(EFFECT_LUX),
        player:getEffectsCount(EFFECT_TENEBRAE)
    };

    for i,v in pairs(runes) do
        if v > highest then
            highest = v;
            position = i;
        end
    end

    if (highest == 1) then
        position = runeTypes[player:getNewestRune()];
    end

    action:speceffect(target:getID(), position * mult);
end

function setRuneWeaponOffset(player, target, ability, action)
    local skill = player:getWeaponSkillType(SLOT_MAIN);
    local offset = 0;
    if      (skill ==  SKILL_H2H) then offset = 1;
    elseif  (skill ==  SKILL_AXE) then offset = 2;
    elseif  (skill ==  SKILL_CLB) then offset = 3;
    elseif  (skill ==  SKILL_SYH) then offset = 4;
    elseif  (skill ==  SKILL_GKT) then offset = 5;
    elseif  (skill ==  SKILL_STF or skill == SKILL_POL) then offset = 6;
    elseif  (skill ==  SKILL_DAG or skill == SKILL_KAT) then offset = 7;
    elseif  (skill ==  SKILL_GSD) then offset = 8;
    elseif  (skill ==  SKILL_GAX) then offset = 9;
    end

    local id = action:animation(target:getID());
    action:animation(target:getID(), id + offset);
end



function vallationDefense(count)
    if (count == 1) then
        return 50;
    elseif (count == 2) then
        return 65;
    elseif (count == 3) then
        return 80;
    else
        return 0;
    end
end;

function pflugRes(count)
    if (count == 1) then
        return 60;
    elseif (count == 2) then
        return 80;
    elseif (count == 3) then
        return 100;
    else
        return 0;
    end
end;

function createRuneMask(target)
    local ignis = target:getEffectsCount(EFFECT_IGNIS);
    local gelus = target:getEffectsCount(EFFECT_GELUS);
    local flabra = target:getEffectsCount(EFFECT_FLABRA);
    local tellus = target:getEffectsCount(EFFECT_TELLUS);
    local sulpor = target:getEffectsCount(EFFECT_SULPOR);
    local unda = target:getEffectsCount(EFFECT_UNDA);
    local lux = target:getEffectsCount(EFFECT_LUX);
    local tenebrae = target:getEffectsCount(EFFECT_TENEBRAE);
    
    local mask = 0;
    local subMask = 0;
    
    mask = mask + ignis;
    mask = mask + gelus * 4;
    mask = mask + flabra * 16;
    mask = mask + tellus * 64;
    mask = mask + sulpor * 256;
    mask = mask + unda * 1024;
    mask = mask + lux * 4096;
    mask = mask + tenebrae * 16384;
    return mask;
end;

function applyValianceMask(effect)
    local bit = require("bit")
    local lshift = bit.lshift;
    local rshift = bit.rshift;
    local band = bit.band;
    local mask = effect:getPower();
    
    local ignis = band(mask, 3);
    local gelus = rshift(band(mask, lshift(3, 2)), 2);
    local flabra = rshift(band(mask, lshift(3, 4)), 4);
    local tellus = rshift(band(mask, lshift(3, 6)), 6);
    local sulpor = rshift(band(mask, lshift(3, 8)), 8);
    local unda = rshift(band(mask, lshift(3, 10)), 10);
    local lux = rshift(band(mask, lshift(3, 12)), 12);
    local tenebrae = rshift(band(mask, lshift(3, 14)), 14);
    
    effect:addMod(MOD_FIREDEF, vallationDefense(unda));
    effect:addMod(MOD_ICEDEF, vallationDefense(ignis));
    effect:addMod(MOD_WATERDEF, vallationDefense(sulpor));
    effect:addMod(MOD_EARTHDEF, vallationDefense(flabra));
    effect:addMod(MOD_THUNDERDEF, vallationDefense(tellus));
    effect:addMod(MOD_WINDDEF, vallationDefense(gelus));
    effect:addMod(MOD_LIGHTDEF, vallationDefense(tenebrae));
    effect:addMod(MOD_DARKDEF, vallationDefense(lux));
end;

function applyPflugMask(effect)
    local bit = require("bit")
    local lshift = bit.lshift;
    local rshift = bit.rshift;
    local band = bit.band;
    local mask = effect:getPower();
    
    local ignis = band(mask, 3);
    local gelus = rshift(band(mask, lshift(3, 2)), 2);
    local flabra = rshift(band(mask, lshift(3, 4)), 4);
    local tellus = rshift(band(mask, lshift(3, 6)), 6);
    local sulpor = rshift(band(mask, lshift(3, 8)), 8);
    local unda = rshift(band(mask, lshift(3, 10)), 10);
    local lux = rshift(band(mask, lshift(3, 12)), 12);
    local tenebrae = rshift(band(mask, lshift(3, 14)), 14);
    
    effect:addMod(MOD_FIRERES, pflugRes(unda) / 5);
    effect:addMod(MOD_VIRUSRES, pflugRes(unda) / 3);
    effect:addMod(MOD_AMNESIARES, pflugRes(unda) / 3);

    effect:addMod(MOD_ICERES, pflugRes(ignis) / 5);
    effect:addMod(MOD_PARALYZERES, pflugRes(ignis) / 3);
    effect:addMod(MOD_BINDRES, pflugRes(ignis) / 3);

    effect:addMod(MOD_WATERRES, pflugRes(sulpor) / 5);
    effect:addMod(MOD_POISONRES, pflugRes(sulpor) / 3);
    effect:addMod(MOD_CHARMRES, pflugRes(sulpor) / 3);

    effect:addMod(MOD_EARTHRES, pflugRes(flabra) / 5);
    effect:addMod(MOD_SLOWRES, pflugRes(flabra) / 3);
    effect:addMod(MOD_PETRIFYRES, pflugRes(flabra) / 3);

    effect:addMod(MOD_THUNDERRES, pflugRes(tellus) / 5);
    effect:addMod(MOD_STUNRES, pflugRes(tellus) / 3);

    effect:addMod(MOD_WINDRES, pflugRes(gelus) / 5);
    effect:addMod(MOD_SILENCERES, pflugRes(gelus) / 3);
    effect:addMod(MOD_GRAVITYRES, pflugRes(gelus) / 3);

    effect:addMod(MOD_LIGHTRES, pflugRes(tenebrae) / 5);
    effect:addMod(MOD_CHARMRES, pflugRes(tenebrae) / 3);

    effect:addMod(MOD_DARKRES, pflugRes(lux) / 5);
    effect:addMod(MOD_SLEEPRES, pflugRes(lux) / 3);
    effect:addMod(MOD_BLINDRES, pflugRes(lux) / 3);
    effect:addMod(MOD_CURSERES, pflugRes(lux) / 3);
    effect:addMod(MOD_DEATHRES, pflugRes(lux) / 3);
end;

function startConfrontation(player, power, duration, mobs, hardmode)
    local mob = nil;
    player:applyConfrontationToParty(power, duration);
    for k,v in pairs(mobs) do
        mob = SpawnMob(v);
        mob:setSpawner(player);
        mob:updateClaim(player);
        mob:setPos( player:getXPos(), player:getYPos(), player:getZPos(), player:getRotPos(), player:getZoneID() );
        mob:addStatusEffect(EFFECT_CONFRONTATION, power, 0, duration);
        mob:addMod(MOD_ATTP, -15);
        mob:addMod(MOD_ACC, 10);
        mob:addMod(MOD_DEFP, 15);
        mob:addMod(MOD_EVA, 20);
        mob:addMod(MOD_MEVA, 20);
        mob:addMod(MOD_UDMGPHYS, -25);
        mob:addMod(MOD_UDMGMAGIC, -25);
        mob:addMod(MOD_UDMGRANGE, -25);
        mob:addMobMod(MOBMOD_HP_SCALE, 100);
        if (hardmode == false) then
            mob:setMobMod(MOBMOD_HARD_MODE, 1);
        else
            mob:addMod(MOD_DEFP, 10);
            mob:addMod(MOD_ATTP, 10);
            mob:addMod(MOD_EVA, 20);
            mob:addMod(MOD_ACC, 20);
            mob:addMod(MOD_MEVA, 20);
            mob:addMod(MOD_MATT, 15);
            mob:addMod(MOD_MACC, 20);
            mob:addMod(MOD_STORETP, 35);
            mob:addMod(MOD_MDEF, 10);
            mob:addMod(MOD_HASTE_MAGIC, 100);
            mob:setMobMod(MOBMOD_HARD_MODE, 2);
        end

        local partySize = player:getPartySize(0);
        if (partySize > 1) then
            mob:addMobMod(MOBMOD_HP_SCALE, 35 * (partySize - 1));
--            mob:addMod(MOD, (15 * (partySize - 1)));
--            mob:addMod(MOD_UDMGPHYS, (-6 * (partySize - 1)));
--            mob:addMod(MOD_UDMGRANGE, (-6 * (partySize - 1)));
--            mob:addMod(MOD_UDMGMAGIC, (-6 * (partySize - 1)));
        end
        mob:addHP(99999);



        --DespawnMob(mob, 25);
    end
end;

function applyBarDurationReduction(target, effect, barType)
    if (target:hasStatusEffect(barType)) then
        local duration = effect:getDuration();
        duration = math.floor(duration * 3 / 2);
        if (duration == 0) then
            duration = 1;
        end
        effect:setDuration(duration);
    end
end;




function jsrReward(player, rewards)
    if (rewards["xp"] ~= nil) then
        player:addLimitPoints(rewards["xp"]);
        player:addExp(rewards["xp"]);
    end

    if (rewards["gil"] ~= nil) then
        player:addGil(rewards["gil"]);
--        player:SayToPlayer("Received " .. tostring(rewards["gil"]) .. " gil.");
        player:messageSpecial(GIL_OBTAINED,rewards["gil"]);
    end

    if (rewards["cp"] ~= nil) then
        player:addCP(rewards["cp"]);
        player:SayToPlayer("Received " .. tostring(rewards["cp"]) .. " cp.");
    end

    if (rewards["beast"] ~= nil) then
        player:addItem(1126, rewards["beast"]);
        if (rewards["beast"] == 1) then
            player:messageSpecial(ITEM_OBTAINED,1126, rewards["beast"]);
        else
            player:SayToPlayer("Received " .. tostring(rewards["beast"]) .. " beastman seals.");
        end
    end

    if (rewards["item"] ~= nil) then
        player:addItem(rewards["item"]);
        player:messageSpecial(ITEM_OBTAINED,rewards["item"]);
    end

    if (rewards["item2"] ~= nil) then
        player:addItem(rewards["item2"]);
        player:messageSpecial(ITEM_OBTAINED,rewards["item2"]);
    end

    if (rewards["augment"] ~= nil) then
        local arr = rewards["augment"];
        player:addItem(arr[1], 1, arr[2], arr[3], arr[4], arr[5], arr[6], arr[7], arr[8], arr[9]);
        player:messageSpecial(ITEM_OBTAINED,arr[1]);
    end

    if (rewards["guild"] ~= nil) then
        local arr = rewards["guild"]
        player:addCurrency("guild_" .. arr[1], arr[2]);
        player:SayToPlayer("Received " .. tostring(arr[2]) .. " " .. arr[1] .. " points.");
    end

    if (rewards["scyld"] ~= nil) then
        player:addCurrency("scyld", rewards["scyld"]);
        player:SayToPlayer("Received " .. tostring(rewards["scyld"]) .. " scylds.");
    end

    if (rewards["jetton"] ~= nil) then
        player:addCurrency("jetton", rewards["jetton"]);
        player:SayToPlayer("Received " .. tostring(rewards["jetton"]) .. " jettons.");
    end

    if (rewards["spark"] ~= nil) then
        player:addCurrency("spark_of_eminence", rewards["spark"]);
        player:SayToPlayer("Received " .. tostring(rewards["spark"]) .. " sparks of eminence.");
    end

end


function onEliteDeath(mob, player, tier)
    if (mob == nil or mob:getLocalVar("TimedOut") == 1) then
        return;
    end

    if (mob:getSpawner() ~= nil) then
        local player = mob:getSpawner();
        if (player ~= nil) then
            player:removeConfrontationFromParty();
        end
        player:setLocalVar("killedFoVNM", 1);

        local party = player:getParty();

        local scyld = 10 + tier * 5;
        local xpReward = 200 + 100 * tier;
        if (mob:getMobMod(MOBMOD_HARD_MODE) == 2) then
            xpReward = xpReward + tier * 50 + 50;
            scyld = scyld + 10;
        end;

        if (party ~= nil) then
            for i,member in ipairs(party) do
                member:addLimitPoints(xpReward);
                member:addExp(xpReward);
            end
        else
            player:addLimitPoints(xpReward);
            player:addExp(xpReward);
        end

        jsrReward(player, {["scyld"] = scyld});
    end
end



function tradeElite(player, npc, trade, tier, monsters)
    local count = trade:getItemCount();
--    local beastSeals = trade:hasItemQty(1126, tier);
    local gil = trade:getGil();
    local thirdSlot = trade:getItem(0);
    local leftover = tier - math.floor(tier);
    tier = math.floor(tier);
    if (leftover > 0) then leftover = 5; end

    -- normal mode
    if (count == 1 and gil == tier * 300) then
        npc:setLocalVar("trader", player:getID());
        npc:setLocalVar("traded", 0);
        player:tradeComplete();
        startConfrontation(player, tier * 10 + leftover - 5, 600, monsters, false);
    -- hard mode
    elseif (count == 2 and gil == tier * 1200 and thirdSlot ~= 0) then
        local augmented = (trade:getItemSubId(0) == 4);
        if (augmented) then
            return;
        end

        npc:setLocalVar("trader", player:getID());
        npc:setLocalVar("traded", thirdSlot);
        player:tradeComplete();
        startConfrontation(player, 10, 600, monsters, true);
    end

end

function rewardElite(player, npc, items)
    local tradedItem = npc:getLocalVar("traded");
    local killed = player:getLocalVar("killedFoVNM");
    local trader = npc:getLocalVar("trader");
    if (true or killed == 1 and trader == player:getID()) then
        player:setLocalVar("killedFoVNM", 0);
        npc:setLocalVar("trader", 0);
        npc:setLocalVar("traded", 0);

        -- reward basic item
        local size = 0;
        for i,v in pairs(items) do
            size = size + 1;
        end
        local id = items[math.random(1, size)];
        local item = getItem(id);
        local augments = pickAugments(item);
        local reward = {["augment"] = {id, augments[1], augments[2], augments[3], augments[4], augments[5], augments[6], augments[7], augments[8]}};
        jsrReward(player, reward);


        -- reward second item if player traded one
        if (tradedItem ~= 0) then
            item = getItem(tradedItem);
            augments = pickAugments(item);
            reward = {["augment"] = {tradedItem, augments[1], augments[2], augments[3], augments[4], augments[5], augments[6], augments[7], augments[8]}};
            jsrReward(player, reward);
        end

    end

end



function rewardTemporaryItem(player)
    local level = player:getMainLvl();
    local hasMP = player:getMaxMP() > 25;
    local boostItems = { -- Count: 18
        5440, -- Dusty Wing
        5392, -- Champion's Drink
        5389, -- Spy's Drink
        5386, -- Fighter's Drink
        5385, -- Barbarian's Drink
        5849, -- Berserker's Drink
        5241, -- Giant's Drink
        5395, -- Cleric's Drink
        4258, -- Drop
        4259, -- Drop
        4260, -- Drop
        4261, -- Drop
        4262, -- Drop
        4263, -- Drop
        4264, -- Drop
        4199, -- Stat Potion
        4201, -- Stat Potion
        4203, -- Stat Potion
        4207, -- Stat Potion
        4209, -- Stat Potion
        4211, -- Stat Potion
        5770, -- Super Reraiser
        5322, -- Healing Powder
        5832, -- Healing Mist
        5833, -- Mana Mist
        5990, -- Instant Stoneskin
        4255, -- Mana Powder
        5834, -- Lucid Wings
        6475, -- Lucid Wings II
        5824, -- Lucid Potion
        5825, -- Lucid Potion II
        5387, -- Oracle's Drink
        5826, -- Lucid Potion III
        5827, -- Lucid Ether
        5445, -- Lucid Ether
        5828, -- Lucid Ether II
        5829, -- Lucid Ether III
        4146, -- Revitalizer
        5445, -- Prismatic Elixir
        4202, -- Daedalus Wing
        5390, -- Braver's Drink
        5440, -- Dusty Wing
        5393, -- Monarch's Drink
        4174, -- Vile Elixir
        4175, -- Vile Elixir +1
        4254, -- Megalixir
        4155 -- Remedy
    };

    local boostSize = 0;
    for i,v in pairs(boostItems) do
        boostSize = boostSize + 1;
    end



    local item = boostItems[math.random(1,boostSize)];

    player:addTempItem(item);
    player:messageSpecial(ITEM_OBTAINED, item);
end




 itemReward10 = {
    16449, -- Brass Dagger
    17153, -- Self Bow
    19224, -- Musketoon
    17223, -- Legionarre's Crossbow
    17290, -- Coarse Boomerang
    17028, -- Freesword's Club
    17130, -- Freesword's Staff
    16641, -- Brass Axe
    16966, -- Tachi
    16449, -- Brass Dagger
    16391, -- Brass Knuckles
    16583, -- Claymore
    16833, -- Bronze Spear
    16900, -- Wakazashi
    16769, -- Brass Zaghnal
    17347, -- Piccolo
    12497, -- Brass Hairpin
    13331, -- Sardonyx Earring
    13335, -- Amber Earring
    13282, -- Saintly Ring
    13284, -- Eremite's Ring
    13465, -- Brass Ring
    12560, -- Scale Mail
    13101, -- Green Scarf
    14803, -- Optical Earring
    14670, -- Safeguard Ring
    13380, -- Hope Earring
    13398, -- Physical Earring
    12944, -- Scale Greaves
    12456, -- Hachimaki
    12584, -- Kenpogi
    12608, -- Tunic
    12712, -- Tekko
    12736, -- Mitts
    13583, -- Cape
    13192, -- Leather Belt
    13081, -- Leather Gorget
    12864, -- Slacks
    12840, -- Sitabaki
    12824, -- Leather Trousers
    12290, -- Maple Shield
    12952, -- Leather Highboots
    12696, -- Leather Gloves
    12440, -- Leather Bandana
    12968, -- Kyahan
    12992, -- Solea
    13204, -- Heko Obi
    16184, -- Pelte
    12299, -- Aspis
};

 itemReward15 = {
    16407, -- Brass Baghnakhs
    16386, -- Lizard Cesti
    16834, -- Brass Spear
    16450, -- Dagger
    18599, -- Pestle
    16552, -- Scimitar
    16412, -- Bilbo
    16642, -- Bone Axe
    17280, -- Boomerang
    17354, -- Harp
    16531, -- Brass Xiphos
    17780, -- Kyofu
    16960, -- Uchigatana
    17081, -- Brass Rod
    17217, -- Crossbow
    17183, -- Hunter's Longbow
    17043, -- Brass Hammer
    16572, -- Bee Spatha
    16667, -- Light Axe
    17089, -- Holly Staff
    17412, -- Wild Cudgel
    19305, -- Pike
    12449, -- Brass Cap
    12506, -- Shell Hairpin
    15503, -- Van Pendant
    13327, -- Silver Earring
    13469, -- Leather Ring
    13456, -- Silver Ring
    13211, -- Friar's Rope
    13194, -- Warrior's Belt
    15559, -- Vision Ring
    14654, -- Poisona Ring
    12464, -- Headgear
    12577, -- Brass Harness
    12291, -- Elm Shield
    12592, -- Doublet
    12705, -- Brass Mittens
    12720, -- Gloves
    12798, -- Zealot's Mitts
    12848, -- Brais
    12961, -- Brass Leggings
    12976, -- Gaiters
    12601, -- Linen Robe
    12729, -- Linen Cuffs
    12857, -- Linen Slops
    12985, -- Holly Clogs
    13227, -- Plate Belt
    13071, -- Scalle Gorget
    13313, -- Shell Earring
    13442, -- Shell Ring
};

 itemReward25 = {
    16451, -- Mythril Dagger
    16513, -- Tuck
    16406, -- Baghnakhs
    16754, -- Parrying Knife
    17230, -- Power Crossbow
    17424, -- Spiked Club
    17942, -- Tomahawk
    16835, -- Spear
    16935, -- Barbarian's Sword
    17154, -- Wrapped Bow
    17281, -- Wingedge
    17650, -- Nadrs
    17776, -- Hibari
    19119, -- Ranging Knife
    16987, -- Okanehira
    17090, -- Elm Staff
    12414, -- Turtle Shield
    12424, -- Iron Mask
    12552, -- Chainmail
    12680, -- Chain Mittens
    12808, -- Chain Hose
    12936, -- Greaves
    13059, -- Fine Choker
    13082, -- Chain Gorget
    13083, -- Chain Choker
    13209, -- Chain Belt
    13614, -- Bronze Cape
    13328, -- Mythril Earring
    13446, -- Mythril Ring
    12455, -- Beetle Mask
    12583, -- Beetle Harness
    12711, -- Beetle Mittens
    12835, -- Beetle Subligar
    12967, -- Beetle Leggings
    13061, -- Spike Necklace
    13062, -- Green Gorget
    13090, -- Beetle Gorget
    13323, -- Beetle Earring
    13457, -- Beetle Ring
    12465, -- Cotton Headgear
    12721, -- Cotton Glovs
    12593, -- Cotton Doublet
    12849, -- Cotton Brais
    12977, -- Cotton Gaiters
    13085, -- Hemp Gorget
};

 itemReward35 = {
    16467, -- Mythril Knife
    16475, -- Mythril Kukri
    16576, -- Hunting Sword
    16706, -- Heavy Axe
    16812, -- War Sword
    16845, -- Lance
    16973, -- Homura
    17061, -- Mythril Rod
    17193, -- Shadow Bow
    17256, -- Serpentine Gun
    17828, -- Koen
    15173, -- Kosshin
    18375, -- Falx
    16399, -- Katars
    16410, -- Poison Baghnakhs
    17292, -- Long Boomerang
    17580, -- Military Pole
    17839, -- Military Harp
    16650, -- War Pick
    16901, -- Kodachi
    17052, -- Chestnut Wand
    17348, -- Traversiere
    17533, -- Whale Staff
    17782, -- Reppu
    17045, -- Maul
    18214, -- Voulge
    12300, -- Targe
    16406, -- Baghnakhs
    13750, -- Linen Doublet
    12450, -- Padded Cap
    12578, -- Padded Armor
    12706, -- Iron Mittens
    12936, -- Iron Subligar
    12962, -- Leggings
    13118, -- Shield Pendant
    13322, -- Wing Earring
    13459, -- Horn Ring
    13796, -- Bishop's Robe
    13730, -- Frost Robe
    12610, -- Coak
    12738, -- Linen Mitts
    12866, -- Linen Slacks
    12994, -- Shoes
    13206, -- Gold Obi
    13196, -- Silver Belt
    15940, -- Gosha Sarashi
    15291, -- Hojutsu Belt
    15838, -- Protect Ring
    13577, -- Black Cape
    13585, -- White Cape
}

 itemReward45 = {
    16412, -- Mythril Claws
    16590, -- Greatsword
    17523, -- Quarterstaff
    18506, -- Tewhatewha
    18591, -- Pastoral Staff
    19231, -- Tracker's Bow
    17701, -- Shotel
    16837, -- Trident
    16523, -- Holy Degen
    16558, -- Falchion
    18207, -- Kheten
    17231, -- Tell's Crossbow
    17356, -- Lamia Harp
    16967, -- Mikazuki
    16722, -- Heavy Moth Axe
    16902, -- Sakurafubuki
    17062, -- Bone Rod
    18427, -- Hanafubuki
    18607, -- Ceres's Spica
    18611, -- Qi Staff
    17041, -- Holy Mace
    16657, -- Tabar
    16675, -- Storm Axe
    17968, -- Veldt Axe
    18210, -- Raifu
    17267, -- Negoroshiki
    16796, -- Mythril Zaghnal
    16905, -- Bokuto
    17188, -- Sniping Bow
    13752, -- Wool Doublet
    12307, -- Heater Shield
    12301, -- Buckler
    12356, -- Viking Shield
    12727, -- Engineer's Gloves
    13063, -- Blue Gorget
    13315, -- Gold Earring
    13324, -- Tortoise Earring
    13461, -- Carapace Ring
    13596, -- Green Cape
    13198, -- Swordbelt
    13586, -- Red Cape
    12459, -- Zunari Kabuto
    12843, -- Haidate
    13703, -- Brigandine
    13711, -- Carapace Mask
    13712, -- Carapace Harness
    13713, -- Carapace Mittens
    13715, -- Carapace Leggings
    13723, -- Pyro Robe
    14866, -- Concealing Cuffs
    15434, -- Vanguard Belt
    13882, -- Corsair's Hat
    15443, -- Powerful Rope
    14286, -- Frog Trousers
    15801, -- Tigereye Ring
    13979, -- Silver Bangles
    14164, -- Inferno Sabots
    15432, -- Quick Belt
    13230, -- Adept's Rope
    13120, -- Clay Amulet
    15433, -- Reverand Sash
};
 itemReward55 = {
    16538, -- Darksteel Sword
    16528, -- Bloody Rapier
    17240, -- Lightning Bow
    17660, -- Kilij
    18362, -- Sainti
    18226, -- Darksteel Voulge
    16580, -- Bloodsword
    16888, -- Battle Fork
    16974, -- Dotanuki
    16899, -- Hototogisu
    16389, -- Coeurl Cesti
    19103, -- Darksteel Jambiya
    16985, -- Jindachi
    17778, -- Muketsu
    17236, -- Leo Crossbow
    17416, -- Arcana Breaker
    16513, -- Darksteel Claws
    16794, -- Bone Scythe
    16468, -- Darksteel Knife
    16559, -- Darksteel Falchion
    16858, -- Sacred Lance
    16883, -- Monsoon Spear
    17186, -- Sagittarius Bow
    16871, -- Kamayari
    16913, -- Shinogi
    17529, -- Sunlight Pole
    17802, -- Kiku-ichomonji
    16767, -- Triple Dagger
    11532, -- Accura Cape
    13325, -- Fang Earring
    13458, -- Scorpion Ring
    13103, -- Checkered Scarf
    11537, -- Kinesis Mantle
    12348, -- Serket Shield
    12344, -- Master Shield
    12311, -- Hoplon
    13800, -- Master's Gi
    14746, -- Verming Earring
    14751, -- Plantoid Earring
    13273, -- Twinthread Obi
    13798, -- Gaia Doublet
    13983, -- Gold Bangles
    13637, -- Gaia Mantle
    12476, -- Silk Hat
    12604, -- Silk Coat
    12732, -- Silk Cuffs
    12860, -- Silk Slops
    14254, -- Master's Sitabaki
    12988, -- Pigaches
    12323, -- Scutum
    13134, -- Ashura Necklace
    13579, -- Jester's Cape
    13417, -- Eris's Earring
    13248, -- Flagellant's Rope
    15463, -- Safety Mantle
    15431, -- Astral Rope
};

 itemReward65 = {
    17100, -- Ebony Pole
    16521, -- Rapier
    18769, -- Severus Claws
    16730, -- Colossal Axe
    16658, -- Darksteel Tabar
    16789, -- Darksteel Scythe
    16842, -- Golden Spear
    16959, -- Onikiri
    17046, -- Darksteel Maul
    17433, -- Mythic Wand
    16421, -- Gold Patas
    16541, -- Jadgplaute
    17724, -- Darksteel Kilij
    16846, -- Bloody Lance
    17242, -- Velocity Bow
    17222, -- Hexagun
    16560, -- Cutlass
    16652, -- Darksteel Pick
    18086, -- Heavy Lance
    17601, -- Demon's Knife
    16569, -- Gold Sword
    16477, -- Cermet Kukri
    16964, -- Zanbato
    17063, -- Darksteel Rod
    16401, -- Jamadhars
    16525, -- Hornet Fleuret
    16903, -- Kabutowari
    17249, -- Magoichi's Gun
    12295, -- Round Shield
    12740, -- Silk Mitts
    12852, -- Battle Hose
    12996, -- Silk Pumps
    13092, -- Coeurl Gorget
    13645, -- Amemet Mantle
    13589, -- Tiger Mantle
    15200, -- Orc Helm
    15203, -- Goblin Coif
    15653, -- Tabin Hose
    12303, -- Gold Buckler
    12324, -- Tower Shield
    12419, -- Darksteel Armet
    12446, -- Tiger Helm
    12468, -- Green Beret
    12563, -- Coral Scale Mail
    14941, -- Marid Mittens
    14993, -- Tabin Bracers
    16111, -- Tabin Beret
    16121, -- Mamool Ja Helm
    16122, -- Troll Coif
    16123, -- Lamia Garland
    16124, -- Qiqirn Hood
    16130, -- Wivre Mask
    16213, -- Lamia Mantle
    15055, -- Finesse Gloves
    12674, -- Tiger Jerkin
    12580, -- Darksteel Harness
    12596, -- Battle Jupon
    12691, -- Coral Finger Gauntlets
    12724, -- Battle Bracers
    12839, -- Darksteel Subligar
    13649, -- Tafetta Cape
    13655, -- Sand Mantle
    13187, -- Tiger Belt
    12435, -- Coral Visor
    12708, -- Darksteel Mittens
    12189, -- Coral Cuisses
    12947, -- Coral Greaves
    12612, -- Silk Cloak
    12830, -- Tiget Trousers
    12958, -- Tiget Ledelsens
    14023, -- Arhat's Tekko
    13881, -- Arhat's Jinpachi
    14136, -- Arhat's Sune-ate
    13795, -- Arhat's Gi
    14253, -- Arhat's Hakama
    13235, -- Prism Obi
    13312, -- Coral Earring
    15202, -- Yagudo Headgear
    15201, -- Quadav Barbut
    15699, -- Templar Sabatons
    15811, -- Wivre Ring
    16231, -- Smilodon Mantle
    16009, -- Pennon Earring
    13789, -- Carapace Breastplate
    13878, -- Carapace Helm
    14764, -- Minuet Earring
    14008, -- Carapace Gauntlets
}

 itemReward75 = {
    16596, -- Falmberge
    18082, -- Barchha
    16729, -- Berserkers Ask
    18405, -- Jadagna
    18420, -- Hayabusa
    18439, -- Shirogatana
    18848, -- Brass Jadagna
    16453, -- Orichalcum Dagger
    12305, -- Ice Shield
    17200, -- Rosenbogen
    17205, -- Gendawa
    17838, -- Harlequin's Horn
    18389, -- Crude Sword
    18115, -- Engetsuto
    17842, -- Sorrowful Harp
    17854, -- Cradle Horn
    18026, -- Magnet Knife
    17251, -- Hellfire
    17359, -- Mythic Harp
    17471, -- Horrent Mace
    16461, -- Adaman Kris
    16586, -- Adamaan Claymore
    17065, -- Platinum Rod
    17101, -- Mythic Pole
    18858, -- Flanged Mace
    11406, -- Stimulus Sabots
    17221, -- Repeating Crossbow
    16542, -- Wing Sword
    16506, -- Stun Kukri
    12383, -- General's Shield
    12703, -- Coeurl Gloves
    12359, -- Hickory Shield
    12469, -- War Beret
    12575, -- Coeurl Jerkin
    12597, -- War Aketon
    12617, -- War Shinobi Gi
    12725, -- War Gloves
    12831, -- Coeurl Trousers
    12880, -- Ogre Trousers
    13087, -- Jeweled Collar
    13212, -- Tarutaru Sash
    13455, -- Coral Ring
    13460, -- Behemoth Ring
    13574, -- Black Ribbon
    13595, -- Coeurl Mantle
    13587, -- Rainbow Cape
    13448, -- Emerald Ring
    13449, -- Ruby Ring
    13450, -- Diamond Ring
    13451, -- Spinel Ring
    13452, -- Saphhire Ring
    13453, -- Topaz Ring
    13462, -- Death Ring
    13463, -- Angel's Ring
    13628, -- Hexerei Cape [SPECIAL]
    13704, -- Ogre Mask
    13918, -- Tiger Mask
    16235, -- Lynx Mantle
    15302, -- Bloodbead Gorget [SPECIAL]
    16268, -- Kubira Beads
    15827, -- Insect Ring
    15828, -- Blood Ring
    15478, -- Melee Cape
    13985, -- Platinum Bangles
    14067, -- Tarasque Mitts
    14288, -- Clown's Subligar
    15152, -- Cactuar Ribbon
    13705, -- Ogre Jerkin
    13706, -- Ogre Gloves
    13757, -- Lord's Cuirass
    13767, -- Demon's Harness
    13772, -- Bloody Aketon
    13929, -- Errant Hat
    14078, -- Errant Cuffs
    14182, -- Errant Pigaches
    14301, -- Errant Slops
    14440, -- Chasuble [SPECIAL]
    14380, -- Errant Houpala
    14196, -- Dance Shoes
    13708, -- Ogre Ledelsens
    13648, -- Gigant Mantle
    12981, -- War Boots
    12853, -- War Brais
    12447, -- Coeurl Mask
    12812, -- Thick Breeches
    12959, -- Coeurl Ledelsens
    13775, -- Blue Cotehardie
    15466, -- Birdman Cape
}

