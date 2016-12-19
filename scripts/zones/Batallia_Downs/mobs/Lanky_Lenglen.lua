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
    mob:addMod(MOD_DOUBLE_ATTACK, 25);
    mob:addMod(MOD_TRIPLE_ATTACK, 10);
    mob:addMod(MOD_QUAD_ATTACK, 5);
    mob:addMod(MOD_ACC, 30);
    mob:addMod(MOD_EVA, 20);
    mob:addMod(MOD_DEFP, -25);
    mob:addMod(MOD_ATTP, -30);
end


function onMobFight(mob, target)
    local time = mob:getBattleTime();
    local cast = mob:getLocalVar("cast");

--    timedMobAbility(mob, target, 318, 25, 30);
    timedAbility(mob, mob, ABILITY_SNEAK_ATTACK, 40, 60);
    thresholdAbility(mob, mob, ABILITY_HIDE, 30);


    if (mob:getLocalVar("fleed") == 0 and mobAbilityFlee(mob, target)) then
        mob:setLocalVar("fleed", 1);
    end

end



function onMobDeath(mob, player, isKiller)
    onEliteDeath(mob, player, 4);
end;

