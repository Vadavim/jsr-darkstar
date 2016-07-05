-----------------------------------
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/globals/status");
require("scripts/globals/jsr_utils");

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobSpawn(mob)
    mob:setMobMod(MOBMOD_NO_XP, 1);
end


function onMobFight(mob, target)
--    if (mob:getHPP() <= 35 and mob:getLocalVar("Defender") == 0) then
--        mob:useJobAbility(ABILITY_DEFENDER, mob);
--        mob:setLocalVar("Defender", 1);
--    end
end

function onMobDeath(mob, player, isKiller)
    onEliteDeath(mob, player, 2);
end;
