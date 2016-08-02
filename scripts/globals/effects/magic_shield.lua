-----------------------------------
--
-- Magic Shield BLOCKS all magic attacks
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    if (effect:getPower() == 4) then
        target:addMod(MOD_DEFP, 10);
        target:addMod(MOD_UDMGMAGIC, effect:getSubPower());
    elseif (effect:getPower() == 3) then -- arcane stomp
        target:addMod(MOD_FIRE_ABSORB, 100);
        target:addMod(MOD_EARTH_ABSORB, 100);
        target:addMod(MOD_WATER_ABSORB, 100);
        target:addMod(MOD_WIND_ABSORB, 100);
        target:addMod(MOD_ICE_ABSORB, 100);
        target:addMod(MOD_LTNG_ABSORB, 100);
        target:addMod(MOD_LIGHT_ABSORB, 100);
        target:addMod(MOD_DARK_ABSORB, 100);
    elseif (effect:getPower() < 2) then
        target:addMod(MOD_UDMGMAGIC, -101);
    else
        target:addMod(MOD_MAGIC_ABSORB, 100);
    end;
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
    if (effect:getPower() == 4 and effect:getSubPower() > 0) then
        target:delMod(MOD_UDMGMAGIC, -4);
        effect:setSubPower(effect:getSubPower() - 4);
    end

    if (effect:getSubPower() == 0) then
        target:delStatusEffect(EFFECT_MAGIC_SHIELD);
    end

end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    if (effect:getPower() == 4) then
        target:delMod(MOD_DEFP, 10);
        target:delMod(MOD_UDMGMAGIC, -effect:getSubPower());
    elseif (effect:getPower() == 3) then -- arcane stomp
        target:delMod(MOD_FIRE_ABSORB, 100);
        target:delMod(MOD_EARTH_ABSORB, 100);
        target:delMod(MOD_WATER_ABSORB, 100);
        target:delMod(MOD_WIND_ABSORB, 100);
        target:delMod(MOD_ICE_ABSORB, 100);
        target:delMod(MOD_LTNG_ABSORB, 100);
        target:delMod(MOD_LIGHT_ABSORB, 100);
        target:delMod(MOD_DARK_ABSORB, 100);
    elseif (effect:getPower() < 2) then
        target:delMod(MOD_UDMGMAGIC, -101);
    else
        target:delMod(MOD_MAGIC_ABSORB, 100);
    end;
end;
