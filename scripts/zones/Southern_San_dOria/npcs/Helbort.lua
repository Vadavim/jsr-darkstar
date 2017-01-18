-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Helbort
--  Starts and Finished Quest: A purchase of Arms
--  @zone 230
-- @pos  71 -1 65
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/zones/Southern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    quest_fas = player:getQuestStatus(SANDORIA,FATHER_AND_SON);      -- 1st Quest in Series
    quest_poa = player:getQuestStatus(SANDORIA,A_PURCHASE_OF_ARMS);  -- 2nd Quest in Series

    if (player:getFameLevel(SANDORIA) >= 2 and quest_fas == QUEST_COMPLETED and quest_poa == QUEST_AVAILABLE) then 
        player:startEvent(0x0252);  -- Start quest A Purchase of Arms
    elseif (quest_poa == QUEST_ACCEPTED and player:hasKeyItem(WEAPONS_RECEIPT) == true) then
        player:startEvent(0x025f); -- Finish A Purchase of Arms quest
    else
        player:startEvent(0x0251);  -- Standard Dialog
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
-- onEventFinish Action
-----------------------------------

function questReward(player)
    require("scripts/globals/jsr_utils");
    local reward = {
        ["xp"] = 800,
        ["gil"] = 500,
        ["beast"] = 1,
        ["augment"] = {17090, 512, 1, 25, 1}, -- Elm Staff (+2 STR and Attack)
    };
    jsrReward(player, reward);
end

function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);


    if (csid == 0x0252 and option == 0) then
        player:addQuest(SANDORIA, A_PURCHASE_OF_ARMS);
        player:addKeyItem(WEAPONS_ORDER);
        player:messageSpecial(KEYITEM_OBTAINED,WEAPONS_ORDER);
    elseif (csid == 0x025f) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,17090); -- Elm Staff
        else
            player:addTitle(ARMS_TRADER);
            player:delKeyItem(WEAPONS_RECEIPT);
            questReward(player);
            player:addFame(SANDORIA,30);
            player:completeQuest(SANDORIA, A_PURCHASE_OF_ARMS);
        end
    end
    
end;