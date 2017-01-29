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
    mob:updateHealth();
    mob:addMP(500);
end



function onMobFight(mob, target)
    timedSpell(mob, mob:getHateTarget(), 144, 30, 60);
    timedSpell(mob, mob:getHateTarget(), 144, 20, 40);
    timedSpell(mob, mob:getHateTarget(true), 253, 30, 60); -- Randomly Sleep
    timedSpell(mob, mob:getHateTarget(true), 257, 45, 80); -- Randomly Curse
    if (mob:getHPP() <= 50) then
        limitedSpell(mob, target, 366, 1); -- Graviga
    end

end

function onMobDeath(mob, player, isKiller)
    rewardNotorious(mob, player, isKiller);
end;
