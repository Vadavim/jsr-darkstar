-----------------------------------
--
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
    
    -- Check to make sure HP is above threshold.
    local hasTellus = target:getEffectsCount(EFFECT_TELLUS) > 0;
    local threshold = 50;
    if (hasTellus) then
        threshold = 25;
    end
    if (target:getHPP() <= threshold) then
        target:delStatusEffect(EFFECT_SWORDPLAY);
        return;
    end
    
    local hasIgnis = target:getEffectsCount(EFFECT_IGNIS) > 0;
    local hasGelus = target:getEffectsCount(EFFECT_GELUS) > 0;
    local hasFlabra = target:getEffectsCount(EFFECT_FLABRA) > 0;
    local hasUnda = target:getEffectsCount(EFFECT_UNDA) > 0;
    local hasSulpor = target:getEffectsCount(EFFECT_SULPOR) > 0;
    local hasLux = target:getEffectsCount(EFFECT_LUX) > 0;
    local hasTenebrae = target:getEffectsCount(EFFECT_TENEBRAE) > 0;

    if (target:isNM()) then
        hasIgnis = true; hasGelus = true; hasFlabra = true; hasUnda = true; hasSulpor = true; hasLux = true; hasTenebrae = true;
    end

      
    local power = effect:getPower();
    if (power < 20) then
        effect:addMod(MOD_ACC, 1);
        target:addMod(MOD_ACC, 1);
        effect:addMod(MOD_EVA, 1);
        target:addMod(MOD_EVA, 1);
    end

    if (effect:getMod(MOD_ATTP) < 20 and hasIgnis) then
        effect:addMod(MOD_ATTP, 1);
        target:addMod(MOD_ATTP, 1);
    end
    
    if (effect:getMod(MOD_MATT) < 20 and hasGelus) then
        effect:addMod(MOD_MATT, 1);
        target:addMod(MOD_MATT, 1);
    end
    
    if (effect:getMod(MOD_PARRY) < 60 and hasFlabra) then
        effect:addMod(MOD_PARRY, 3);
        target:addMod(MOD_PARRY, 3);
        effect:addMod(MOD_TACTICAL_PARRY, 3);
        target:addMod(MOD_TACTICAL_PARRY, 3);
    end
    
    if (effect:getMod(MOD_DEFP) < 20 and hasTellus) then
        effect:addMod(MOD_DEFP, 1);
        target:addMod(MOD_DEFP, 1);
    end
    
    
    if (effect:getMod(MOD_MDEF) < 20 and hasUnda) then
        effect:addMod(MOD_MDEF, 1);
        target:addMod(MOD_MDEF, 1);
    end
    
    if (effect:getMod(MOD_CURE_POTENCY_RCVD) < 40 and hasLux) then
        effect:addMod(MOD_CURE_POTENCY_RCVD, 2);
        target:addMod(MOD_CURE_POTENCY_RCVD, 2);
    end
    
    if (effect:getMod(MOD_SUBTLE_BLOW) < 40 and hasTenebrae) then
        effect:addMod(MOD_SUBTLE_BLOW, 2);
        target:addMod(MOD_SUBTLE_BLOW, 2);
    end
    
    if (effect:getMod(MOD_CRITHITRATE) < 12 and hasSulpor) then
        effect:addMod(MOD_CRITHITRATE, 1);
        target:addMod(MOD_CRITHITRATE, 1);
    end
    
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)

end;