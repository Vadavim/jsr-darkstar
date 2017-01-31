-----------------------------------
-- Area: Southern San d'Oria
-- NPC:  Hanaa Punaa
-- Starts and Finishes: A Squire's Test, A Squire's Test II, A Knight's Test
-- @zone 230
-- @pos 
-------------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");

----------------------------------- 
-- onTrade Action 
----------------------------------- 

function onTrade(player,npc,trade)    
    
    -- "The Seamstress" , x3 sheepskin trade
    if (player:getQuestStatus(SANDORIA,THE_SEAMSTRESS) ~= QUEST_AVAILABLE) then
        if (trade:hasItemQty(505,3) and trade:getItemCount() == 3) then
            player:startEvent(0x0212);
        end
    end
    
    -- "Black Tiger Skins", Tiger Hide trade
    if (player:getQuestStatus(SANDORIA,BLACK_TIGER_SKINS) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(861,3) and trade:getItemCount() == 3) then
            player:startEvent(0x0241);
        end
    end
    
    -- "Lizard Skins", lizard skin trade
    if (player:getQuestStatus(SANDORIA,LIZARD_SKINS) ~= QUEST_AVAILABLE) then
        if (trade:hasItemQty(852,3) and trade:getItemCount() == 3) then
            player:startEvent(0x0231);
        end
    end
    
    -- "Flyers for Regine"
    if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
        local count = trade:getItemCount();
        local MagicFlyer = trade:hasItemQty(532,1);
        if (MagicFlyer == true and count == 1) then
            player:messageSpecial(FLYER_REFUSED);
        end
    end
    
end;

----------------------------------- 
-- onTrigger Action 
-----------------------------------
 
function onTrigger(player,npc) 

    -- Checking Fame Level & Quest
    sanFame = player:getFameLevel(SANDORIA);
    theSteamStress = player:getQuestStatus(SANDORIA,THE_SEAMSTRESS);
    lizardSkins = player:getQuestStatus(SANDORIA,LIZARD_SKINS);
    blackTigerSkins = player:getQuestStatus(SANDORIA,BLACK_TIGER_SKINS);
    
    -- "The Seamstress" Quest Status
    if (theSteamStress == QUEST_AVAILABLE and player:getVar("theSeamStress") == 1) then
        player:startEvent(0x0213);
    elseif (theSteamStress == QUEST_AVAILABLE) then
        player:startEvent(0x0210);
        player:setVar("theSeamStress",1);
    elseif (theSteamStress == QUEST_ACCEPTED) then
        player:startEvent(0x0211);
    elseif (theSteamStress == QUEST_COMPLETED and sanFame < 2) then
        player:startEvent(0x024e);
    
    -- "Lizard Skins" Quest Dialogs
    elseif (lizardSkins == QUEST_AVAILABLE and player:getVar("lzdSkins") == 1 and sanFame >= 2 and theSteamStress == QUEST_COMPLETED) then
        player:startEvent(0x0232);
    elseif (lizardSkins == QUEST_AVAILABLE and sanFame >= 2 and theSteamStress == QUEST_COMPLETED) then
        player:startEvent(0x022f);
        player:setVar("lzdSkins",1);
    elseif (lizardSkins == QUEST_ACCEPTED) then
        player:startEvent(0x0230);
    elseif (lizardSkins == QUEST_COMPLETED and sanFame < 3) then
        player:startEvent(0x024f);
        
    -- "Black Tiger Skins" Quest Dialogs
    elseif (blackTigerSkins == QUEST_AVAILABLE and player:getVar("blkTigerSkin") == 1 and sanFame >= 3 and theSteamStress == QUEST_COMPLETED and lizardSkins == QUEST_COMPLETED) then
        player:startEvent(0x0243 );
    elseif (blackTigerSkins == QUEST_AVAILABLE and sanFame >= 3 and theSteamStress == QUEST_COMPLETED and lizardSkins == QUEST_COMPLETED) then
        player:startEvent(0x0240);
        player:setVar("blkTigerSkin",1);
    elseif (blackTigerSkins == QUEST_ACCEPTED) then
        player:startEvent(0x0242);
    elseif (blackTigerSkins == QUEST_COMPLETED) then
        player:startEvent(0x0250);
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

local function seamstressReward(player, firstTime)
    require("scripts/globals/jsr_utils");
    local reward = {
        ["gil"] = 350,
        ["guild"] = {LEAT, 80},
        ["augment"] = {12696, 1, 4, 771, 4, 769, 4}, -- Leather Gloves (+5 HP, +5 Earth and Ice Res)
    };

    if (firstTime == true) then
        reward = {
            ["gil"] = 950,
            ["guild"] = {LEAT, 300},
            ["augment"] = {12696, 1, 4, 771, 4, 769, 4}, -- Leather Gloves (+5 HP, +5 Earth and Ice Res)
        };
    end

    jsrReward(player, reward);
end

local function lizardReward(player, firstTime)
    require("scripts/globals/jsr_utils");
    require("scripts/globals/jsr_augment");
    local reward = {
        ["gil"] = 450,
        ["guild"] = {LEAT, 80},
        ["augment"] = {12697, 1, 5, 771, 8, 769, 8, AUGMENT_DEF, 1}, -- Lizard Gloves (+6 HP, +15 Earth and Ice Res)
    };

    if (firstTime == true) then
        reward = {
            ["gil"] = 1500,
            ["guild"] = {LEAT, 300},
            ["augment"] = {12697, 1, 5, 771, 8, 769, 8, AUGMENT_DEF, 1}, -- Lizard Gloves (+6 HP, +15 Earth and Ice Res)
        };
    end

    jsrReward(player, reward);
end

function tigerReward(player)
    require("scripts/globals/jsr_utils");
    local reward = {
        ["gil"] = 4500,
        ["xp"] = 1500,
        ["guild"] = {LEAT, 850},
    };
    jsrReward(player, reward);
end

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    -- "The Seamstress" Quest
    if ((csid == 0x0210 or csid == 0x0213) and option == 0) then
        player:addQuest(SANDORIA,THE_SEAMSTRESS);
        player:setVar("theSeamStress",0);
    elseif (csid == 0x0212) then
        if (player:getFreeSlotsCount() == 0) then 
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,12696); -- Leather Gloves
        else
            player:tradeComplete();
            player:addTitle(SILENCER_OF_THE_LAMBS);
            if (player:getQuestStatus(SANDORIA,THE_SEAMSTRESS) == QUEST_ACCEPTED) then
                player:addFame(SANDORIA,30);
                player:completeQuest(SANDORIA,THE_SEAMSTRESS);
                seamstressReward(player, true);
            else
                player:addFame(SANDORIA,5);
                seamstressReward(player, false);
            end
        end
    
    -- "Liard Skins" Quest 
    elseif ((csid == 0x022f or csid == 0x0232) and option == 0) then
        player:addQuest(SANDORIA,LIZARD_SKINS);
        player:setVar("lzdSkins",0);
    elseif (csid == 0x0231) then
        if (player:getFreeSlotsCount() == 0) then 
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,12697); -- Lizard Gloves
        else
            player:tradeComplete();
            player:addTitle(LIZARD_SKINNER);
            if (player:getQuestStatus(SANDORIA,LIZARD_SKINS) == QUEST_ACCEPTED) then
                player:addFame(SANDORIA,30);
                player:completeQuest(SANDORIA,LIZARD_SKINS);
                lizardReward(player, true);
            else
                player:addFame(SANDORIA,5);
                lizardReward(player, false);
            end
        end
        
    -- "Black Tiger Skins" Quest 
    elseif ((csid == 0x0240 or csid == 0x0243) and option == 0) then
        player:addQuest(SANDORIA,BLACK_TIGER_SKINS);
        player:setVar("blkTigerSkin",0);
    elseif (csid == 0x0241) then
        if (player:getFreeSlotsCount() == 0) then 
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,13119); -- Tyger Stole
        else
            player:tradeComplete();
            player:addTitle(CAT_SKINNER);
            player:addItem(13119);
            player:messageSpecial(ITEM_OBTAINED, 13119); -- Tyger Stole
            player:addFame(SANDORIA,30);
            tigerReward(player);
            player:completeQuest(SANDORIA,BLACK_TIGER_SKINS);
        end
    end
    
end;