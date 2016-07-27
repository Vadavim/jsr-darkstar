-----------------------------------    
-- Area: East Sarutabaruta
-- NPC:  Field Manual    
-----------------------------------    
    
require("scripts/globals/settings");    
require("scripts/globals/fieldsofvalor");
require("scripts/zones/West_Sarutabaruta/TextIDs");
package.loaded["scripts/globals/jsr_utils"] = nil;
require("scripts/globals/jsr_utils");

-----------------------------------    
-- onTrigger Action    
-----------------------------------    
    
function onTrigger(player,npc)
    require("scripts/globals/jsr_utils");
    if (player:hasStatusEffect(EFFECT_CONFRONTATION) or player:hasStatusEffect(EFFECT_LEVEL_RESTRICTION)) then
        player:delStatusEffect(EFFECT_CONFRONTATION);
        player:delStatusEffect(EFFECT_LEVEL_RESTRICTION);
    end;

    rewardElite(player, npc, itemReward10);
end;
    
-----------------------------------    
-- onTrade Action    
-----------------------------------    
    
function onTrade(player,npc,trade)
    tradeElite(player, npc, trade, 1.5, {17248612}); -- Bakru
end;
    
-----------------------------------    
-- onEventSelection    
-----------------------------------    
    
function onEventUpdate(player,csid,menuchoice)    
--    updateFov(player,csid,menuchoice,89,90,91,92,93);
end;    
    
-----------------------------------    
-- onEventFinish Action    
-----------------------------------    
    
function onEventFinish(player,csid,option)    
--    finishFov(player,csid,option,89,90,91,92,93,FOV_MSG_EAST_SARUTA);
end;    
