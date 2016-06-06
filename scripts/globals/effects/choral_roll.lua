-----------------------------------
--
--
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_SPELLINTERRUPT, effect:getPower());
    target:addMod(MOD_REGEN, effect:getPower() / 15);
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
    target:delMod(MOD_SPELLINTERRUPT, effect:getPower());
    target:delMod(MOD_REGEN, effect:getPower() / 15);
end;