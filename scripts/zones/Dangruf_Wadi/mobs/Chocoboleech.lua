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
    mob:setMobMod(MOBMOD_ADD_EFFECT, 1);
    mob:setMod(MOD_STR, -5);
    mob:setMod(MOD_HP, -100);
    mob:setMod(MOD_DARK, 20 + mob:getMainLvl() * 5);
    mob:updateHealth();
    mob:addMP(500);
end

function onAdditionalEffect(mob, target, damage)
    local params = {}; params.power = damage; params.diffStat = MOD_VIT; params.duration = 30;
    params.chance = 50;
    mobAddDrain(mob, target, damage, 0, params);
end;


function onMobFight(mob, target)
    timedSpell(mob, mob:getHateTarget(true), 245, 40, 60); -- Randomly Drain
    timedMobAbility(mob, mob:getHateTarget(true), 421, 40, 60); -- Randomly MP Drainkiss
end

function onMobDeath(mob, player, isKiller)
    rewardNotorious(mob, player, isKiller);
end;
