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

    if (mob:getHPP() <= 75 and not mob:hasStatusEffect(EFFECT_REGEN)) then
        if (timedSpell(mob, mob, 108,  75, 120)) then return true end; -- Attempts to regen self
    end

    if (mob:getHPP() >= 40) then
        timedMobAbility(mob, mob:getHateTarget(true), 2193, 20, 40);
    else
        timedMobAbility(mob, mob:getHateTarget(true), 2193, 10, 15);
    end





end

function onMobDeath(mob, player, isKiller)
    rewardNotorious(mob, player, isKiller);
end;
