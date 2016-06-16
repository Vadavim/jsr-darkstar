require("scripts/globals/status");


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
    
    effect:addMod(MOD_FIRERES, pflugRes(unda));
    effect:addMod(MOD_VIRUSRES, pflugRes(unda) / 5);
    effect:addMod(MOD_AMNESIARES, pflugRes(unda) / 5);

    effect:addMod(MOD_ICERES, pflugRes(ignis));
    effect:addMod(MOD_PARALYZERES, pflugRes(ignis) / 5);
    effect:addMod(MOD_BINDRES, pflugRes(ignis) / 5);

    effect:addMod(MOD_WATERRES, pflugRes(sulpor));
    effect:addMod(MOD_POISONRES, pflugRes(sulpor) / 5);

    effect:addMod(MOD_EARTHRES, pflugRes(flabra));
    effect:addMod(MOD_SLOWRES, pflugRes(flabra) / 5);
    effect:addMod(MOD_GRAVITYRES, pflugRes(flabra) / 5);
    effect:addMod(MOD_PETRIFYRES, pflugRes(flabra) / 5);

    effect:addMod(MOD_THUNDERRES, pflugRes(tellus));
    effect:addMod(MOD_STUNRES, pflugRes(tellus) / 5);

    effect:addMod(MOD_WINDRES, pflugRes(gelus));
    effect:addMod(MOD_SILENCERES, pflugRes(gelus) / 5);

    effect:addMod(MOD_LIGHTRES, pflugRes(tenebrae));
    effect:addMod(MOD_CHARMRES, pflugRes(tenebrae) / 5);

    effect:addMod(MOD_DARKRES, pflugRes(lux));
    effect:addMod(MOD_SLEEPRES, pflugRes(lux) / 5);
    effect:addMod(MOD_BLINDRES, pflugRes(lux) / 5);
    effect:addMod(MOD_CURSERES, pflugRes(lux) / 5);
    effect:addMod(MOD_DEATHRES, pflugRes(lux) / 5);
end;

function startConfrontation(player, power, duration, mobs)
    local mob = nil;
    player:applyConfrontationToParty(power, duration);
    for k,v in pairs(mobs) do
        mob = SpawnMob(v);
        mob:setPos( player:getXPos(), player:getYPos(), player:getZPos(), player:getRotPos(), player:getZoneID() );
        mob:addStatusEffect(EFFECT_CONFRONTATION, power, 0, duration);
        --DespawnMob(mob, 25);
        mob:updateClaim(player);
        mob:setSpawner(player);
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

WOOD = "woodworking"
FISH = "fishing"
SMIT = "smithing"
GOLD = "goldsmithing"
WEAV = "weaving"
LEAT = "leathercraft"
BONE = "bonecraft"
ALCH = "alchemy"
COOK = "cooking"


function jsrReward(player, rewards)
    if (rewards["xp"] ~= nil) then
        player:addExp(rewards["xp"]);
    end

    if (rewards["gil"] ~= nil) then
        player:addGil(rewards["gil"]);
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
        player:addItem(arr[1], 1, arr[2], arr[3], arr[4], arr[5], arr[6], arr[7]);
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



function reduced_healing_factor(target)
    local factor = 1.0;
    if (target:getStatusEffect(EFFECT_POISON) ~= nil) then
        factor = factor * 0.75;
    end

    if (target:getStatusEffect(EFFECT_BIO) ~= nil) then
        factor = factor * 0.75;
    end

    if (target:getStatusEffect(EFFECT_DISEASE) ~= nil) then
        factor = factor * 0.66;
    end

    if (target:getStatusEffect(EFFECT_PLAGUE) ~= nil) then
        factor = factor * 0.66;
    end

    if (target:getStatusEffect(EFFECT_RASP) ~= nil) then
        factor = factor * 0.75;
    end


    return factor;
end

function rewardTemporaryItem(player)
    local level = player:getMainLvl();
    local hasMP = player:getMaxMP() > 25;
    local statPotions = {4207, 4205, 4211, 4209, 4199, 4203};
    local boostItems = { -- Count: 18
        5440, -- Dusty Wing
        5392, -- Champion's Drink
        5389, -- Spy's Drink
        5386, -- Fighter's Drink
        5385, -- Barbarian's Drink
        5849, -- Berserker's Drink
        5241, -- Giant's Drink
        5395, -- Cleric's Drink
        5770, -- Super Reraiser
        5322, -- Healing Powder
        5832, -- Healing Mist
        5833, -- Mana Mist
        4255, -- Mana Powder
        5393, -- Monarch's Drink
        4174, -- Vile Elixir
        4175, -- Vile Elixir +1
        4254, -- Megalixir
        4155 -- Remedy
    };


    local item = 0;
    local rand = math.random(0, 100);
    if (rand <= 15) then
       item = statPotions[math.random(1,6)];
    else
        item = boostItems[math.random(1,18)];
    end

    player:addTempItem(item);
    player:messageSpecial(ITEM_OBTAINED, item);
end




