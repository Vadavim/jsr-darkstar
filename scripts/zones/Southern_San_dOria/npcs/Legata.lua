-----------------------------------
-- Area: Southern San d'Oria
-- NPC:  Legata
-- Starts and Finishes Quest: Starting a Flame (R)
-- @zone 230
-- @pos 82 0 116
-------------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");

----------------------------------- 
-- onTrade Action 
----------------------------------- 

function onTrade(player,npc,trade)
    
    if (player:getQuestStatus(SANDORIA,STARTING_A_FLAME) ~= QUEST_AVAILABLE) then
        if (trade:hasItemQty(768,4) and trade:getItemCount() == 4) then
            player:startEvent(0x0024);
        end
    end

end;

----------------------------------- 
-- onTrigger Action 
-----------------------------------
 
function onTrigger(player,npc) 
    
    if (player:getQuestStatus(SANDORIA,STARTING_A_FLAME) == QUEST_AVAILABLE) then
        player:startEvent(0x0025);
    else
        player:startEvent(0x0023);
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

local function questReward(player, firstTime)
    require("scripts/globals/jsr_utils");
    local reward = {
        ["gil"] = 150,
        ["guild"] = {GOLD, 40},
    };
    if (firstTime == true) then
        reward = {
            ["gil"] = 800,
            ["guild"] = {GOLD, 150},
        };
    end

    jsrReward(player, reward);
end

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    
    if (csid == 0x0025 and option == 1) then
        player:addQuest(SANDORIA,STARTING_A_FLAME);
    elseif (csid == 0x0024) then
        player:tradeComplete();
        if (player:getQuestStatus(SANDORIA,STARTING_A_FLAME) == QUEST_ACCEPTED) then
            questReward(player, true);
            player:addFame(SANDORIA,30);
            player:completeQuest(SANDORIA,STARTING_A_FLAME);
        else
            player:addFame(SANDORIA,5);
            questReward(player, false);
        end
    end

end;