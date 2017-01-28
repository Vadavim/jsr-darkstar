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
    mob:setMod(MOD_SPELLINTERRUPT, 40);
    mob:setMod(MOD_WINDRES, -50);
    mob:setMod(MOD_WINDDEF, -60);
    mob:setMod(MOD_EARTHRES, 40);
    mob:setMod(MOD_EARTHDEF, 60);
    mob:setMod(MOD_STR, -5);
    mob:setMod(MOD_HP, -100);
    mob:addMod(MOD_REGEN, 8);
    mob:updateHealth();
    mob:addMP(300);
end


function onMobFight(mob, target)
end

function onMobDeath(mob, player, isKiller)
    rewardNotorious(mob, player, isKiller);
end;
