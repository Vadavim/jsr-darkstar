-----------------------------------
-- Area: Windurst Waters
--  NPC: Sigismund
-- Starts and Finishes Quest: To Catch a Falling Star
--    Working 100%
--  @zone = 240
-- @pos = -110 -10 82
-----------------------------------
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/status");
require("scripts/zones/Port_Windurst/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    starstatus = player:getQuestStatus(WINDURST,TO_CATCH_A_FALLIHG_STAR);
    if (starstatus == 1 and trade:hasItemQty(546,1) == true and trade:getItemCount() == 1 and trade:getGil() == 0) then
        player:startEvent(0x00c7); -- Quest Finish
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    starstatus = player:getQuestStatus(WINDURST,TO_CATCH_A_FALLIHG_STAR);
    if (starstatus == QUEST_AVAILABLE) then
        player:startEvent(0x00c4,0,546); -- Quest Start 
    elseif (starstatus == QUEST_ACCEPTED) then
        player:startEvent(0x00c5,0,546); -- Quest Reminder
    elseif (starstatus == QUEST_COMPLETED and player:getVar("QuestCatchAFallingStar_prog") > 0) then
        player:startEvent(0x00c8); -- After Quest
        player:setVar("QuestCatchAFallingStar_prog",0)
    else
        player:startEvent(0x0165);
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
    require("scripts/globals/jsr_augment");
    local reward = {
        ["xp"] = 2000,
        ["gil"] = 1500,
        ["augment"] = {12316, AUGMENT_HP, 9, AUGMENT_DEF, 0, AUGMENT_WATERRES, 14}
    };
    jsrReward(player, reward);
end

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x00c4) then
        player:addQuest(WINDURST,TO_CATCH_A_FALLIHG_STAR);
    elseif (csid == 0x00c7) then
        player:tradeComplete(trade);
        player:completeQuest(WINDURST,TO_CATCH_A_FALLIHG_STAR);
        player:addFame(WINDURST,75);
        questReward(player);
        player:setVar("QuestCatchAFallingStar_prog",2);
    end
end;



