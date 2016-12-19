-----------------------------------
--  Area: North Gustaberg
--  NPC:  Field Parchment
--  Type: Fields of Valor NMs
--  @pos 400.000 -21.5 560.000 106
-----------------------------------
package.loaded["scripts/zones/Valkurm_Dunes/TextIDs"] = nil;
package.loaded["scripts/globals/jsr_utils"] = nil;
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    tradeElite(player, npc, trade, 4, {17207709});
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:hasStatusEffect(EFFECT_CONFRONTATION) or player:hasStatusEffect(EFFECT_LEVEL_RESTRICTION)) then
        player:delStatusEffect(EFFECT_CONFRONTATION);
        player:delStatusEffect(EFFECT_LEVEL_RESTRICTION);
    end;

    rewardElite(player, npc, itemReward35);
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

