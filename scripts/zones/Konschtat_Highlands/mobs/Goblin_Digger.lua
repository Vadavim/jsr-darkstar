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
    mob:setMod(MOD_ELEM, mob:getMainLvl() * 3.8);
    mob:setMod(MOD_ENHANCE, 80 + mob:getMainLvl() * 8);
    mob:setMod(MOD_HPP, -50);
    mob:updateHealth();
    mob:addMP(300);

    mob:setMod(MOD_ENSPELL_DMG, 12);
    mob:setMod(MOD_ENSPELL, 2);
    mob:setMod(MOD_SPELLINTERRUPT, 40);
    mob:setMod(MOD_EARTHRES, 50);
    mob:setMod(MOD_EARTHDEF, 80);
    mob:setMod(MOD_EARTHATT, 30);
    mob:setMod(MOD_WINDRES, -40);
    mob:setMod(MOD_WINDDEF, -60);
end


function onMobFight(mob, target)
    limitedSpell(mob, target, 189, 1); -- Opens with Stonega

    timedSpell(mob, mob, 54,  30, 80); -- Attempts to stoneskin self
    timedAbility(mob, mob, ABILITY_SNEAK_ATTACK,  20, 40);


end

function onMobDeath(mob, player, isKiller)
    rewardNotorious(mob, player, isKiller);
end;
