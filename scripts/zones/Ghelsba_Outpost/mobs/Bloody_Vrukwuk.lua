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
    mob:setMod(MOD_HP, 600);
    mob:setMod(MOD_ATTP, -30);
    mob:setMod(MOD_DIVINE, 65);
    mob:updateHealth();
    mob:addMP(500);
end



function onMobFight(mob, target)
    timedSpell(mob, target, 29, 20, 40); -- Banish
    timedSpell(mob, target, 38, 30, 50); -- Banishga
    if (mob:getHPP() <= 60) then
        timedSpell(mob, mob, 3, 15, 30); -- Cure III
    end

end

function onMobDeath(mob, player, isKiller)
    rewardNotorious(mob, player, isKiller);
end;
