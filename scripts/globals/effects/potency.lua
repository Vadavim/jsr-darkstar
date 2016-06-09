-----------------------------------
--
--
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_CRITHITRATE, effect:getPower());
    target:addMod(MOD_CRIT_DMG_INCREASE, effect:getPower());
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
    target:delMod(MOD_CRITHITRATE, effect:getPower());
    target:delMod(MOD_CRIT_DMG_INCREASE, effect:getPower());
end;