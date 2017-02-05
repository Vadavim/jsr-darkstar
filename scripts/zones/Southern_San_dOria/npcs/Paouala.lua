-----------------------------------
-- Area: Southern San d'Oria
-- NPC:  Paouala
-- Starts and Finishes Quest: Sleepless Nights
-- @zone 230
-- @pos 158 -6 17
-------------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");

----------------------------------- 
-- onTrade Action 
----------------------------------- 

function onTrade(player,npc,trade)

    if (player:getQuestStatus(SANDORIA,SLEEPLESS_NIGHTS) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(4527,1) and trade:getItemCount() == 1) then
            player:startEvent(0x0054);
        end
    end
    
end;

----------------------------------- 
-- onTrigger Action 
-----------------------------------
 
function onTrigger(player,npc) 

    sleeplessNights = player:getQuestStatus(SANDORIA,SLEEPLESS_NIGHTS);

    if (player:getFameLevel(SANDORIA) >= 2 and sleeplessNights == QUEST_AVAILABLE) then
        player:startEvent(0x0055);
    elseif (sleeplessNights == QUEST_ACCEPTED) then
        player:startEvent(0x0053);
    elseif (sleeplessNights == QUEST_COMPLETED) then
        player:startEvent(0x0051);
    else
        player:startEvent(0x0052);
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

function questReward(player)
    require("scripts/globals/jsr_utils");
    local reward = {
        ["gil"] = 8000,
        ["xp"] = 4000,
        ["guild"] = {COOK, 500},
        ["scyld"] = 100,
    };
    jsrReward(player, reward);
end

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 0x0055 and option == 1) then
        player:addQuest(SANDORIA,SLEEPLESS_NIGHTS);
    elseif (csid == 0x0054) then
        player:tradeComplete();
        player:addTitle(SHEEPS_MILK_DELIVERER);
        questReward(player);
        player:addFame(SANDORIA,30);
        player:completeQuest(SANDORIA,SLEEPLESS_NIGHTS);
    end

end;




