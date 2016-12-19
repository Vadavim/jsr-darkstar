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
    mob:setMobMod(MOBMOD_NO_XP, 1);
    mob:setMobMod(MOBMOD_SKILL_LIST, 0);
    mob:setMod(MOD_ICE_ABSORB, 50);
    mob:setMod(MOD_SLEEPRES, 25);
    mob:setMod(MOD_LIGHTRES, -20);
    mob:setMod(MOD_LIGHTDEF, -80);
    mob:setLocalVar("bonusEliteXP", 400);
    mob:setMod(MOD_ATTP, -20);
end


function onMobFight(mob, target)
    thresholdMobAbility(mob, target, 649, 25);
    thresholdMobAbility(mob, mob, 650, 50);
    local hpp = mob:getHPP();

    if (hpp > 65) then
        timedMobAbility(mob, target, {647, 648, 651}, 25, 40);
    elseif (hpp > 30) then
        timedMobAbility(mob, target, {644, 642, 643}, 25, 40);
    else
        timedMobAbility(mob, target, {645, 646}, 25, 40);
    end
end




function onMobDeath(mob, player, isKiller)
    onEliteDeath(mob, player, 5);
end;

