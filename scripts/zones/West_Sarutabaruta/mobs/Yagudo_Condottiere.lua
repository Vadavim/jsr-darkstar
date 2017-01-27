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
    mob:addMod(MOD_HP, -450);
    mob:addMod(MOD_ATTP, -50);
    mob:updateHealth();
    mob:addMP(500);
end



function onMobFight(mob, target)
    timedSpell(mob, mob, 338, 1, 2); -- Utsusemi self
    timedSpell(mob, target, 329, 45, 60); -- Doton ichi
    timedSpell(mob, target, 329, 45, 60); -- Doton ichi
    limitedSpell(mob, target, 350, 1); -- Dokumori Ichi
end

function onMobDeath(mob, player, isKiller)
    rewardNotorious(mob, player, isKiller);
end;
