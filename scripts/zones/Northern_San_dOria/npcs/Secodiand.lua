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
function reward(player, firstTime)
    local gil, points, xp = 0, 0, 0;
    if (firstTime) then
        gil = 800;
        points = 250;
        xp = 400;
        player:addItem( 13454, 1, 9, 5, 52, 1);
        player:messageSpecial(ITEM_OBTAINED,13454); --Copper Ring (+6 MP, +2 HMP)
    else
        player:addItem(4128);
        player:messageSpecial(ITEM_OBTAINED,4128); --Ether
        gil = 200;
        points = 50;
        xp = 50;
    end

    player:messageSpecial(GIL_OBTAINED,gil);
    player:addGil(gil);
    player:addExp(xp);
    player:SayToPlayer("Received " .. tostring(points) .. " Alchemy points.");
    player:addCurrency("guild_alchemy", points);
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
            reward(player, true);
        else
            reward(player, false);
            player:addFame(SANDORIA,5);
        end
    end
--]]    
end;