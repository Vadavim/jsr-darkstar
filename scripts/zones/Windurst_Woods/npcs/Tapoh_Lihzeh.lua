-----------------------------------
-- Area: Windurst Woods
--  NPC: Tapoh Lihzeh
-- Starts & Finishes Repeatable Quest: Paying Lip Service
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/zones/Windurst_Woods/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local count = trade:getItemCount();
    if (player:getQuestStatus(WINDURST,CHOCOBILIOUS) == QUEST_ACCEPTED and player:getVar("ChocobiliousQuest") == 1) then
        if (count == 1 and trade:hasItemQty(938,1)) then
            player:startEvent(0x00e5,0,938); 
            player:setVar("ChocobiliousQuest",2)
        end
    elseif (player:getQuestStatus(WINDURST,PAYING_LIP_SERVICE) >= QUEST_ACCEPTED) then
    
        if (trade:hasItemQty(912,3) and count == 3) then
            player:startEvent(0x01df,0,912,1016,0,1);
        elseif (trade:hasItemQty(1016,2) and count == 2) then
            player:startEvent(0x01df,0,912,1016,0,0);
        end
        
    end
    
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local PayingLipService = player:getQuestStatus(WINDURST,PAYING_LIP_SERVICE);
    local chocobilious = player:getQuestStatus(WINDURST,CHOCOBILIOUS);
    local chocoVar = player:getVar("ChocobiliousQuest");
    
    if (chocobilious == QUEST_ACCEPTED and chocoVar == 2) then
        player:startEvent(0x00e6); -- after trading    
    elseif (chocobilious == QUEST_ACCEPTED and chocoVar == 1) then
        player:startEvent(0x00e4,0,938); -- after first talk
    elseif (chocobilious == QUEST_ACCEPTED) then
        player:startEvent(0x00e3,0,938); -- first talk
        player:setVar("ChocobiliousQuest",1)
        
    elseif (PayingLipService == QUEST_ACCEPTED) then
        player:startEvent(0x01de,0,912,1016,GIL_RATE*150,GIL_RATE*200);
    elseif (PayingLipService == QUEST_AVAILABLE) then
        player:startEvent(0x01dd,0,912,1016,GIL_RATE*150,GIL_RATE*200);
        
    else
        player:startEvent(0x01b5);
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

local function questReward(player, type, firstTime)
    require("scripts/globals/jsr_utils");
    local reward = {};
    if (type == 0) then
        reward = {
            ["gil"] = 250,
            ["xp"] = 200,
            ["guild"] = {ALCH, 50},
        };
    else
        reward = {
            ["gil"] = 350,
            ["xp"] = 250,
            ["guild"] = {BONE, 50},
        };
    end

    if (firstTime == true) then
        reward = {
            ["gil"] = 1000,
            ["xp"] = 800,
        };
    end

    jsrReward(player, reward);
end

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 0x01dd and option == 1) then
        player:addQuest(WINDURST,PAYING_LIP_SERVICE);
    elseif (csid == 0x01df) then
        PayingLipService = player:getQuestStatus(WINDURST,PAYING_LIP_SERVICE);
        
        if (PayingLipService == QUEST_ACCEPTED) then
            player:completeQuest(WINDURST,PAYING_LIP_SERVICE);
            player:addFame(WINDURST,60);
            player:addTitle(KISSER_MAKEUPPER);
        else
            player:addFame(WINDURST,8);
        end
        
        if (option == 1) then
            if (PayingLipService == QUEST_ACCEPTED) then
                questReward(player, 0, true);
            else
                questReward(player, 0, false);
            end

        else
            if (PayingLipService == QUEST_ACCEPTED) then
                questReward(player, 1, true);
            else
                questReward(player, 1, false);
            end
        end
        player:tradeComplete();
        
        
    end;

end;




