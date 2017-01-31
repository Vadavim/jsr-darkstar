-----------------------------------
-- Area: Bastok Markets
-- NPC: Roh Latteh
-- Involved in Quest: Mom, The Adventurer?
-- Finishes Quest: The Signpost Marks the Spot
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/zones/Bastok_Markets/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(BASTOK,MOM_THE_ADVENTURER) ~= QUEST_AVAILABLE and player:getVar("MomTheAdventurer_Event") == 1) then
        if (trade:hasItemQty(13454,1) and trade:getItemCount() == 1) then -- Trade Copper Ring
            player:startEvent(0x005f);
        end
    end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local HasPainting = player:hasKeyItem(PAINTING_OF_A_WINDMILL);

    if (player:getQuestStatus(BASTOK,THE_SIGNPOST_MARKS_THE_SPOT) == QUEST_ACCEPTED and HasPainting == true) then
        player:startEvent(0x0060);
    else
        player:startEvent(0x001d);
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
local function marksSpotReward(player)
    require("scripts/globals/jsr_utils");
    require("scripts/globals/jsr_augment");
    local reward = {
        ["xp"] = 1000,
        ["gil"] = 1000,
        ["augment"] = {12601, AUGMENT_HP, 14, AUGMENT_DEF, 3, 0, 0},
        ["guild"] = {WEAV, 150}
    };
    jsrReward(player, reward);
end

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 0x005f) then
        player:addKeyItem(LETTER_FROM_ROH_LATTEH);
        player:messageSpecial(KEYITEM_OBTAINED, LETTER_FROM_ROH_LATTEH);
        player:setVar("MomTheAdventurer_Event",2);
        player:tradeComplete();
    elseif (csid == 0x0060) then
        local freeInventory = player:getFreeSlotsCount();

        if (freeInventory > 0) then
            player:completeQuest(BASTOK,THE_SIGNPOST_MARKS_THE_SPOT);
            player:delKeyItem(PAINTING_OF_A_WINDMILL);
            player:addTitle(TREASURE_SCAVENGER);
            player:addFame(BASTOK,50);
            marksSpotReward(player);
        else
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,12601);
        end
    end

end;