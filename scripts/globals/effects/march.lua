-----------------------------------
--
--    EFFECT_MARCH
-- getPower returns the TIER (e.g. 1,2,3,4)
-- DO NOT ALTER ANY OF THE EFFECT VALUES! DO NOT ALTER EFFECT POWER!
-- Todo: Find a better way of doing this. Need to account for varying modifiers + CASTER's skill (not target)
-----------------------------------
require("scripts/globals/status");
-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HASTE_MAGIC, effect:getPower());
    target:addMod(MOD_SNAP_SHOT, effect:getPower() / 6);
    target:addMod(MOD_UFASTCAST, effect:getPower() / 6);
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
    target:delMod(MOD_HASTE_MAGIC, effect:getPower());
    target:delMod(MOD_SNAP_SHOT, effect:getPower() / 6);
    target:delMod(MOD_UFASTCAST, effect:getPower() / 6);
end;