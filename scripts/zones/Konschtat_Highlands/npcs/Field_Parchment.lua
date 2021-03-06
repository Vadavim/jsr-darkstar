-----------------------------------
--  Area: North Gustaberg
--  NPC:  Field Parchment
--  Type: Fields of Valor NMs
--  @pos 400.000 -21.5 560.000 106
-----------------------------------
package.loaded["scripts/zones/Konschtat_Highlands/TextIDs"] = nil;
package.loaded["scripts/globals/jsr_utils"] = nil;
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    tradeElite(player, npc, trade, 2, {17220007});
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:hasStatusEffect(EFFECT_CONFRONTATION) or player:hasStatusEffect(EFFECT_LEVEL_RESTRICTION)) then
        player:delStatusEffect(EFFECT_CONFRONTATION);
        player:delStatusEffect(EFFECT_LEVEL_RESTRICTION);
    end;

    rewardElite(player, npc, itemReward15);
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

