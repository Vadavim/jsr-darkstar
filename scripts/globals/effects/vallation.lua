-----------------------------------
--
--
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/jsr_utils");


-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    
    local ignis = target:getEffectsCount(EFFECT_IGNIS);
    local gelus = target:getEffectsCount(EFFECT_GELUS);
    local flabra = target:getEffectsCount(EFFECT_FLABRA);
    local unda = target:getEffectsCount(EFFECT_UNDA);
    local tellus = target:getEffectsCount(EFFECT_TELLUS);
    local sulpor = target:getEffectsCount(EFFECT_SULPOR);
    local lux = target:getEffectsCount(EFFECT_LUX);
    local tenebrae = target:getEffectsCount(EFFECT_TENEBRAE);
    
    effect:addMod(MOD_FIREDEF, vallationDefense(ignis));
    effect:addMod(MOD_ICEDEF, vallationDefense(gelus));
    effect:addMod(MOD_WATERDEF, vallationDefense(unda));
    effect:addMod(MOD_EARTHDEF, vallationDefense(tellus));
    effect:addMod(MOD_THUNDERDEF, vallationDefense(sulpor));
    effect:addMod(MOD_WINDDEF, vallationDefense(flabra));
    effect:addMod(MOD_LIGHTDEF, vallationDefense(lux));
    effect:addMod(MOD_DARKDEF, vallationDefense(tenebrae));
    
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
end;