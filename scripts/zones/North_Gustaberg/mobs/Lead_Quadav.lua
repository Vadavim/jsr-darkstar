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
    mob:setMod(MOD_STR, -10);
    mob:setMod(MOD_ATTP, -35);
    mob:setMod(MOD_HP, -100);
    mob:updateHealth();
    mob:addMP(300);
end


function onMobFight(mob, target)
    if (mob:getHPP() <= 30) then
        limitedMobAbility(mob, mob, 694, 1); -- Use Invicible when HP is low
    end

end

function onMobDeath(mob, player, isKiller)
    rewardNotorious(mob, player, isKiller);
end;
