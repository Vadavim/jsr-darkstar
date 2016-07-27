-----------------------------------
-- Area: West Sarutabaruta
--  MOB: Bakru
-----------------------------------

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
    mob:setMod(MOD_ENSPELL_DMG, 6);
    mob:setMod(MOD_ENSPELL, 1);
    mob:setMod(MOD_FIRERES, 40);
    mob:setMod(MOD_FIREDEF, 55);
--    mob:addHP(99999);
end


function onMobFight(mob, target)
    local time = mob:getBattleTime();
    if (time ~= 0 and time % 20 == 0 and mob:getLocalVar("cast") == 0) then
        local target = mob:getHateTarget(true);
        if (target == nil) then
            print("BAD");
        end

        mob:castSpell(235, mob:getHateTarget(true)); -- Burn
        mob:setLocalVar("cast", 1);
    elseif (time % 20 == 1) then
        mob:setLocalVar("cast", 0);
    end

end

function onMobDeath(mob, player, isKiller)
    onEliteDeath(mob, player, 1);
    checkRegime(player,mob,26,1);
end;
