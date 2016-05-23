-----------------------------------
-- Ability: Vivacious Pulse
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
	return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    local healing = player:getSkillLevel(SKILL_DIV);
    local ignis = target:getEffectsCount(EFFECT_IGNIS);
    local gelus = target:getEffectsCount(EFFECT_GELUS);
    local flabra = target:getEffectsCount(EFFECT_FLABRA);
    local tellus = target:getEffectsCount(EFFECT_TELLUS);
    local sulpor = target:getEffectsCount(EFFECT_SULPOR);
    local unda = target:getEffectsCount(EFFECT_UNDA);
    local lux = target:getEffectsCount(EFFECT_LUX);
    local tenebrae = target:getEffectsCount(EFFECT_TENEBRAE);
    local duration = 60;
    
    if (lux > 0) then
        healing = healing * (1 + lux * 0.20);
    end
    
    if (ignis > 0 and not player:hasStatusEffect(EFFECT_ATTACK_BOOST)) then
        local power = ignis * 10;
        player:addStatusEffect(EFFECT_ATTACK_BOOST, 10, 0, duration);
    end
    
    if (unda > 0 and not player:hasStatusEffect(EFFECT_MAGIC_DEF_BOOST)) then
        local power = unda * 10;
        player:addStatusEffect(EFFECT_MAGIC_DEF_BOOST, power, 0, duration);
    end
    
    if (gelus > 0 and not player:hasStatusEffect(EFFECT_MAGIC_ATK_BOOST)) then
        local power = gelus * 10;
        player:addStatusEffect(EFFECT_MAGIC_ATK_BOOST, power, 0, duration);
    end
    
    if (sulpor > 0 and not player:hasStatusEffect(EFFECT_POTENCY)) then
        local power = sulpor * 4;
        player:addStatusEffect(EFFECT_POTENCY, power, 0, duration);
    end
    
    if (flabra > 0 and not player:hasStatusEffect(EFFECT_EVASION_BOOST)) then
        local power = flabra * 10;
        player:addStatusEffect(EFFECT_EVASION_BOOST, power, 0, duration);
    end
    
    if (tellus > 0 and not player:hasStatusEffect(EFFECT_DEFENSE_BOOST)) then
        local power = tellus * 10;
        player:addStatusEffect(EFFECT_DEFENSE_BOOST, power, 0, duration);
    end
    
    if (tenebrae > 0) then
        local mpRecovery = player:getSkillLevel(SKILL_DIV) / 4;
        mpRecovery = mpRecovery * tenebrae;
        player:addMP(mpRecovery);
    end
    healing = healing * (1 + player:getMod(MOD_CURE_POTENCY) / 100 );
    healing = healing * (1 + player:getMod(MOD_CURE_POTENCY_RCVD) / 100 );
    healing = math.floor(healing);
    ability:setMsg(MSGBASIC_USES_RECOVERS_HP);
    player:addHP(healing);
    return healing;
end;

