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
    mob:setMod(MOD_BLINK, 4);
    mob:setMobMod(MOBMOD_ADD_EFFECT, 1);
end


function onMobFight(mob, target)
    timedSpell(mob, target, 457,  40, 60); -- Sometimes Earth Threnody
end

function onAdditionalEffect(mob, target, damage)
    if (math.random(1, 100) >= 50) then
        local params = {}; params.power = 350; params.diffStat = MOD_MND; params.duration = 30;
        return mobAddStatus(mob, target, damage, EFFECT_SLOW, params)
    end

    local params = {}; params.damageScale = 0.5;
    return mobAddElement(mob, target, damage, ELE_EARTH, params)

end;

function onMobDeath(mob, player, isKiller)
    rewardNotorious(mob, player, isKiller);
end;
