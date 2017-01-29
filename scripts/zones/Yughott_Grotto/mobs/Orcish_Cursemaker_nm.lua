-----------------------------------

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
    mob:setMod(MOD_MP, 500);
    mob:addMod(MOD_HP, 250);
    mob:updateHealth();
    mob:addHP(250);
    mob:addMP(500);
end



function onMobFight(mob, target)
    timedSpell(mob, target, 150, 20, 40); -- Blizzard II
    timedSpell(mob, target, 189, 15, 20); -- Stonega
end

function onMobDeath(mob, player, isKiller)
    rewardNotorious(mob, player, isKiller);
end;
