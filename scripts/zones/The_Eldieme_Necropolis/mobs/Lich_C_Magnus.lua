-----------------------------------
-- Area: The Eldieme Necropolis
--  MOB: Lich_C_Magnus
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(MOBMOD_SCALE_LEVEL, mob:getMainLvl());
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(LICH_BANISHER);
    if (player:getQuestStatus(WINDURST,BLUE_RIBBON_BLUES) == QUEST_ACCEPTED) then
        player:setVar("Lich_C_Magnus_Died",1);
    end
end;