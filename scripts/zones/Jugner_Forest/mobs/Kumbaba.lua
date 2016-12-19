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
    mob:setMod(MOD_SPELLINTERRUPT, 60);
    mob:setMod(MOD_BLINK, 4);
    mob:setMobMod(MOBMOD_ADD_EFFECT, 1);
end


function onMobFight(mob, target)
end

function onAdditionalEffect(mob, target, damage)
    local params = {}; params.power = 5; params.diffStat = MOD_INT; params.duration = 30;
    return mobAddStatus(mob, target, damage, EFFECT_POISON, params)
end;

function onMobDeath(mob, player, isKiller)
    onEliteDeath(mob, player, 3);
end;
