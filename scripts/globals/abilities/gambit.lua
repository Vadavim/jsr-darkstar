-----------------------------------
-- Ability: Valiance
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/jsr_utils");

-----------------------------------
-- onAbilityCheck
-----------------------------------

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
    getRuneSpecEffect(player, target, ability, action);
    local ignis = player:getEffectsCount(EFFECT_IGNIS);
    local gelus = player:getEffectsCount(EFFECT_GELUS);
    local flabra = player:getEffectsCount(EFFECT_FLABRA);
    local tellus = player:getEffectsCount(EFFECT_TELLUS);
    local sulpor = player:getEffectsCount(EFFECT_SULPOR);
    local unda = player:getEffectsCount(EFFECT_UNDA);
    local lux = player:getEffectsCount(EFFECT_LUX);
    local tenebrae = player:getEffectsCount(EFFECT_TENEBRAE);
    local element = ELE_NONE;
    if (ignis >= 2) then element = ELE_FIRE;
    elseif (gelus >= 2) then element = ELE_ICE;
    elseif (flabra >= 2) then element = ELE_WIND;
    elseif (tellus >= 2) then element = ELE_EARTH;
    elseif (sulpor >= 2) then element = ELE_THUNDER;
    elseif (unda >= 2) then element = ELE_WATER;
    elseif (lux >= 2) then element = ELE_LIGHT;
    elseif (tenebrae >= 2) then element = ELE_DARK;
    end

    player:removeAllRunes();

    local duration = 90;
    local skillType = player:getWeaponSkillType(SLOT_MAIN);
    local skill = player:getSkillLevel(skillType);
    local dMND = player:getStat(MOD_MND) - target:getStat(MOD_MND);
    local resist = applyResistanceAbility(player,target,element,skillType,20 + dMND);
    target:updateClaim(player);

    if (resist >= 0.25) then
        target:addStatusEffect(EFFECT_GAMBIT, 0, 0, 90 * resist);
        local gambit = target:getStatusEffect(EFFECT_GAMBIT);
        if (gambit ~= nil) then
            target:addMod(MOD_FIREDEF, -(unda * 25));
            target:addMod(MOD_ICEDEF, -(ignis * 25));
            target:addMod(MOD_WINDDEF, -(gelus * 25));
            target:addMod(MOD_EARTHDEF, -(flabra * 25));
            target:addMod(MOD_THUNDERDEF, -(tellus * 25));
            target:addMod(MOD_WATERDEF, -(sulpor * 25));
            target:addMod(MOD_LIGHTDEF, -(tenebrae * 25));
            target:addMod(MOD_DARKDEF, -(lux * 25));
            gambit:addMod(MOD_FIREDEF, -(unda * 25));
            gambit:addMod(MOD_ICEDEF, -(ignis * 25));
            gambit:addMod(MOD_WINDDEF, -(gelus * 25));
            gambit:addMod(MOD_EARTHDEF, -(flabra * 25));
            gambit:addMod(MOD_THUNDERDEF, -(tellus * 25));
            gambit:addMod(MOD_WATERDEF, -(sulpor * 25));
            gambit:addMod(MOD_LIGHTDEF, -(tenebrae * 25));
            gambit:addMod(MOD_DARKDEF, -(lux * 25));

        end
        if (resist <= 0.5) then
            return 0;
        end

        if (ignis > 0) then
            local resist2 = applyResistanceAbility(player, target, ELE_FIRE, skillType, dMND - 40 + (ignis * ignis / 2) * 15);
            if (resist2 >= 0.5) then
                local success = target:addStatusEffect(EFFECT_ADDLE, 30, 0, 90 * resist);
                if (success == true) then
                    target:setPendingMessage(278, EFFECT_ADDLE);
                end
            end
        end

        if (gelus > 0) then
            resist = applyResistanceAbility(player, target, ELE_ICE, skillType, dMND - 40 + (gelus * gelus / 2) * 15);
            if (resist >= 0.5) then
                local success = target:addStatusEffect(EFFECT_PARALYSIS, 25, 0, 90 * resist);
                if (success == true) then
                    target:setPendingMessage(277, EFFECT_PARALYSIS);
                end
            end
        end

        if (flabra > 0) then
            resist = applyResistanceAbility(player, target, ELE_WIND, skillType, dMND - 40 + (flabra * flabra / 2) * 15);
            if (resist >= 0.5) then
                local success = target:addStatusEffect(EFFECT_SILENCE, 1, 0, 90 * resist);
                if (success == true ) then
                    target:setPendingMessage(277, EFFECT_SILENCE);
                end

            end
        end

        if (tellus > 0) then
            resist = applyResistanceAbility(player, target, ELE_EARTH, skillType, dMND - 20 + (tellus * tellus / 2) * 15);
            if (resist >= 0.5) then
                local success = target:addStatusEffect(EFFECT_SLOW, 250, 0, 90 * resist);
                if (success == true) then
                    target:setPendingMessage(277, EFFECT_SLOW);
                end
            end
        end

        if (sulpor > 0) then
            resist = applyResistanceAbility(player, target, ELE_LIGHTNING, skillType, dMND - 20 + (sulpor * sulpor / 2) * 15);
            if (resist >= 0.5) then
                local success = target:addStatusEffect(EFFECT_STUN, 1, 0, 8 * resist);
                if (success == true) then
                    target:setPendingMessage(277, EFFECT_STUN);
                end
            end
        end

        if (unda > 0) then
            resist = applyResistanceAbility(player, target, ELE_WATER, skillType, dMND - 20 + (unda * unda / 2) * 15);
            if (resist >= 0.5) then
                local success = target:addStatusEffect(EFFECT_POISON, 5 + skill * 0.1, 0, 90 * resist);
                if (success == true) then
                    target:setPendingMessage(277, EFFECT_POISON);
                end
            end
        end

        if (lux > 0) then
            resist = applyResistanceAbility(player, target, ELE_LIGHT, skillType, dMND - 20 + (unda * unda / 2) * 15);
            if (resist >= 0.5) then
                target:dispelStatusEffect();
            end
        end

        if (tenebrae > 0) then
            resist = applyResistanceAbility(player, target, ELE_DARK, skillType, dMND - 20 + (tenebrae * tenebrae / 2) * 15);
            if (resist >= 0.5) then
                local success = target:addStatusEffect(EFFECT_BLINDNESS, 25, 0, 90 * resist);
                if (success == true) then
                    target:setPendingMessage(277, EFFECT_BLINDNESS);
                end
            end
        end


    end
    return 0
end;

