-----------------------------------
--
--     EFFECT_NONE
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HASTE_MAGIC,-effect:getPower());
    target:addMod(MOD_FASTCAST,-effect:getPower() / 10);
    target:addMod(MOD_SNAP_SHOT,-effect:getPower() / 10);
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
    target:delMod(MOD_HASTE_MAGIC,-effect:getPower());
    target:delMod(MOD_FASTCAST,-effect:getPower() / 10);
    target:delMod(MOD_SNAP_SHOT,-effect:getPower() / 10);
end;