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
    mob:setMod(MOD_MP, 500);
    mob:addMod(MOD_FASTCAST, 50);
    mob:setMobMod(MOBMOD_ADD_EFFECT, 1);
    mob:setMod(MOD_STR, -5);
    mob:setMod(MOD_HP, -100);
    mob:updateHealth();
    mob:addMP(500);
end

function onAdditionalEffect(mob, target, damage)

    local params = {}; params.damageScale = 0.5;
    return mobAddElement(mob, target, damage, ELE_FIRE, params)

end;


function onMobFight(mob, target)
    local time = mob:getBattleTime();
    if (time ~= 0 and time % 20 == 0 and mob:getLocalVar("cast") == 0) then
--    if (time ~= 0 and time % 20 == 0 and mob:getLocalVar("cast") == 0) then
        local target = mob:getHateTarget(true);

        mob:castSpell(235, mob:getHateTarget(true)); -- Burn

        mob:setLocalVar("cast", 1);
    elseif (time % 20 == 1) then
        mob:setLocalVar("cast", 0);
    elseif (mob:getHPP() <= 70 and mob:getLocalVar("blaze") == 0) then
        mob:castSpell(249, mob); -- Blaze Spikes
        mob:setLocalVar("blaze", 1);
    end
end

function onMobDeath(mob, player, isKiller)
    rewardNotorious(mob, player, isKiller);
end;
