-----------------------------------
-- Ability: Swoordplay
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

function onUseAbility(player,target,ability)
    player:addStatusEffect(EFFECT_ELEMENTAL_SFORZO,1,0,120);

    local effect = player:getStatusEffect(EFFECT_ELEMENTAL_SFORZO);
    if (player:getEffectsCount(EFFECT_IGNIS) >= 1) then
        effect:addMod(MOD_ATTP, 20);
        player:addMod(MOD_ATTP, 20);
    end

    if (player:getEffectsCount(EFFECT_SULPOR) >= 1) then
        effect:addMod(MOD_CRITHITRATE, 20);
        player:addMod(MOD_CRITHITRATE, 20);
    end

    if (player:getEffectsCount(EFFECT_GELUS) >= 1) then
        effect:addMod(MOD_UDMGMAGIC, -50);
        player:addMod(MOD_UDMGMAGIC, -50);
    end

    if (player:getEffectsCount(EFFECT_TELLUS) >= 1) then
        effect:addMod(MOD_UDMGPHYS, -25);
        player:addMod(MOD_UDMGPHYS, -25);
    end

    if (player:getEffectsCount(EFFECT_LUX) >= 1) then
        player:addHP(player:getMaxHP());
    end

    if (player:getEffectsCount(EFFECT_TENEBRAE) >= 1) then
        player:addMP(player:getMaxMP());
    end


    if (player:getEffectsCount(EFFECT_UNDA) >= 1) then
        player:addMod(MOD_MATT, 30);
        player:addMod(MOD_MACC, 30);
        effect:addMod(MOD_MATT, 30);
        effect:addMod(MOD_MACC, 30);
    end

    if (player:getEffectsCount(EFFECT_FLABRA) >= 1) then
        effect:addMod(MOD_EVASION, 25);
        effect:addMod(MOD_PARRY, 25);
        player:addMod(MOD_EVASION, 25);
        player:addMod(MOD_PARRY, 25);
    end

    local tellus = player:getEffectsCount(EFFECT_TELLUS);
    local sulpor = player:getEffectsCount(EFFECT_SULPOR);
    local unda = player:getEffectsCount(EFFECT_UNDA);
    local lux = player:getEffectsCount(EFFECT_LUX);
    local tenebrae = player:getEffectsCount(EFFECT_TENEBRAE);

end;

