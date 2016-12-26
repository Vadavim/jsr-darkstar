-----------------------------------
-- Area: Windurst Woods
--   NPC: Varun
--  Type: Standard NPC
-- @zone 241
-- @pos 7.800 -3.5 -10.064
--
-- Auto-Script: Requires Verification (Verfied by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
require("scripts/zones/Windurst_Woods/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/quests");
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    RRvar = player:getVar("rockracketeer_sold");
    
    -- Rock Racketeer
    if (RRvar == 6) then
        if (player:getFreeSlotsCount() >= 2 and trade:hasItemQty(598,1) == true and trade:getItemCount() == 1) then  -- Sharp Stone
            player:startEvent(0x0066,2100); -- finish quest
        end
    
    
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    RRvar = player:getVar("rockracketeer_sold");
    
    -- Rock Racketeer
    if (RockRacketeer == QUEST_ACCEPTED and RRvar == 3) then 
        player:startEvent(0x0064);                                     -- talk about lost stone
    elseif (RockRacketeer == QUEST_ACCEPTED and RRvar == 4) then
        player:startEvent(0x0065,0,598);                            -- send player to Palborough Mines
        
    -- standard dialog
    else    
        player:startEvent(0x01b0);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------
local function questReward(player)
    require("scripts/globals/jsr_utils");
    local reward = {
        ["gil"] = 4000,
        ["xp"] = 1250,
        ["item"] = 4769, -- Scroll of Stone II
        ["item2"] = 4769, -- Scroll of Stone II
        ["guild"] = {SMIT, 350},
        ["augment"] = {13330, 17, 2, 181, 4, 180, 4}, -- Tourmaline Earring: +3 HP/MP, +5 Resist Petrify and Silence
    };
    jsrReward(player, reward);
end

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    
    -- Rock Racketeer
    if (csid == 0x0064) then
        player:setVar("rockracketeer_sold",4);
    elseif (csid == 0x0065) then
        player:setVar("rockracketeer_sold",5);
    elseif (csid == 0x0066) then
        player:tradeComplete();
        player:addFame(WINDURST,30);
        questReward(player);
        player:completeQuest(WINDURST,ROCK_RACKETTER);
        player:setVar("rockracketeer_sold",0); -- finish cleanup of vars
    
    end
end;

