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
    mob:setMobMod(MOBMOD_SKILL_LIST, 0);
--    mob:setMod(MOD_ENFEEBLE, mob:getMainLvl() * 3.8);
    mob:updateHealth();
    mob:addMP(500);
    mob:setLocalVar("bonusShadows", 4);
--    mob:setMobMod(MOBMOD_NO_XP, 1);
--    mob:setMod(MOD_ENSPELL_DMG, 6);
--    mob:setMod(MOD_ENSPELL, 1);
--    mob:setMod(MOD_SPELLINTERRUPT, 40);
--    mob:setMod(MOD_FIRERES, 50);
--    mob:setMod(MOD_FIREDEF, 65);
--    mob:addHP(99999);
end


function onMobFight(mob, target)
    if (mob:getHPP() <= 12) then
        return limitedSpell(mob, target, 38, 1); -- Banishga when desparate
    end

    limitedSpell(mob, target, 33, 1); -- Cast Diaga at the start of combat

    if (mob:getHPP() <= 80 and not mob:hasStatusEffect(EFFECT_PROTECT)) then
        limitedSpell(mob, mob, 45, 1); -- Cast Protect III
    end

    -- Random breeze
    if (target:hasStatusEffect(EFFECT_DIA)) then
        if (thresholdMobAbility(mob, target, {2196, 2197, 2198}, 20)) then return; end;
    else
        if (thresholdMobAbility(mob, target, {2196, 2195, 2197, 2198}, 20)) then return; end;
    end

    if (mob:getHPP() <= 75 and not mob:hasStatusEffect(EFFECT_REGEN)) then
        timedSpell(mob, mob, 108,  75, 120); -- Attempts to regen self
    end


    timedSpell(mob, mob, 53,  30, 80); -- Attempts to blink self

    timedSpell(mob, mob:getHateTarget(), 29,  10, 40); -- Sometimes banish II


end

function onMobDeath(mob, player, isKiller)
    rewardNotorious(mob, player, isKiller);
end;
