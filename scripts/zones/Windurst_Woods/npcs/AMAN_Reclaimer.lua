-----------------------------------
--  Area: Windurst Woods
--   NPC: Abby Jalunshi
--  Type: Moghouse Renter
-- @zone 241
-- @pos -101.895 -5 36.172
--
-- Auto-Script: Requires Verification (Verfied By Brawndo)
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------

function levelRewards(player)
    local totalReward = 0;
    local totalLevels = 0;
    for job=0,22 do
        totalLevels = totalLevels + player:getJobLevel(job);
    end

    local curReward = player:getVar("totalLevelReward");
    while (curReward < totalLevels) do
        totalReward = totalReward + 50 + curReward * 10;
    end


end

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:SayToPlayer("HI");
    levelRewards(player);
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

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

