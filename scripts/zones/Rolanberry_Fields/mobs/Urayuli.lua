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
    mob:setMod(MOD_ENSPELL_DMG, 25);
    mob:setMod(MOD_ENSPELL, 2);
    mob:setMobMod(MOBMOD_ADD_EFFECT, 1);
    mob:setMod(absorbMod[math.random(1, 8)], 100);
    mob:setMod(absorbMod[math.random(1, 8)], 100);
end


function onMobFight(mob, target)
    timedAbility(mob, mob, ABILITY_WARRIORS_CHARGE, 90, 90);
    thresholdAbility(mob, mob, ABILITY_BLOOD_RAGE, 35);
end

function onAdditionalEffect(mob, target, damage)
    local rand = math.random(0, 100);
    if (rand <= 10) then
        local params = {}; params.power = 8; params.diffStat = MOD_INT; params.duration = 60;
        return mobAddStatus(mob, target, damage, EFFECT_POISON, params)
    elseif (rand <= 20) then
        local params = {}; params.power = 5; params.diffStat = MOD_INT; params.duration = 60;
        return mobAddStatus(mob, target, damage, EFFECT_PLAGUE, params)
    end

    return 0,0,0;

end;


function onMobDeath(mob, player, isKiller)
    onEliteDeath(mob, player, 4);
end;

