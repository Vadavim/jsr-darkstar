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
    mob:setMod(MOD_HP, 1500);
    mob:setMod(MOD_ENFEEBLE, 200);
    mob:setMod(MOD_ATTP, -25);
    mob:setMod(MOD_STR, -10);
    mob:updateHealth();
    mob:addMP(500);
end



function onMobFight(mob, target)
    if (mob:getHPP() <= 80) then
        limitedSpell(mob, mob, 493, 1); -- Temper when low
    end

    if (mob:getHPP() <= 55) then
        limitedAbility(mob, mob, 221, 1); -- Sabre Dance when low
    end

    if (mob:getHPP() <= 25) then
        limitedMobAbility(mob, mob, 688, 1); -- Mighty Strikes when low
    end


end

function onMobDeath(mob, player, isKiller)
    rewardNotorious(mob, player, isKiller);
end;
