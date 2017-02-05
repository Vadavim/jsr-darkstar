-----------------------------------
-- Area: Port San d'Oria
-- NPC: Altiret 
-- NPC for Quest "The Pickpocket"
-----------------------------------
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Port_San_dOria/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    -- "Flyers for Regine" conditional script
    local FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);
    -- "The Pickpocket" Quest status
    thePickpocket = player:getQuestStatus(SANDORIA, THE_PICKPOCKET);
    
    -- "The Pickpocket" Quest, trading for light axe
    if (thePickpocket == 1) then
        local count = trade:getItemCount();
        local freeSlot = player:getFreeSlotsCount();
        local giltGlasses = trade:hasItemQty(579, 1);
        if (count == 1 and freeSlot > 0 and giltGlasses == true) then
            player:tradeComplete();
            player:addFame(SANDORIA,30);
            player:addTitle(PICKPOCKET_PINCHER);
            player:completeQuest(SANDORIA,THE_PICKPOCKET);
            player:startEvent(0x0226); 
        elseif (giltGlasses == false) then
            player:startEvent(0x0227);
        else
            player:messageSpecial(6402, 579); -- CANNOT_OBTAIN_ITEM
        end;
    -- "Flyers for Regine"
    elseif (FlyerForRegine == 1) then
        local count = trade:getItemCount();
        local MagicFlyer = trade:hasItemQty(532,1);
        if (MagicFlyer == true and count == 1) then
            player:messageSpecial(FLYER_REFUSED);
        elseif (MagicFlyer == false) then
            player:startEvent(0x0227);
        end
    else 
        player:startEvent(0x0227);
    end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    -- Vars for the Quest "The Pickpocket"
    local thePickpocket = player:getQuestStatus(SANDORIA, THE_PICKPOCKET);
    local openingCS = player:getVar("thePickpocket");
    
    -- "The Pickpocket" Quest dialog
    if (thePickpocket == 0 and openingCS == 1) then
        player:startEvent(0x0223);
        player:addQuest(SANDORIA,THE_PICKPOCKET);
    elseif (thePickpocket == 1) then
        player:startEvent(0x0223);
    elseif (thePickpocket == 2) then
        player:startEvent(0x0244);
    else 
        player:startEvent(0x022f);
    end;
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
        ["xp"] = 1250,
        ["gil"] = 800,
        ["augment"] = {16667, 48, 24}
    };
    jsrReward(player, reward);
end

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    -- "The Pickpocket" reward with light axe, done with quest
    if (csid == 0x0226) then
        questReward(player);
    end;
end;
