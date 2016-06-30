-----------------------------------
--
--     EFFECT_FROST
--     
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_REGEN_DOWN, effect:getPower());
    target:addMod(MOD_AGI, -getElementalDebuffStatDownFromDOT(effect:getPower()));
    target:addMod(MOD_WINDRES, -15);
    target:addMod(MOD_WINDDEF, -20);
    target:addMod(MOD_ICERES, -15);
    target:addMod(MOD_ICEDEF, -20);
    local family = target:getFamily();
    if (family >= 228 and family <= 230) then
        target:addMod(MOD_SLASHRES, 400);
        target:addMod(MOD_PIERCERES, 400);
        target:addMod(MOD_IMPACTRES, 1000);
        target:addMod(MOD_HTHRES, 1000);
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
    target:delMod(MOD_REGEN_DOWN, effect:getPower());
    target:delMod(MOD_AGI, -getElementalDebuffStatDownFromDOT(effect:getPower()));
    target:delMod(MOD_WINDRES, -15);
    target:delMod(MOD_WINDDEF, -20);
    target:delMod(MOD_ICERES, -15);
    target:delMod(MOD_ICEDEF, -20);
    local family = target:getFamily();
    if (family >= 228 and family <= 230) then
        target:delMod(MOD_SLASHRES, 400);
        target:delMod(MOD_PIERCERES, 400);
        target:delMod(MOD_IMPACTRES, 1000);
        target:delMod(MOD_HTHRES, 1000);
    end
end;