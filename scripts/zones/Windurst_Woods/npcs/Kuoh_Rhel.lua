-----------------------------------
-- Area: Windurst Woods
--  NPC: Kuoh Rhel
--  Type: Standard NPC
--  @zone 241
-- @pos 131.437 -6 -102.723
-- Starts quests: Chocobilious, In a Stew
--  Note: In a Stew should only repeat once per conquest tally. The tally is not implemented at time of
--        writing this quest. Once it is working please feel free to add it in ^^
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/zones/Windurst_Woods/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    chocobilious = player:getQuestStatus(WINDURST,CHOCOBILIOUS);
    IAS = player:getQuestStatus(WINDURST,IN_A_STEW);
    IASvar = player:getVar("IASvar");
    
    -- In a Stew
    if (IAS == QUEST_AVAILABLE and chocobilious == QUEST_COMPLETED and player:getFameLevel(WINDURST) >= 3) then
        if (player:needToZone()) then
            player:startEvent(0x00E8); -- Post quest dialog from Chocobilious
        else
            player:startEvent(0x00EB); -- IAS start
        end
    
    elseif (IASvar == 4 and player:hasKeyItem(RANPIMONPIS_SPECIAL_STEW)) then
        player:startEvent(0x00EF);    -- IAS turn in
    
    elseif (IAS == QUEST_ACCEPTED) then
        player:startEvent(0x00EC); -- reminder dialog
    
    
    -- Uncomment once conquest tally in place
    elseif (IAS == QUEST_COMPLETED) then
        player:startEvent(0x00F0); -- new dialog between repeats
        
    elseif (IAS == QUEST_COMPLETED) then
        player:startEvent(0x00EA);    -- start repeat
    
    -- Chocobilious
    elseif (chocobilious == QUEST_AVAILABLE and player:getFameLevel(WINDURST) >= 2) then 
        player:startEvent(0x00e0); -- Start quest
    elseif (chocobilious == QUEST_COMPLETED and player:needToZone() == true) then
        player:startEvent(0x00e8); -- Quest complete
    elseif (chocobilious == QUEST_ACCEPTED and player:getVar("ChocobiliousQuest") == 2) then
        player:startEvent(0x00e7); -- Talked to Tapoh
    elseif (chocobilious == QUEST_ACCEPTED) then
        player:startEvent(0x00e1); -- Post quest accepted
    else
    -- Standard dialog
        player:startEvent(0x00de); 
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
local function chocoReward(player)
    require("scripts/globals/jsr_utils");
    local reward = {
        ["gil"] = 2500,
        ["xp"] = 800,
        ["guild"] = {COOK, 300},
    };
    jsrReward(player, reward);
end

local function stewReward(player, firstTime)
    require("scripts/globals/jsr_utils");
    local reward = {
        ["gil"] = 1000,
        ["xp"] = 350,
        ["guild"] = {COOK, 125},
    };
    if (firstTime == true) then
        reward = {
            ["gil"] = 3000,
            ["xp"] = 1250,
            ["guild"] = {COOK, 450},
        };
    end

    jsrReward(player, reward);
end

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    --Chocobilious
    if (csid == 0x00e0 and option == 1) then            -- Quest start
        player:addQuest(WINDURST,CHOCOBILIOUS);
    elseif (csid == 0x00e7) then                        -- finish Quest
        player:completeQuest(WINDURST,CHOCOBILIOUS);
        player:addFame(WINDURST,220);
        chocoReward(player);
        player:tradeComplete();
        player:setVar("ChocobiliousQuest",0)
        player:needToZone(true); 
        
    -- In a Stew
    elseif (csid == 0x00EB) then
        player:addQuest(WINDURST,IN_A_STEW);    -- Quest start
        player:setVar("IASvar",1);
    elseif (csid == 0x00EF) then
        player:completeQuest(WINDURST,IN_A_STEW);    -- finish Quest
        player:setVar("IASvar",0);

        local IAS = player:getQuestStatus(WINDURST,IN_A_STEW);
        if (IAS == QUEST_ACCEPTED) then
            stewReward(player, true);
            player:addFame(WINDURST,50);
        else
            stewReward(player, false);
            player:addFame(WINDURST,15);
        end

        player:delKeyItem(RANPIMONPIS_SPECIAL_STEW);
    elseif (csid == 0x0EA and option == 1) then        -- start repeat
        player:setVar("IASvar",3);
    
    end
end;
