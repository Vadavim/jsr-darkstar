-----------------------------------
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/globals/status");
require("scripts/globals/jsr_utils");

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobSpawn(mob)
    mob:setMobMod(MOBMOD_NO_XP, 1);
    mob:setMod(MOD_ENSPELL_DMG, 9);
    mob:setMod(MOD_ENSPELL, 6);
    mob:setMod(MOD_SPELLINTERRUPT, 40);
    mob:setLocalVar("thunder", 75);
    mob:setMod(MOD_THUNDERRES, 50);
    mob:setMod(MOD_THUNDERDEF, 80);
    mob:setMod(MOD_EARTHRES, -40);
    mob:setMod(MOD_EARTHDEF, -60);
end


function onMobFight(mob, target)
    local thresh = mob:getLocalVar("thunder");
    if (mob:getHPP() <= thresh) then
        mob:castSpell(164, mob:getHateTarget()); -- Thunder
        mob:setLocalVar("thunder", thresh - 25);
    end
end

function onMobDeath(mob, player, isKiller)
    onEliteDeath(mob, player, 2);
end;
