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
    mob:setMod(MOD_HP, 0);
    mob:setMod(MOD_ATTP, -35);
    mob:setMod(MOD_HASTE_ABILITY, -300);
    mob:updateHealth();
    mob:addMP(500);
end



function onMobFight(mob, target)
    if (mob:getHPP() <= 50) then
        mob:AnimationSub(1);
        mob:setMod(MOD_REGAIN, 100);
    end

end

function onMobDeath(mob, player, isKiller)
    rewardNotorious(mob, player, isKiller);
end;
