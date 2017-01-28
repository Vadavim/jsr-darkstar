-----------------------------------
-- Area: West Sarutabaruta
--  MOB: Bakru
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
    mob:addMod(MOD_FASTCAST, 50);
    mob:setMobMod(MOBMOD_ADD_EFFECT, 1);
    mob:setMod(MOD_STR, -5);
    mob:setMod(MOD_HP, -100);
    mob:updateHealth();
    mob:addMP(500);
end

function onAdditionalEffect(mob, target, damage)
    local params = {}; params.power = damage / 4; params.diffStat = MOD_VIT; params.duration = 30;
    params.chance = 33;
    return mobAddStatus(mob, target, damage, EFFECT_POISON, params)
end;


function onMobFight(mob, target)
    timedSpell(mob, mob:getHateTarget(true), 256, 30, 60); -- Randomly Virus
end

function onMobDeath(mob, player, isKiller)
    rewardNotorious(mob, player, isKiller);
end;
