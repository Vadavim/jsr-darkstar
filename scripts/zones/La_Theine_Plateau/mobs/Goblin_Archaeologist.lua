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
    mob:setMod(MOD_MP, 300);
    mob:setMod(MOD_ENFEEBLE, mob:getMainLvl() * 3.8);
    mob:updateHealth();
    mob:addMP(300);
--    mob:setMobMod(MOBMOD_NO_XP, 1);
--    mob:setMod(MOD_ENSPELL_DMG, 6);
--    mob:setMod(MOD_ENSPELL, 1);
--    mob:setMod(MOD_SPELLINTERRUPT, 40);
--    mob:setMod(MOD_FIRERES, 50);
--    mob:setMod(MOD_FIREDEF, 65);
--    mob:addHP(99999);
end


function onMobFight(mob, target)

    if (mob:getHPP() > 30) then
        timedSpell(mob, mob:getHateTarget(true), {220, 58, 254},  10, 25); -- Poison, Blind, or Paralyze Random Target
    else
        timedSpell(mob, mob:getHateTarget(true), {361, 225, 356},  30, 50); -- AoE Versions of Status Spells
    end

--    timedSpell(mob, mob:getHateTarget(true), 220,  10, 25); -- Poison, Blind, or Paralyze Random Target

end

function onMobDeath(mob, player, isKiller)
    rewardNotorious(mob, player, isKiller);
end;
