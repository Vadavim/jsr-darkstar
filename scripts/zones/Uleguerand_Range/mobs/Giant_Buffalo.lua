-----------------------------------
-- Area: Uleguaerand Range
-- NPC:  Jormungand
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/titles");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)

    if (mob:getBattleTime() % 15 == 0) then
        mob:useMobAbility(397);
        print(tostring(mob:getTP()));
        
        
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
end;