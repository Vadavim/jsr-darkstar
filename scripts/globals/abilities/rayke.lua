-----------------------------------
-- Ability: Valiance
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/jsr_utils");

-----------------------------------
-- onAbilityCheck
-----------------------------------
local runeElements = {ELE_FIRE, ELE_ICE, ELE_WIND, ELE_EARTH, ELE_THUNDER, ELE_WATER, ELE_LIGHT, ELE_DARK};
local debuffElements = {
    [EFFECT_IGNIS] = MOD_ICERES,
    [EFFECT_SULPOR] = MOD_WATERRES,
    [EFFECT_GELUS] = MOD_WINDRES,
    [EFFECT_TELLUS] = MOD_THUNDERRES,
    [EFFECT_UNDA] = MOD_FIRERES,
    [EFFECT_FLABRA] = MOD_EARTHRES,
    [EFFECT_LUX] = MOD_DARKRES,
    [EFFECT_TENEBRAE] = MOD_LIGHTRES,
};

local debuffAcc = {
    [EFFECT_IGNIS] = MOD_ICEACC,
    [EFFECT_SULPOR] = MOD_WATERACC,
    [EFFECT_GELUS] = MOD_WINDACC,
    [EFFECT_TELLUS] = MOD_THUNDERACC,
    [EFFECT_UNDA] = MOD_FIREACC,
    [EFFECT_FLABRA] = MOD_EARTHACC,
    [EFFECT_LUX] = MOD_DARKACC,
    [EFFECT_TENEBRAE] = MOD_LIGHTACC,
};

local debuffAtt = {
    [EFFECT_IGNIS] = MOD_ICEATT,
    [EFFECT_SULPOR] = MOD_WATERATT,
    [EFFECT_GELUS] = MOD_WINDATT,
    [EFFECT_TELLUS] = MOD_THUNDERATT,
    [EFFECT_UNDA] = MOD_FIREATT,
    [EFFECT_FLABRA] = MOD_EARTHATT,
    [EFFECT_LUX] = MOD_DARKATT,
    [EFFECT_TENEBRAE] = MOD_LIGHTATT,
};

function onAbilityCheck(player,target,ability)
    if (player:getActiveRunes() == 0) then
        return MSGBASIC_UNABLE_TO_USE_JA, 0;
    end;
    return 0,0;
end;
-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability, action)
    setRuneWeaponOffset(player, target, ability, action);
    getRuneSpecEffect(player, target, ability, action, 2);
    local params = {}
    params.includemab = true; params.ability = ability; params.magicburst = true;
    ability:setMsg(110);
    local dMND = player:getStat(MOD_MND) - target:getStat(MOD_MND);
    local type1, type2, type3 = player:getRuneTypes();
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

    if (resist >= 0.25) then
        target:addStatusEffect(EFFECT_RAYKE, 1, 0, 60 * resist);
        local effect = target:getStatusEffect(EFFECT_RAYKE);
        if (effect ~= nil) then
            target:addMod(debuffElements[type1], -50);
            target:addMod(debuffAcc[type1], -25);
            target:addMod(debuffAtt[type1], -25);
            effect:addMod(debuffElements[type1], -50);
            effect:addMod(debuffAcc[type1], -25);
            effect:addMod(debuffAtt[type1], -25);
            target:setPendingMessage(278, EFFECT_RAYKE);
        end


    end





    player:removeOldestRune();
    return damage;
end;

