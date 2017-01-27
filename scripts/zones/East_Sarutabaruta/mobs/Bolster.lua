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
    mob:setMod(MOD_STR, -5);
    mob:setMod(MOD_HP, -30);
    mob:updateHealth();
end


function onMobFight(mob, target)
    if (mob:getHPP() <= 35 and mob:getLocalVar("Defender") == 0) then
        mob:useJobAbility(ABILITY_DEFENDER, mob);
        mob:setLocalVar("Defender", 1);
    end
end

function onMobDeath(mob, player, isKiller)
    rewardNotorious(mob, player, isKiller);
end;
