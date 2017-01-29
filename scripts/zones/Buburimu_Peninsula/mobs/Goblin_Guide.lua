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
    if (mob:getHPP() <= 35) then
        limitedAbility(mob, mob, 33, 1); -- Souleater
    end

    if (mob:getHPP() <= 70) then
        timedSpell(mob, target, 524, 1); -- Sandspin
    end

    limitedSpell(mob, target, 231, 1); -- Open with Bio II


    timedSpell(mob, target, 245, 20, 30); -- Drain
    timedSpell(mob, target, 275, 40, 60); -- Drain TP
    timedSpell(mob, mob:getHateTarget(true), {266, 267, 270, 268, 242}, 30, 50); -- Random Drain Attribute

end

function onMobDeath(mob, player, isKiller)
    rewardNotorious(mob, player, isKiller);
end;
