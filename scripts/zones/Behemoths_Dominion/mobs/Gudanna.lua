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
    mob:setMobMod(MOBMOD_NO_XP, 1);
    mob:setMod(absorbMod[math.random(1, 8)], 100);
    mob:setMod(MOD_STUNRES, 100);
    mob:setMod(MOD_LIGHTRES, 60);
    mob:setMod(MOD_SPELLINTERRUPT, 60);
    mob:setMod(MOD_DARKRES, 60);
    mob:setMod(MOD_PARALYZERES, -20);
    mob:setMod(MOD_TRIPLE_ATTACK, 10);
    mob:setMod(MOD_ATTP, -20);
end


function onMobFight(mob, target)
    timedSpell(mob, target, {204, 21}, 40, 60);
    timedSpell(mob, mob, {57, 45, 50, 110, 493}, 30, 60);
end



function onMobDeath(mob, player, isKiller)
    onEliteDeath(mob, player, 5);
end;

