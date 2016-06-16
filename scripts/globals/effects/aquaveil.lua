-----------------------------------
--
-- MOD_SPELLINTERRUPT
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    if (effect:getSubPower() > 0) then
        target:setMod(MOD_SPIKES, 9);
        target:setMod(MOD_SPIKES_DMG, effect:getSubPower());
    end

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
    if (effect:getSubPower() > 0) then
        target:setMod(MOD_SPIKES, 0);
        target:setMod(MOD_SPIKES_DMG, 0);
    end
end;