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
    local power = math.floor(1 + runLevel * 0.777);
    player:addStatusEffect(rune,power,3,60);
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

function createValianceMask(target)
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
