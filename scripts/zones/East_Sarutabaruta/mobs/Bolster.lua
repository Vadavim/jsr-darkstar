-----------------------------------
-- Area: East Sarutabaruta
--  MOB: Bolster
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if (mob == nil or mob:getLocalVar("TimedOut") == 1) then
        return;
    end

    if (mob:getSpawner() ~= nil) then
        local player = mob:getSpawner();
        if (player ~= nil) then
            player:removeConfrontationFromParty();
        end
        player:setLocalVar("killedFoVNM", 1);

        local party = player:getParty();
--        player:addLimitPoints(300);
--        player:addExp(300);
        if (party ~= nil) then
            for i,member in ipairs(party) do
                member:addLimitPoints(300);
                member:addExp(300);
            end
        end

        return;
    end

--    checkRegime(player,mob,92,2);
--    checkRegime(player,mob,93,2);
end;
