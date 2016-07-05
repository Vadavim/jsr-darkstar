-----------------------------------
-- Area: East Sarutabaruta
--  MOB: Mandragora
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobSpawn(mob)
--    mob:setMobMod(MOBMOD_SCALE_LEVEL, mob:getMainLvl());
--    mob:setMobMod(MOBMOD_HARD_MODE, 10);
--    mob:setMobMod(MOBMOD_TP_USE_CHANCE, 90);
--    mob:setMod(MOD_REGAIN, 200);
end

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,89,1);
end;
