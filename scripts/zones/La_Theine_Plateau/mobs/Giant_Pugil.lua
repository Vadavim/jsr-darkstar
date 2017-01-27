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
--    mob:setMod(MOD_MP, 500);
--    mob:addMod(MOD_FASTCAST, 50);
    mob:setMobMod(MOBMOD_SKILL_LIST, 0);
--    mob:setMod(MOD_ENFEEBLE, mob:getMainLvl() * 3.8);
--    mob:updateHealth();
--    mob:addMP(500);
--    mob:setLocalVar("bonusShadows", 4);
--    mob:setMobMod(MOBMOD_NO_XP, 1);
--    mob:setMod(MOD_ENSPELL_DMG, 6);
--    mob:setMod(MOD_ENSPELL, 1);
--    mob:setMod(MOD_SPELLINTERRUPT, 40);
--    mob:setMod(MOD_FIRERES, 50);
--    mob:setMod(MOD_FIREDEF, 65);
--    mob:addHP(99999);
end


function onMobFight(mob, target)

    timedMobAbility(mob, target, 450, 30, 60); -- Spam Aqua Ball

    -- Use Water Wall when low on HP
    if (mob:getHPP() <= 35) then
        limitedAbility(mob, mob, 453, 1);
    end



end

function onMobDeath(mob, player, isKiller)
    rewardNotorious(mob, player, isKiller);
end;
