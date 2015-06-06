-----------------------------------
-- Ability: Swipe
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");

runeElements = {ELE_FIRE, ELE_ICE, ELE_WIND, ELE_EARTH, ELE_THUNDER, ELE_WATER, ELE_LIGHT, ELE_DARK};
-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (player:getActiveRunes() == 0) then
        return MSGBASIC_UNABLE_TO_USE_JA, 0;
    else
        return 0,0;
    end
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player, target, ability)
    local params = {}
    params.includemabonus = true;
    ability:setMsg(110);
    local damage = (player:getStat(MOD_AGI) + player:getStat(MOD_INT));
    local type1, type2, type3 = player:getRuneTypes();
    local skill = player:getSkillLevel(ENHANCING_MAGIC_SKILL);
    local element = runeElements[type1 - 522];
    local resist = applyResistanceAbility(player,target,element,ENHANCING_MAGIC_SKILL,20);
    damage = math.floor(damage * ( ( 20 + skill) / 100) );
    damage = addBonusesAbility(player, element, target, damage, params);
    damage = damage * resist;
    damage = adjustForTarget(target,damage,element);
    damage = finalMagicNonSpellAdjustments(player, target, element, damage);
    
    target:delHP(damage);
    target:updateEnmityFromDamage(player,damage);
    
    -- Gain TP for one hit.
    target:addTP(10);
    player:addTP(5);

    player:removeOldestRune();
    return damage;
end;