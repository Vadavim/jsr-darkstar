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
    local time = mob:getBattleTime();
    if (mob:getHPP() <= 25 and mob:getLocalVar("2hour") == 0) then
        mob:useJobAbility(ABILITY_PERFECT_DODGE, mob);
        mob:setLocalVar("2hour", 1);
    end
end

function onMobDeath(mob, player, isKiller)
    onEliteDeath(mob, player, 1);
end;
