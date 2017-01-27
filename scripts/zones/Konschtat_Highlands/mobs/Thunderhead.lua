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
    mob:setMod(MOD_MP, 300);
    mob:setMod(MOD_ENFEEBLE, mob:getMainLvl() * 3.8);
    mob:updateHealth();
    mob:addMP(300);
    mob:setMod(MOD_ENSPELL_DMG, 12);
    mob:setMod(MOD_ENSPELL, 6);
    mob:setMod(MOD_DEFP, -33);
    mob:setMod(MOD_ACC, -15);
    mob:setMod(MOD_STR, -12);
    mob:setMod(MOD_SPELLINTERRUPT, 40);
    mob:setMod(MOD_ENEMYCRITRATE, 10);
    mob:setMod(MOD_THUNDERDEF, 80);
    mob:setMod(MOD_THUNDERATT, 30);
    mob:setMod(MOD_EARTHRES, -40);
    mob:setMod(MOD_EARTHDEF, -60);
end


function onMobFight(mob, target)
    thresholdSpell(mob, target, 164, 20);
    if (mob:getHPP() <= 40) then
        if (limitedSpell(mob, mob, 251, 1)) then return true; end;
        timedSpell(mob, mob:getHateTarget(true), 239, 20, 40);
    end

end

function onMobDeath(mob, player, isKiller)
    rewardNotorious(mob, player, isKiller);
end;
