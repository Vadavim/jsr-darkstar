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

    if (player:isNM()) then
        ignis = 3; gelus = 3; flabra = 3; tellus = 3; sulpor = 3; unda = 3; lux = 3; tenebrae = 3;
    end


    player:addStatusEffect(EFFECT_LIEMENT, 1, 0, 20);
    local effect = player:getStatusEffect(EFFECT_LIEMENT);
    if (effect ~= nil) then
        if (ignis > 0) then
            player:addMod(MOD_ICE_ABSORB, 75 + ignis * 25);
            effect:addMod(MOD_ICE_ABSORB, 75 + ignis * 25);
        end

        if (sulpor > 0) then
            player:addMod(MOD_WATER_ABSORB, 75 + sulpor * 25);
            effect:addMod(MOD_WATER_ABSORB, 75 + sulpor * 25);
        end

        if (tellus > 0) then
            player:addMod(MOD_LTNG_ABSORB, 75 + tellus * 25);
            effect:addMod(MOD_LTNG_ABSORB, 75 + tellus * 25);
        end

        if (gelus > 0) then
            player:addMod(MOD_WIND_ABSORB, 75 + gelus * 25);
            effect:addMod(MOD_WIND_ABSORB, 75 + gelus * 25);
        end

        if (unda > 0) then
            player:addMod(MOD_FIRE_ABSORB, 75 + unda * 25);
            effect:addMod(MOD_FIRE_ABSORB, 75 + unda * 25);
        end

        if (flabra > 0) then
            player:addMod(MOD_EARTH_ABSORB, 75 + flabra * 25);
            effect:addMod(MOD_EARTH_ABSORB, 75 + flabra * 25);
        end

        if (lux > 0) then
            player:addMod(MOD_DARK_ABSORB, 75 + lux * 25);
            effect:addMod(MOD_DARK_ABSORB, 75 + lux * 25);
        end

        if (tenebrae > 0) then
            player:addMod(MOD_LIGHT_ABSORB, 75 + tenebrae * 25);
            effect:addMod(MOD_LIGHT_ABSORB, 75 + tenebrae * 25);
        end
    end

--    local power = createRuneMask(player);
--    target:addStatusEffect(EFFECT_PFLUG,power,0,120);
end;

