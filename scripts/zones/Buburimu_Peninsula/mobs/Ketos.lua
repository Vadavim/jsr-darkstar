-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/globals/status");
require("scripts/globals/jsr_utils");
require("scripts/globals/jsr_mob");

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobSpawn(mob)
    setSpecialMobStats(mob, 400);
    mob:setMod(MOD_MP, 500);
    mob:setMod(MOD_HP, 1200);
    mob:updateHealth();
    mob:addMP(500);
end



function onMobFight(mob, target)

    local randTarget = mob:getHateTarget(true);
    if (randTarget:isBehind(mob, 48) == true) then
        timedMobAbility(mob, randTarget, 2436, 20, 40);
    end

end

function onMobDeath(mob, player, isKiller)
    rewardNotorious(mob, player, isKiller);
end;
