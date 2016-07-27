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
end


function onMobFight(mob, target)
    if (mob:getBattleTime() ~= 0 and mob:getBattleTime() % 30 == 0) then
        mob:castSpell(235); -- Burn
    end

end

function onMobDeath(mob, player, isKiller)
    onEliteDeath(mob, player, 1);
    checkRegime(player,mob,26,1);
end;
