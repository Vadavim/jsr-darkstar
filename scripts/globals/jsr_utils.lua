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
    if(player:getMainJob() == JOB_RUN or player:getMainJob() == JOB_GEO) then
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
    local power = math.floor(1 + runLevel * 0.45);
    player:addStatusEffect(rune,power,3,300);
end;

function vallationDefense(count)
    if (count == 1) then
        return 300;
    elseif (count == 2) then
        return 350;
    elseif (count == 3) then
        return 400;
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
    
    effect:addMod(MOD_FIREDEF, vallationDefense(ignis));
    effect:addMod(MOD_ICEDEF, vallationDefense(gelus));
    effect:addMod(MOD_WATERDEF, vallationDefense(unda));
    effect:addMod(MOD_EARTHDEF, vallationDefense(tellus));
    effect:addMod(MOD_THUNDERDEF, vallationDefense(sulpor));
    effect:addMod(MOD_WINDDEF, vallationDefense(flabra));
    effect:addMod(MOD_LIGHTDEF, vallationDefense(lux));
    effect:addMod(MOD_DARKDEF, vallationDefense(tenebrae));      
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
    
    effect:addMod(MOD_FIRERES, pflugRes(ignis));
    effect:addMod(MOD_VIRUSRES, pflugRes(ignis) / 10);
    effect:addMod(MOD_AMNESIARES, pflugRes(ignis) / 10);
    effect:addMod(MOD_ICERES, pflugRes(gelus));
    effect:addMod(MOD_PARALYZERES, pflugRes(gelus) / 10);
    effect:addMod(MOD_BINDRES, pflugRes(gelus) / 10);
    effect:addMod(MOD_WATERRES, pflugRes(unda));
    effect:addMod(MOD_POISONRES, pflugRes(unda) / 10);
    effect:addMod(MOD_EARTHRES, pflugRes(tellus));
    effect:addMod(MOD_SLOWRES, pflugRes(tellus) / 10);
    effect:addMod(MOD_GRAVITYRES, pflugRes(tellus) / 10);
    effect:addMod(MOD_PETRIFYRES, pflugRes(tellus) / 10);
    effect:addMod(MOD_THUNDERRES, pflugRes(sulpor));
    effect:addMod(MOD_STUNRES, pflugRes(sulpor) / 10);
    effect:addMod(MOD_WINDRES, pflugRes(flabra));
    effect:addMod(MOD_SILENCERES, pflugRes(flabra) / 10);
    effect:addMod(MOD_LIGHTRES, pflugRes(lux));
    effect:addMod(MOD_CHARMRES, pflugRes(lux) / 10);
    effect:addMod(MOD_DARKRES, pflugRes(tenebrae));      
    effect:addMod(MOD_SLEEPRES, pflugRes(tenebrae) / 10);    
    effect:addMod(MOD_BLINDRES, pflugRes(tenebrae) / 10);    
    effect:addMod(MOD_CURSERES, pflugRes(tenebrae) / 10);      
    effect:addMod(MOD_DEATHRES, pflugRes(tenebrae) / 10);      
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

    if (target:getstatuseffect(effect_rasp) ~= nil) then
        factor = factor * 0.75;
    end


    return factor;
end



