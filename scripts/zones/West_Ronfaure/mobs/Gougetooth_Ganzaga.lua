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
end


function onMobFight(mob, target)
    local time = mob:getBattleTime();
    if (time % 30 == 29 and mob:getLocalVar("2hour") == 0) then
        mob:useJobAbility(ABILITY_MIGHTY_STRIKES, mob);
        mob:setLocalVar("2hour", 1);
    end


--    if (mob:getHPP() <= 35 and mob:getLocalVar("Defender") == 0) then
--        mob:useJobAbility(ABILITY_DEFENDER, mob);
--        mob:setLocalVar("Defender", 1);
--    end
end

function onMobDeath(mob, player, isKiller)
    rewardNotorious(mob, player, isKiller);
end;
