-----------------------------------
-- Area: West Sarutabaruta
--  MOB: Bakru
-----------------------------------

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
    mob:setMod(MOD_MP, 500);
    mob:setMod(MOD_HP, 500);
    mob:updateHealth();
    mob:addMP(500);
end



function onMobFight(mob, target)

    if (mob:getHPP() <= 50) then
        limitedAbility(mob, mob, 251, 1);
    end

    timedAbility(mob, mob, 16, 50, 80);
end

function onMobDeath(mob, player, isKiller)
    rewardNotorious(mob, player, isKiller);
end;
