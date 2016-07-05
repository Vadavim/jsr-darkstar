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
    mob:setMobMod(MOBMOD_ADD_EFFECT, 1);
end

function onAdditionalEffect(mob, target, damage)
    local dmg = math.random(1,5)
    local params = {};
    params.bonusmab = 0;
    params.includemab = true;

    dmg = addBonusesAbility(mob, ELE_EARTH, target, dmg, params);
    dmg = dmg * applyResistanceAddEffect(mob,target,ELE_EARTH,0);
    dmg = adjustForTarget(target,dmg,ELE_WATER);
    dmg = finalMagicNonSpellAdjustments(mob,target,ELE_EARTH,dmg);

    return SUBEFFECT_EARTH_DAMAGE, MSGBASIC_ADD_EFFECT_DMG, dmg;
end;

function onMobFight(mob, target)
--    if (mob:getHPP() <= 35 and mob:getLocalVar("Defender") == 0) then
--        mob:useJobAbility(ABILITY_DEFENDER, mob);
--        mob:setLocalVar("Defender", 1);
--    end
end

function onMobDeath(mob, player, isKiller)
    onEliteDeath(mob, player, 1);
end;
