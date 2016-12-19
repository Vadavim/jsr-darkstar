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
    mob:setMod(MOD_ENSPELL_DMG, 25);
    mob:setMod(MOD_ENSPELL, 6);
    mob:setMod(MOD_REGEN, 10);
    mob:setMod(MOD_BLINK, math.floor(2 + math.random(1,6)));
end


function onMobFight(mob, target)
    thresholdMobAbility(mob, target, 483, 30);
end



function onMobDeath(mob, player, isKiller)
    onEliteDeath(mob, player, 4);
end;

