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
    mob:setMod(MOD_SPELLINTERRUPT, 40);
    mob:setMod(MOD_LIGHTRES, 50);
    mob:setMod(MOD_LIGHTDEF, 65);
    mob:setMod(MOD_EARTHRES, -40);
    mob:setMod(MOD_EARTHDEF, -65);
    mob:setMobMod(MOBMOD_NO_XP, 1);
end


function onMobFight(mob, target)
--    if (mob:getHPP() <= 50 and mob:getLocalVar("wounded") == 0) then
--        mob:addMod(MOD_REGAIN, 5);
--        mob:addMod(MOD_REGEN, 3);
--        mob:setPendingMessage(562, 0);
--        mob:setLocalVar("wounded", 1);
--    end

    if (mob:getHPP() <= 50 and mob:getLocalVar("Berserk") == 0) then
        mob:useJobAbility(ABILITY_BERSERK, mob);
        mob:setLocalVar("Berserk", 1);
    end
end

function onMobDeath(mob, player, isKiller)
    onEliteDeath(mob, player, 1);
end;
