-----------------------------------
-- Area: Bastok Markets
-- NPC: Aquillina
-- Starts & Finishes Repeatable Quest: A Flash In The Pan
-- Note: Reapeatable every 15 minutes.
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Bastok_Markets/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

FlashInThePan = player:getQuestStatus(BASTOK,A_FLASH_IN_THE_PAN);

    if (FlashInThePan >= QUEST_ACCEPTED) then
        PreviousTime = player:getVar("FlashInThePan");
        CurrentTime  = os.time();
        
        if (CurrentTime >= PreviousTime) then
            count  = trade:getItemCount();
            FlintStone = trade:hasItemQty(768,4);
            
            if (FlintStone == true and count == 4) then
                player:startEvent(0x00db);
            end
        else
            player:startEvent(0x00da);
        end
    end

end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

FlashInThePan = player:getQuestStatus(BASTOK,A_FLASH_IN_THE_PAN);

    if (FlashInThePan == QUEST_AVAILABLE) then
        player:startEvent(0x00d9);
    else
        player:startEvent(0x0074);
    end
    
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID2: %u",csid);
    -- printf("RESULT2: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

local function flashReward(player, isFirst)
    require("scripts/globals/jsr_utils");
    require("scripts/globals/jsr_augment");
    local reward = {
        ["xp"] = 100,
        ["gil"] = 250,
        ["guild"] = {SMIT, 50},
    };
    if (isFirst == true) then
        reward = {
            ["xp"] = 500,
            ["gil"] = 800,
            ["guild"] = {SMIT, 150},
    };
    end

    jsrReward(player, reward);
end

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 0x00d9) then
        player:addQuest(BASTOK, A_FLASH_IN_THE_PAN);        
    elseif (csid == 0x00db) then
        FlashInThePan = player:getQuestStatus(BASTOK,A_FLASH_IN_THE_PAN);
        CompleteTime = os.time();
        
        if (FlashInThePan == QUEST_ACCEPTED) then
            player:completeQuest(BASTOK, A_FLASH_IN_THE_PAN);
            player:addFame(BASTOK,75);
            flashReward(player, true);
        else
            player:addFame(BASTOK,8);
            flashReward(player, false);
        end
        
        player:tradeComplete();
        player:setVar("FlashInThePan",CompleteTime + 900);
    end
    
end;


