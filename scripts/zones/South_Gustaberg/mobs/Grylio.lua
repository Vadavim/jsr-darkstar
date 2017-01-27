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
    mob:setMobMod(MOBMOD_NO_XP, 1);
    mob:setMod(MOD_ENSPELL_DMG, 6);
    mob:setMod(MOD_ENSPELL, 5);
    mob:setMod(MOD_SPELLINTERRUPT, 40);
    mob:addMod(MOD_FIRERES, -50);
    mob:addMod(MOD_FIREDEF, -80);
    setSpecialMobStats(mob, 400);

--    mob:delHP(200);
    mob:setMod(MOD_STR, -5);
    mob:setMod(MOD_HP, -100);
    mob:updateHealth();

end


function onMobFight(mob, target)
    if (mob:getHPP() <= 50 and mob:getLocalVar("icespikes") == 0) then
        mob:castSpell(250, mob); -- Ice Spikes
        mob:setLocalVar("icespikes", 1);
    end
end

function onMobDeath(mob, player, isKiller)
    rewardNotorious(mob, player, isKiller);
end;
