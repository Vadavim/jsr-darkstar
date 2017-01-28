-----------------------------------
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
    mob:setMod(MOD_HP, 200);
    mob:updateHealth();
end


function onMobFight(mob, target)

end

function onMobDeath(mob, player, isKiller)
    rewardNotorious(mob, player, isKiller);
end;
