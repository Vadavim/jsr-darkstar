-----------------------------------
-- Ability: Swipe
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/jsr_utils");

local runeElements = {ELE_FIRE, ELE_ICE, ELE_WIND, ELE_EARTH, ELE_THUNDER, ELE_WATER, ELE_LIGHT, ELE_DARK};
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
    local params = {}
    params.includemab = true; params.ability = ability; params.magicburst = true;
    ability:setMsg(110);
--    local damage = (player:getStat(MOD_AGI) + player:getStat(MOD_INT));
    local dMND = player:getStat(MOD_MND) - target:getStat(MOD_MND);
    local type1, type2, type3 = player:getRuneTypes();
--    local skill = player:getSkillLevel(ENHANCING_MAGIC_SKILL);
    local skillType = player:getWeaponSkillType(SLOT_MAIN);
    local skill = player:getSkillLevel(skillType);
    local element = runeElements[type1 - 522];
    local resist = applyResistanceAbility(player,target,element,skillType,20 + dMND);
--    damage = math.floor(damage * ( ( 20 + skill) / 100) );
    local damage = math.floor(skill * 0.75) + dMND * (0.5 + player:getSkillLevel(SKILL_ENH) / 100);
    damage = addBonusesAbility(player, element, target, damage, params);
    damage = damage * resist;
    damage = adjustForTarget(target,damage,element);
    damage = finalMagicNonSpellAdjustments(player, target, element, damage);
    
    target:delHP(damage);
    target:updateEnmityFromDamage(player,damage);
    
    -- Gain TP for one hit.
    local dAGI = 1.0 + utils.clamp((player:getStat(MOD_AGI) - target:getStat(MOD_AGI)) * 0.75, -30, 30) / 100;
    local tpMult = 1.0 + utils.clamp((player:getStat(MOD_INT) - target:getStat(MOD_MND)) * 0.75, -30, 30) / 100;
    target:addTP(100 * dAGI);
    player:addTP(50 * tpMult);

    target:updateClaim(player);


    -- try to inflict elemental debuff
    local notHave = nil;
    local inflict = nil;
    local remove = nil;

    if (element == ELE_FIRE) then
        notHave = EFFECT_DROWN; inflict = EFFECT_BURN; remove = EFFECT_FROST;
    elseif (element == ELE_WATER) then
            notHave = EFFECT_SHOCK; inflict = EFFECT_DROWN; remove = EFFECT_BURN;
    elseif (element == ELE_THUNDER) then
        notHave = EFFECT_RASP; inflict = EFFECT_SHOCK; remove = EFFECT_DROWN;
    elseif (element == ELE_EARTH) then
        notHave = EFFECT_CHOKE; inflict = EFFECT_RASP; remove = EFFECT_SHOCK;
    elseif (element == ELE_WIND) then
        notHave = EFFECT_FROST; inflict = EFFECT_CHOKE; remove = EFFECT_RASP;
    elseif (element == ELE_ICE) then
        notHave = EFFECT_BURN; inflict = EFFECT_FROST; remove = EFFECT_CHOKE;
    elseif (element == ELE_LIGHT) then
        notHave = EFFECT_BIO; inflict = EFFECT_DIA; remove = EFFECT_BIO;
    elseif (element == ELE_DARK) then
        notHave = EFFECT_DIA; inflict = EFFECT_BIO; remove = EFFECT_DIA;
    end

    if (resist >= 0.5 and not target:hasStatusEffect(notHave)) then
        target:addStatusEffect(inflict, 1 + skill * 0.08, 0, 90 * resist, 0, 5 + skill * 0.02);
        target:delStatusEffect(remove);
        target:setPendingMessage(277, inflict);
    end


    if (not player:hasStatusEffect(EFFECT_ELEMENTAL_SFORZO)) then
        player:removeOldestRune();
    end
    return damage;
end;