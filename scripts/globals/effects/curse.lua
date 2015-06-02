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
    --NOTE: The power amount dictates the amount to REDUCE MAX VALUES BY. E.g. Power=75 means 'reduce max hp/mp by 75%'
    if (target:isPC()) then
        target:addMod(MOD_HPP,-effect:getPower());
        target:addMod(MOD_MPP,-effect:getPower());
        target:addMod(MOD_MOVE,-effect:getPower());
    else
        --If it's a mob, add status penalties
        target:addMod(MOD_SLEEPRES,-effect:getPower());
        target:addMod(MOD_POISONRES,-effect:getPower());
        target:addMod(MOD_PARALYZERES,-effect:getPower());
        target:addMod(MOD_BLINDRES,-effect:getPower());
        target:addMod(MOD_SILENCERES,-effect:getPower());
        target:addMod(MOD_VIRUSRES,-effect:getPower());
        target:addMod(MOD_PETRIFYRES,-effect:getPower());
        target:addMod(MOD_BINDRES,-effect:getPower());
        target:addMod(MOD_CURSERES,-effect:getPower());
        target:addMod(MOD_GRAVITYRES,-effect:getPower());
        target:addMod(MOD_SLOWRES,-effect:getPower());
        target:addMod(MOD_STUNRES,-effect:getPower());
        target:addMod(MOD_CHARMRES,-effect:getPower());
        target:addMod(MOD_AMNESIARES,-effect:getPower());
        target:addMod(MOD_DEATHRES,-effect:getPower());
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
    --restore HP and MP to its former state. Remove 100% slow
    if (target:isPC()) then
        target:delMod(MOD_HPP,-effect:getPower());
        target:delMod(MOD_MPP,-effect:getPower());
        target:delMod(MOD_MOVE,-effect:getPower());
    else
        target:delMod(MOD_SLEEPRES,-effect:getPower());
        target:delMod(MOD_POISONRES,-effect:getPower());
        target:delMod(MOD_PARALYZERES,-effect:getPower());
        target:delMod(MOD_BLINDRES,-effect:getPower());
        target:delMod(MOD_SILENCERES,-effect:getPower());
        target:delMod(MOD_VIRUSRES,-effect:getPower());
        target:delMod(MOD_PETRIFYRES,-effect:getPower());
        target:delMod(MOD_BINDRES,-effect:getPower());
        target:delMod(MOD_CURSERES,-effect:getPower());
        target:delMod(MOD_GRAVITYRES,-effect:getPower());
        target:delMod(MOD_SLOWRES,-effect:getPower());
        target:delMod(MOD_STUNRES,-effect:getPower());
        target:delMod(MOD_CHARMRES,-effect:getPower());
        target:delMod(MOD_AMNESIARES,-effect:getPower());
        target:delMod(MOD_DEATHRES,-effect:getPower());
    end
end;