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
    end

    target:addMod(MOD_POISONRES, -effect:getPower());
    target:addMod(MOD_CHARMRES, -effect:getPower());
    target:addMod(MOD_SILENCERES, -effect:getPower());
    target:addMod(MOD_DEATHRES, -effect:getPower());
    target:addMod(MOD_BLINDRES, -effect:getPower());
    target:addMod(MOD_SLOWRES, -effect:getPower());
    target:addMod(MOD_PARALYZERES, -effect:getPower());
    target:addMod(MOD_STUNRES, -effect:getPower());
    target:addMod(MOD_VIRUSRES, -effect:getPower());
    target:addMod(MOD_AMNESIARES, -effect:getPower());
    target:addMod(MOD_SLEEPRES, -effect:getPower());
    target:addMod(MOD_PETRIFYRES, -effect:getPower());
    target:addMod(MOD_GRAVITYRES, -effect:getPower());
    target:addMod(MOD_CURSERES, -effect:getPower());

    target:addMod(MOD_STR, -6);
    target:addMod(MOD_VIT, -6);
    target:addMod(MOD_DEX, -6);
    target:addMod(MOD_INT, -6);
    target:addMod(MOD_AGI, -6);
    target:addMod(MOD_MND, -6);
    target:addMod(MOD_CHR, -6);

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
    if (target:isPC()) then
        target:delMod(MOD_HPP,-effect:getPower());
        target:delMod(MOD_MPP,-effect:getPower());
        target:delMod(MOD_MOVE,-effect:getPower());
    end


    target:delMod(MOD_POISONRES, -effect:getPower());
    target:delMod(MOD_CHARMRES, -effect:getPower());
    target:delMod(MOD_SILENCERES, -effect:getPower());
    target:delMod(MOD_DEATHRES, -effect:getPower());
    target:delMod(MOD_BLINDRES, -effect:getPower());
    target:delMod(MOD_SLOWRES, -effect:getPower());
    target:delMod(MOD_PARALYZERES, -effect:getPower());
    target:delMod(MOD_STUNRES, -effect:getPower());
    target:delMod(MOD_VIRUSRES, -effect:getPower());
    target:delMod(MOD_AMNESIARES, -effect:getPower());
    target:delMod(MOD_SLEEPRES, -effect:getPower());
    target:delMod(MOD_PETRIFYRES, -effect:getPower());
    target:delMod(MOD_GRAVITYRES, -effect:getPower());
    target:delMod(MOD_CURSERES, -effect:getPower());

    target:delMod(MOD_STR, -6);
    target:delMod(MOD_VIT, -6);
    target:delMod(MOD_DEX, -6);
    target:delMod(MOD_INT, -6);
    target:delMod(MOD_AGI, -6);
    target:delMod(MOD_MND, -6);
    target:delMod(MOD_CHR, -6);
end;