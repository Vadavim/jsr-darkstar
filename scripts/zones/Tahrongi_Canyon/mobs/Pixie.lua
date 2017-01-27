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
    mob:addMod(MOD_FASTCAST, 50);
    mob:updateHealth();
    mob:addMP(500);
end


function onMobFight(mob, target)

    if (limitedSpell(mob, mob, 57, 1)) then return true end; -- Attempts to haste self

    if (mob:getHPP() <= 80) then
        if (limitedSpell(mob, mob, 102, 1)) then return true end; -- Attempts to enaero self
    end

    if (mob:getHPP() <= 60) then
        if (limitedSpell(mob, mob, 486, 1)) then return true end; -- Attempts to gainSTR self
    end

    timeSpell(mob, mob, 840, 40, 60); -- Foils self regularly






end

function onMobDeath(mob, player, isKiller)
    rewardNotorious(mob, player, isKiller);
end;
