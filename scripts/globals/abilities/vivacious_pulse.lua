-----------------------------------
-- Ability: Vivacious Pulse
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/jsr_utils");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
	return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability, action)
    getRuneSpecEffect(player, target, ability, action);
    local skill = player:getSkillLevel(SKILL_DIV);
    local healing = skill;
    local ignis = target:getEffectsCount(EFFECT_IGNIS);
    local gelus = target:getEffectsCount(EFFECT_GELUS);
    local flabra = target:getEffectsCount(EFFECT_FLABRA);
    local tellus = target:getEffectsCount(EFFECT_TELLUS);
    local sulpor = target:getEffectsCount(EFFECT_SULPOR);
    local unda = target:getEffectsCount(EFFECT_UNDA);
    local lux = target:getEffectsCount(EFFECT_LUX);
    local tenebrae = target:getEffectsCount(EFFECT_TENEBRAE);
    local duration = 60;

    if (tenebrae > 0) then
        player:addMP(skill * 0.12 * (1 + tenebrae - 1));
    end

    if (lux > 0) then
        healing = healing + (lux + 1) * player:getStat(MOD_CHR);
    end

    if (ignis > 0) then
        healing = healing + (ignis + 1) * player:getStat(MOD_STR);
    end

    if (unda > 0) then
        healing = healing + (unda + 1) * player:getStat(MOD_MND);
    end

    if (sulpor > 0) then
        healing = healing + (sulpor + 1) * player:getStat(MOD_DEX);
    end

    if (gelus > 0) then
        healing = healing + (gelus + 1) * player:getStat(MOD_INT);
    end

    if (tellus > 0) then
        healing = healing + (tellus + 1) * player:getStat(MOD_VIT);
    end

    if (flabra > 0) then
        healing = healing + (flabra + 1) * player:getStat(MOD_AGI);
    end
--
--    if (ignis > 0 and not player:hasStatusEffect(EFFECT_ATTACK_BOOST)) then
--        local power = 20 + (ignis - 1) * 5;
--        player:addStatusEffect(EFFECT_ATTACK_BOOST, 10, 0, duration);
--    end
--
--    if (unda > 0 and not player:hasStatusEffect(EFFECT_MAGIC_DEF_BOOST)) then
--        local power = 20 + (unda - 1) * 5;
--        player:addStatusEffect(EFFECT_MAGIC_DEF_BOOST, power, 0, duration);
--    end
--
--    if (gelus > 0 and not player:hasStatusEffect(EFFECT_MAGIC_ATK_BOOST)) then
--        local power = 20 + (gelus - 1) * 5;
--        player:addStatusEffect(EFFECT_MAGIC_ATK_BOOST, power, 0, duration);
--    end
--
--    if (sulpor > 0 and not player:hasStatusEffect(EFFECT_POTENCY)) then
--        local power = 6 + (sulpor - 1) * 2;
--        player:addStatusEffect(EFFECT_POTENCY, power, 0, duration);
--    end
--
--    if (flabra > 0 and not player:hasStatusEffect(EFFECT_EVASION_BOOST)) then
--        local power = 20 + (flabra - 1) * 5;
--        player:addStatusEffect(EFFECT_EVASION_BOOST, power, 0, duration);
--    end
--
--    if (tellus > 0 and not player:hasStatusEffect(EFFECT_DEFENSE_BOOST)) then
--        local power = 20 + (tellus - 1) * 5;
--        player:addStatusEffect(EFFECT_DEFENSE_BOOST, power, 0, duration);
--    end
--
--    if (tenebrae > 0) then
--        local mpRecovery = player:getSkillLevel(SKILL_DIV) / 4;
--        mpRecovery = mpRecovery * (1 + (tenebrae - 1) / 2);
--        player:addMP(mpRecovery);
--    end

    local erased = player:eraseStatusEffect();
    if (erased == nil or erased == 0) then
        if (player:hasStatusEffect(EFFECT_CURSE_I)) then player:delStatusEffect(EFFECT_CURSE_I);
        elseif (player:hasStatusEffect(EFFECT_PETRIFICATION)) then player:delStatusEffect(EFFECT_PETRIFICATION);
        elseif (player:hasStatusEffect(EFFECT_DISEASE)) then player:delStatusEffect(EFFECT_DISEASE);
        elseif (player:hasStatusEffect(EFFECT_PLAGUE)) then player:delStatusEffect(EFFECT_PLAGUE);
        elseif (player:hasStatusEffect(EFFECT_PARALYSIS)) then player:delStatusEffect(EFFECT_PARALYSIS);
        elseif (player:hasStatusEffect(EFFECT_POISON)) then player:delStatusEffect(EFFECT_POISON);
        elseif (player:hasStatusEffect(EFFECT_BLINDNESS)) then player:delStatusEffect(EFFECT_BLINDNESS);
        elseif (player:hasStatusEffect(EFFECT_SILENCE)) then player:delStatusEffect(EFFECT_SILENCE);
        end

    end


    healing = healing * (1 + player:getMod(MOD_CURE_POTENCY) / 100 );
    healing = healing * (1 + player:getMod(MOD_CURE_POTENCY_RCVD) / 100 );
    healing = math.floor(healing);
    ability:setMsg(MSGBASIC_USES_RECOVERS_HP);
    player:addHP(healing);
    return healing;
end;

