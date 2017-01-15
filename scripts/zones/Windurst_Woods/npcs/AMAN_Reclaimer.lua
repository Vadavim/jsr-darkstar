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
    for job=0,22 do
        for level=5,75 do
            local jobLevel = player:getJobLevel(job);
            if (jobLevel >= level and player:getMaskBit("lvl" .. tostring(level) .. "_rewards", job) == 0) then
                player:setMaskBit("lvl" .. tostring(level) .. "_rewards", job, true);
            end

        end

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

