-----------------------------------
--  Area: East Sarutabaruta
--  NPC:  Stone Monument
--  Involved in quest "An Explorer's Footsteps"
--  @pos 448.045 -7.808 319.980 116
-----------------------------------
package.loaded["scripts/zones/East_Sarutabaruta/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/East_Sarutabaruta/TextIDs");

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
	player:startEvent(0x0384);
end;

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
	if (trade:getItemCount() == 1 and trade:hasItemQty(571,1)) then
		player:tradeComplete();
		player:addItem(570);
		player:messageSpecial(ITEM_OBTAINED,570);
		player:setVar("anExplorer-CurrentTablet",0x00800);
    elseif (GetMobAction(16785722) == 0 and trade:getItemCount() == 1 and trade:hasItemQty(1126,1)) then
        player:tradeComplete();
        mob = SpawnMob(17252657);
        mob:setPos( player:getXPos(), player:getYPos(), player:getZPos(), player:getRotPos(), player:getZoneID() );
        mob:updateClaim(player);
        
	end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;