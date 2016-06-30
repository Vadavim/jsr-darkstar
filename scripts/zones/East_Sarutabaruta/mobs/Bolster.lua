-----------------------------------
-- Area: East Sarutabaruta
--  MOB: Bolster
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/globals/status");

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobSpawn(mob)
    mob:setMobMod(MOBMOD_NO_XP, 1);
end


function onMobFight(mob, target)
    if (mob:getHPP() <= 35 and mob:getLocalVar("Defender") == 0) then
        mob:useJobAbility(ABILITY_DEFENDER, mob);
        mob:setLocalVar("Defender", 1);
    end
end

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
        local xpReward = 350;
        if (mob:getMobMod(MOBMOD_HARD_MODE) == 2) then xpReward = 500; end;
        if (party ~= nil) then
            for i,member in ipairs(party) do
                member:addLimitPoints(xpReward);
                member:addExp(xpReward);
            end
        end

        return;
    end

--    checkRegime(player,mob,92,2);
--    checkRegime(player,mob,93,2);
end;
