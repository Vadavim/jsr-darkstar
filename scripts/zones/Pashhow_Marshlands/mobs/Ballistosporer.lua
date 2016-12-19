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
    mob:setMod(MOD_SPELLINTERRUPT, 40);
    mob:addMod(MOD_ATTP, -15);
    mob:setMobMod(MOBMOD_ADD_EFFECT, 1);
end


function onMobFight(mob, target)
    if (mob:getHPP() <= 80 and mob:getLocalVar("sleep") == 0) then
        mob:castSpell(273, target);
        mob:setLocalVar("sleep", 1);
    end

    if (mob:getHPP() <= 20 and mob:getLocalVar("wall") == 0) then
        mob:useJobAbility(ABILITY_MANA_WALL, mob);
        mob:setLocalVar("wall", 1);
    end
end

function onAdditionalEffect(mob, target, damage)
    local params = {}; params.power = 15; params.diffStat = MOD_MND; params.duration = 10; params.bonusAcc = -50;
    return mobAddStatus(mob, target, damage, EFFECT_AMNESIA, params)
end;


function onMobDeath(mob, player, isKiller)
    onEliteDeath(mob, player, 3);
end;

