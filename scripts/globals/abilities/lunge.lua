-----------------------------------
-- Ability: Swipe
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
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
    local type1, type2, type3 = player:getRuneTypes();
    local totalDamage = 0;
    local params = {}
    local skill = player:getSkillLevel(ENHANCING_MAGIC_SKILL);
    params.includemabonus = true;
    ability:setMsg(110);
    
    local iDamage = (player:getStat(MOD_AGI) + player:getStat(MOD_INT));
    iDamage = math.floor(iDamage * ( ( 20 + skill) / 100) );
    for i,v in pairs({type1, type2, type3}) do
        if (v ~= 0) then
        
            local damage = iDamage;
            local element = runeElements[type1 - 522];
            local resist = applyResistanceAbility(player,target,element,ENHANCING_MAGIC_SKILL,20);
        
            damage = addBonusesAbility(player, element, target, damage, params);
            damage = damage * resist;
            damage = adjustForTarget(target,damage,element);
            damage = finalMagicNonSpellAdjustments(player, target, element, damage);
            totalDamage = totalDamage + damage;
            
            -- Gain TP for one hit.
            target:addTP(10);
            player:addTP(5);
        end
    end
    totalDamage = math.floor(totalDamage * 0.8);
    target:delHP(totalDamage);
    target:updateEnmityFromDamage(player,totalDamage);

    player:removeAllRunes();
    return totalDamage;

end;