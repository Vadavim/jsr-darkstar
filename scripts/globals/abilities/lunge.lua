-----------------------------------
-- Ability: Swipe
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/jsr_utils");
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

function onUseAbility(player, target, ability, action)
    setRuneWeaponOffset(player, target, ability, action);
    getRuneSpecEffect(player, target, ability, action, 2);
    local dMND = player:getStat(MOD_MND) - target:getStat(MOD_MND);
    local type1, type2, type3 = player:getRuneTypes();
    local totalDamage = 0;
    local params = {}
    local skillType = player:getWeaponSkillType(SLOT_MAIN);
    local skill = player:getSkillLevel(skillType);
    params.includemab = true; params.ability = ability; params.magicburst = true;
    ability:setMsg(110);

    local iDamage = math.floor(skill * 0.75) + dMND * (0.5 + player:getSkillLevel(SKILL_ENH) / 100);
    for i,v in pairs({type1, type2, type3}) do
        if (v ~= 0) then
        
            local damage = iDamage;
            local element = runeElements[type1 - 522];
            local resist = applyResistanceAbility(player,target,element,skillType,20 + dMND);
        
            damage = addBonusesAbility(player, element, target, damage, params);
            damage = damage * resist;
            damage = adjustForTarget(target,damage,element);
            damage = finalMagicNonSpellAdjustments(player, target, element, damage);
            totalDamage = totalDamage + damage;
            
            -- Gain TP for one hit.
            local dAGI = 1.0 + utils.clamp((player:getStat(MOD_AGI) - target:getStat(MOD_AGI)) * 0.75, -30, 30) / 100;
            local tpMult = 1.0 + utils.clamp((player:getStat(MOD_INT) - target:getStat(MOD_MND)) * 0.75, -30, 30) / 100;
            target:addTP(100 * dAGI);
            player:addTP(50 * tpMult);
        end
    end
    target:delHP(totalDamage);
    target:updateEnmityFromDamage(player,totalDamage);
    target:updateClaim(player);

    if (not player:hasStatusEffect(EFFECT_ELEMENTAL_SFORZO)) then
        player:removeAllRunes();
    end

    return totalDamage;

end;