-----------------------------------
-- Area: East Sarutabaruta
--  MOB: Mandragora
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/globals/jsr_mob");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobSpawn(mob)
--    mob:setMobMod(MOBMOD_SCALE_LEVEL, mob:getMainLvl());
--    mob:setMobMod(MOBMOD_HARD_MODE, 10);
--    mob:setMobMod(MOBMOD_TP_USE_CHANCE, 90);
--    mob:setMod(MOD_REGAIN, 200);
end;

function onAdditionalEffect(mob, target, damage)
--    local params = {}; params.damageScale = 2500;
--    return mobAddElement(mob, target, damage, ELE_EARTH, params)

--    local params = {}; params.dur = 30; params.power = 5;
--    params.tick = 3; params.diffStat = MOD_VIT;
--    return mobAddStatus(mob, target, damage, EFFECT_POISON, params)
end;

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,89,1);
end;
