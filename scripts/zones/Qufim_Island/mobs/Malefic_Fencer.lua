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
    mob:setMod(MOD_SPELLINTERRUPT, 40);
    mob:setLocalVar("bonusEliteXP", 200);
end


function onMobFight(mob, target)
    local time = mob:getBattleTime();
    local cast = mob:getLocalVar("cast");
    if (time % 90 == 89 and not mob:hasStatusEffect(EFFECT_FOIL) and cast ~= time) then
        mob:castSpell(840, mob);
        mob:setLocalVar("cast, time");
    elseif (time % 45 == 44 and not mob:getStatusEffect(EFFECT_LIEMENT) and cast ~= time) then
        mob:useJobAbility(ABILITY_LIEMENT, mob);
        mob:setLocalVar("cast, time");
    elseif (mob:getHPP() >= 50 and mob:getLocalVar("swordplay") == 0) then
        mob:useJobAbility(ABILITY_SWORDPLAY, mob);
        mob:setLocalVar("swordplay", 1);
    elseif (mob:getHPP() <= 70 and mob:getLocalVar("battuta") == 0) then
        mob:useJobAbility(360, mob);
        mob:setLocalVar("battuta", 1);
    end

end



function onMobDeath(mob, player, isKiller)
    onEliteDeath(mob, player, 3);
end;

