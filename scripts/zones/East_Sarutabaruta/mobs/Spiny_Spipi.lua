-----------------------------------	
-- Area: East Sarutabaruta	
-- NM:   Spiny Spipi	
-----------------------------------	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
    if (mob == nil or mob:getLocalVar("TimedOut") == 1) then
        return;
    end
    if (mob:getSpawner() ~= nil) then
        local player = mob:getSpawner();
        if (player ~= nil) then
            player:removeConfrontationFromParty();
        end
        return;
    end
    -- Set Spiny_Spipi's Window Open Time
    wait = math.random((10),(100))
    SetServerVariable("[POP]Spiny_Spipi", os.time(t) + wait); -- 45 - 120 minutes
    DeterMob(mob:getID(), true);
    
    -- Set PH back to normal, then set to respawn spawn
    PH = GetServerVariable("[PH]Spiny_Spipi");
    SetServerVariable("[PH]Spiny_Spipi", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));
    
end;	
