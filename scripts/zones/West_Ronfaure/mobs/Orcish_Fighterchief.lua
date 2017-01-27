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
    mob:addMod(MOD_HP, -300);
    mob:addMod(MOD_ATTP, -50);
    mob:addMod(MOD_STR, -20);
    mob:addMod(MOD_HASTE_ABILITY, -1000);
    print("hi");
    mob:addMod(MOD_DEFP, -45);
    mob:updateHealth();
end


function onMobFight(mob, target)
    if (mob:getHPP() <= 35) then
        limitedMobAbility(mob, mob, 1009, 1); -- Hundred Fists
    end

end

function onMobDeath(mob, player, isKiller)
    rewardNotorious(mob, player, isKiller);
end;
