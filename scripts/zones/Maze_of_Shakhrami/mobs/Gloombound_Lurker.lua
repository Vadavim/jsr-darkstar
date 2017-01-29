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
    mob:updateHealth();
    mob:addMP(500);
end



function onMobFight(mob, target)
    timedMobAbility(mob, mob:getHateTarget(true), 33, 25, 40);
    limitedAbility(mob, mob, 351, 1);
    timedSpell(mob, mob, 840, 30, 60);

end

function onMobDeath(mob, player, isKiller)
    rewardNotorious(mob, player, isKiller);
end;
