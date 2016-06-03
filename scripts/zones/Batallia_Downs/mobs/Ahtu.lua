-----------------------------------
-- Area: Batallia Downs (105)
--  MOB: Ahtu
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

--JSR: Ahtu's level scales
function onMobSpawn(mob)
    mob:setMobMod(MOBMOD_SCALE_LEVEL, mob:getMainLvl());
end

function onMobDeath(mob, player, isKiller)

    -- Set Ahtu's spawnpoint and respawn time (2-4 hours)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random((7200),(14400)));

end;