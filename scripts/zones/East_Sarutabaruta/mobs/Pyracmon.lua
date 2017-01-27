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
    mob:setMod(MOD_STR, -5);
    mob:setMod(MOD_HP, -50);
    mob:setMod(MOD_MP, 300);
    mob:updateHealth();
    mob:addMP(300);
end


function onMobFight(mob, target)
    if (mob:getHPP() <= 90) then
        limitedSpell(mob, target, 361, 1); -- Open with Blindga
    end

    timedSpell(mob, mob:getHateTarget(true), 230, 20, 40); -- Randomly Bio people
    timedSpell(mob, mob:getHateTarget(true), 220, 25, 35); -- Randomly Bio people
    timedSpell(mob, mob:getHateTarget(true), 245, 20, 40); -- Randomly Drain people
end

function onMobDeath(mob, player, isKiller)
    rewardNotorious(mob, player, isKiller);
end;
