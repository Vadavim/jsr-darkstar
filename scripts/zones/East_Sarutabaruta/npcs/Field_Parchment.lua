-----------------------------------    
-- Area: East Sarutabaruta
-- NPC:  Field Manual    
-----------------------------------    
    
require("scripts/globals/settings");    
require("scripts/globals/fieldsofvalor");
require("scripts/globals/jsr_utils");

-----------------------------------    
-- onTrigger Action    
-----------------------------------    
    
function onTrigger(player,npc)    
    if (player:hasStatusEffect(EFFECT_CONFRONTATION) or player:hasStatusEffect(EFFECT_LEVEL_RESTRICTION)) then
        player:delStatusEffect(EFFECT_CONFRONTATION);
        player:delStatusEffect(EFFECT_LEVEL_RESTRICTION);
    end;

--    if player:getLocalVar("bolsterKill") == 1 then
--        local items = {
--            {13584, AUGMENT_ACC, 2, AUGMENT_ENMITYNEG, 1}, -- Cotton Cape: +2 Acc, -1 Enmity
--            {13584, AUGMENT_DEF, 2, AUGMENT_ENMITYNEG, 1}, -- Cotton Cape: +2 Def, +1 Enmity
--            {13584, AUGMENT_HP, 5, AUGMENT_MP, 10}, -- Cotton Cape: +5 HP, +10 MP
--            {13584, AUGMENT_, 5, AUGMENT_MP, 10}, -- Cotton Cape: +5 HP, +10 MP
--        };
--    end
end;
    
-----------------------------------    
-- onTrade Action    
-----------------------------------    
    
function onTrade(player,npc,trade)
--    if (not player:hasKeyItem(ELITE_TRAINING_INTRODUCTION)) then return end;
--    local count = trade:getItemCount();
--    local beastSeals = trade:hasItemQty(1126,1);
--    local gil = trade:getGil();
--    if (count == 2 and gil == 200 and GetMobAction(17252815) == 0) then
--        player:tradeComplete();
--        local mobs = {17252657};
--    end

    local mobs = {17252815};
    startConfrontation(player, 10, 600, mobs);

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
