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
      
    local power = effect:getPower();
    if (power < 30) then
        effect:addMod(MOD_ACC, 1);
        target:addMod(MOD_ACC, 1);
        effect:addMod(MOD_EVA, 1);
        target:addMod(MOD_EVA, 1);
    end

    if (effect:getMod(MOD_ATTP) < 10 and hasIgnis) then
        effect:addMod(MOD_ATTP, 1);
        target:addMod(MOD_ATTP, 1);
    end
    
    if (effect:getMod(MOD_MATT) < 20 and hasGelus) then
        effect:addMod(MOD_MATT, 2);
        target:addMod(MOD_MATT, 2);
    end
    
    if (effect:getMod(MOD_PARRY) < 30 and hasFlabra) then
        effect:addMod(MOD_PARRY, 3);
        target:addMod(MOD_PARRY, 3);
    end
    
    if (effect:getMod(MOD_DEFP) < 20 and hasTellus) then
        effect:addMod(MOD_DEFP, 2);
        target:addMod(MOD_DEFP, 2);
    end
    
    
    if (effect:getMod(MOD_MDEF) < 30 and hasUnda) then
        effect:addMod(MOD_MDEF, 3);
        target:addMod(MOD_MDEF, 3);
    end
    
    if (effect:getMod(MOD_CURE_POTENCY_RCVD) < 30 and hasLux) then
        effect:addMod(MOD_CURE_POTENCY_RCVD, 3);
        target:addMod(MOD_CURE_POTENCY_RCVD, 3);
    end
    
    if (effect:getMod(MOD_SUBTLE_BLOW) < 50 and hasTenebrae) then
        effect:addMod(MOD_SUBTLE_BLOW, 5);
        target:addMod(MOD_SUBTLE_BLOW, 5);
    end
    
    if (effect:getMod(MOD_CRITHITRATE) < 10 and hasSulpor) then
        effect:addMod(MOD_CRITHITRATE, 1);
        target:addMod(MOD_CRITHITRATE, 1);
    end
    
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)

end;