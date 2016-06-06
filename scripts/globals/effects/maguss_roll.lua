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
    target:addMod(MOD_MDEF, effect:getPower());
    target:addMod(MOD_POISONRES, effect:getPower());
    target:addMod(MOD_CHARMRES, effect:getPower());
    target:addMod(MOD_SILENCERES, effect:getPower());
    target:addMod(MOD_DEATHRES, effect:getPower());
    target:addMod(MOD_BLINDRES, effect:getPower());
    target:addMod(MOD_SLOWRES, effect:getPower());
    target:addMod(MOD_PARALYZERES, effect:getPower());
    target:addMod(MOD_STUNRES, effect:getPower());
    target:addMod(MOD_VIRUSRES, effect:getPower());
    target:addMod(MOD_AMNESIARES, effect:getPower());
    target:addMod(MOD_SLEEPRES, effect:getPower());
    target:addMod(MOD_PETRIFYRES, effect:getPower());
    target:addMod(MOD_GRAVITYRES, effect:getPower());
    target:addMod(MOD_CURSERES, effect:getPower());
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
    target:delMod(MOD_MDEF, effect:getPower());
    target:delMod(MOD_POISONRES, effect:getPower());
    target:delMod(MOD_CHARMRES, effect:getPower());
    target:delMod(MOD_SILENCERES, effect:getPower());
    target:delMod(MOD_DEATHRES, effect:getPower());
    target:delMod(MOD_BLINDRES, effect:getPower());
    target:delMod(MOD_SLOWRES, effect:getPower());
    target:delMod(MOD_PARALYZERES, effect:getPower());
    target:delMod(MOD_STUNRES, effect:getPower());
    target:delMod(MOD_VIRUSRES, effect:getPower());
    target:delMod(MOD_AMNESIARES, effect:getPower());
    target:delMod(MOD_SLEEPRES, effect:getPower());
    target:delMod(MOD_PETRIFYRES, effect:getPower());
    target:delMod(MOD_GRAVITYRES, effect:getPower());
    target:delMod(MOD_CURSERES, effect:getPower());
end;