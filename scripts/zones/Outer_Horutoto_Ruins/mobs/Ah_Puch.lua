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
    mob:setMod(MOD_ELEM, mob:getMainLvl() * 15);
    mob:addMod(MOD_INT, 15);
    mob:updateHealth();
    mob:addMP(500);
    mob:setMod(MOD_ATTP, -25);
    mob:setMobMod(MOBMOD_ADD_EFFECT, 1);
end

function onAdditionalEffect(mob, target, damage)

    local params = {}; params.min = 30; params.max = 45;
    return mobAddElement(mob, target, damage, ELE_WIND, params)

end;


function onMobFight(mob, target)
    timedSpell(mob, mob:getHateTarget(), 155, 15, 20);
    timedSpell(mob, mob:getHateTarget(), 237, 20, 40); -- Choke
    if (mob:getHPP() <= 30) then
        limitedSpell(mob, mob:getHateTarget(), 184, 2); -- Aeroga
    end
end

function onMobDeath(mob, player, isKiller)
    rewardNotorious(mob, player, isKiller);
end;
