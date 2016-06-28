-----------------------------------
-- Area: Port San d'Oria
-- NPC: Vounebariont
-- Starts and Finishes Quest: Thick Shells
-----------------------------------
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/zones/Port_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    if (player:getQuestStatus(SANDORIA,THICK_SHELLS) ~= QUEST_AVAILABLE) then
        if (trade:hasItemQty(889,5) and trade:getItemCount() == 5) then -- Trade Beetle Shell
            player:startEvent(0x0202);
        end
    end
    
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    if (player:getFameLevel(SANDORIA) >= 2) then
        player:startEvent(0x0204);
    else
        player:startEvent(0x0238);
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
        ["xp"] = 200,
        ["gil"] = 950,
        ["guild"] = {BONE, 65},
        ["item"] = 4262 -- Purple Drop
    };
    if (firstTime == true) then
        reward = {
            ["xp"] = 400,
            ["gil"] = 2600,
            ["guild"] = {BONE, 300},
            ["item"] = 4262 -- Purple Drop
        };
    end

    jsrReward(player, reward);
end

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 0x0204) then
        if (player:getQuestStatus(SANDORIA,THICK_SHELLS) == QUEST_AVAILABLE) then
            player:addQuest(SANDORIA,THICK_SHELLS);
        end
    elseif (csid == 0x0202) then
        if (player:getQuestStatus(SANDORIA,THICK_SHELLS) == QUEST_ACCEPTED) then
            player:completeQuest(SANDORIA,THICK_SHELLS);
            player:addFame(SANDORIA,30);
            questReward(player, true);
        else
            player:addFame(SANDORIA,5);
            questReward(player, false);
        end

        player:tradeComplete();
        player:addTitle(BUG_CATCHER);
    end
    
end;