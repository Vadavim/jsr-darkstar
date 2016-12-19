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
    mob:setMod(MOD_SLEEPRES, 50);
    mob:setMod(MOD_ICE_ABSORB, 50);
    mob:setMod(MOD_SINGING, 400);
end


function onMobFight(mob, target)
    timedSpell(mob, mob:getHateTarget(), 150, 20, 35); -- Blizzard II
    timedSpell(mob, target, 179, 60, 80); -- Blizzaga
    if (not target:hasStatusEffect(EFFECT_THRENODY)) then
        timedSpell(mob, target, 455, 60, 80); -- Ice Threnody
    end

    thresholdSpell(mob, mob, 250, 50);

end



function onMobDeath(mob, player, isKiller)
    onEliteDeath(mob, player, 4);
end;

