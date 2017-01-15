-----------------------------------    
-- Area: West Ronfaure    
-- NPC:  Field Manual    
-----------------------------------    
    
require("scripts/globals/settings");
require("scripts/globals/status");
--require("scripts/globals/fieldsofvalor");
    
-----------------------------------    
-- onTrigger Action    
-----------------------------------

function parseLocsSay(player, locs)
    local sayString = "";
    for i,v in pairs(locs) do
        sayString = sayString .. v[1] .. " (" .. v[2] .. " x" .. tostring(v[3]) .. ")\n";
    end

    player:SayToPlayer(sayString);

end


function onTrigger(player,npc)
    local locs = {
        {"King Ranp. Tomb", "Earth", 4},
        {"Bost. Oubliette", "Water", 4},
        {"Forst Ghelsba", "Fire", 4},
        {"La Theine", "Wind", 4}
    };
--    parseLocsSay(player, locs);
--    player:addStatusEffect(EFFECT_ATMA,1,3,60);
--    startFov(FOV_EVENT_WEST_RONFAURE,player);
--    player:SayToPlayer("King Ranperre's Tomb (x4 Earth)\nBost. Oubliette (x4 Water)\nFort Ghelsba(x4 Fire)\n")
end;
    
-----------------------------------    
-- onTrade Action    
-----------------------------------    
    
function onTrade(player,npc,trade)    
end;    
    
-----------------------------------    
-- onEventSelection    
-----------------------------------    
    
function onEventUpdate(player,csid,menuchoice)    
--    updateFov(player,csid,menuchoice,1,2,3,4,56);
end;    
    
-----------------------------------    
-- onEventFinish Action    
-----------------------------------    
    
function onEventFinish(player,csid,option)    
    finishFov(player,csid,option,1,2,3,4,56,FOV_MSG_WEST_RONFAURE);
end;    
