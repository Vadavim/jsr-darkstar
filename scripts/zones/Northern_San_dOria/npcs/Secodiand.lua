-----------------------------------
-- Area: Northern San d'Oria
-- NPC:  Secodiand
-- Starts and Finishes Quest: Fear of the dark
-- @zone 231
-- @pos -160 -0 137
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- OnTrade Action
-----------------------------------
 
function onTrade(player,npc,trade)
--    
    if (player:getQuestStatus(SANDORIA,FEAR_OF_THE_DARK) ~= QUEST_AVAILABLE) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,16565);
            return;
        end

        if (trade:hasItemQty(922,2) and trade:getItemCount() == 2) then
            player:startEvent(0x0012);
        end
    end
--]]
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

 FearOfTheDark = player:getQuestStatus(SANDORIA,FEAR_OF_THE_DARK);

    if (FearOfTheDark == QUEST_AVAILABLE) then
        player:startEvent(0x0013); 
    else 
        player:startEvent(0x0011); 
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

--JSR QUEST: Fear of the Dark
local function questReward(player, firstTime)
    require("scripts/globals/jsr_utils");
    local reward = {
        ["gil"] = 200,
        ["guild"] = {ALCH, 50},
        ["item"] = 4128 -- Ether
    };

    if (firstTime == true) then
        reward = {
            ["gil"] = 800,
            ["xp"] = 400,
            ["guild"] = {ALCH, 250},
            ["augment"] = {13454, 9, 5, 52, 1},
            ["item"] = 4128 -- Ether
        };
    end
    jsrReward(player, reward);

end

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
--    
    if (csid == 0x0013 and option == 1) then
        player:addQuest(SANDORIA,FEAR_OF_THE_DARK);
    elseif (csid == 0x0012) then
        player:tradeComplete();

        if (player:getQuestStatus(SANDORIA,FEAR_OF_THE_DARK) == QUEST_ACCEPTED) then
            player:addFame(SANDORIA,30);
            player:completeQuest(SANDORIA,FEAR_OF_THE_DARK);
            questReward(player, true);
        else
            questReward(player, false);
            player:addFame(SANDORIA,5);
        end
    end
--]]    
end;