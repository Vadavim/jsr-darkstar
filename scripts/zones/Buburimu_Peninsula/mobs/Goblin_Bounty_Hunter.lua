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
    mob:setMod(MOD_HP, 800);
    mob:setMobMod(MOBMOD_SKILL_LIST, 0);
    mob:updateHealth();
    mob:addHP(500);
    mob:addMP(500);
end



function onMobFight(mob, target)
    if (mob:getHPP() <= 50) then
        limitedAbility(mob, mob, 133, 1); -- Warrior's Charge
    end

    if (mob:getHPP() <= 70) then
        timedSpell(mob, target, 524, 30, 40); -- Sandspin
    end

    timedSpell(mob, target, 544, 20, 60); -- Cursed Sphere


    timedSpell(mob, target, 623, 30, 40); -- Headbutt
    timedSpell(mob, mob:getHateTarget(), 597, 20, 30); -- Sprout Smack
    timedSpell(mob, mob, 549, 15, 20); -- Pollen

end

function onMobDeath(mob, player, isKiller)
    rewardNotorious(mob, player, isKiller);
end;
