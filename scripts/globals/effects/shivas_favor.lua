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
    target:addMod(MOD_ICEACC,10);
    target:addMod(MOD_ICEATT,10);
    target:addMod(MOD_ICEDEF,25);
    target:addMod(MOD_ICERES,40);
    target:addMod(MOD_MATT,10);
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
    if (not target:isPet()) then
        return;
    end
    local owner = target:getMaster();
    --owner:addStatusEffect(EFFECT_SHIVA_S_FAVOR, 1, 0, 300);
    local party = owner:getParty();
    if (party ~= nil) then
        for i,member in ipairs(party) do
            member:addStatusEffect(EFFECT_SHIVA_S_FAVOR, 1, 0, 16);
        end
    end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_ICEACC,10);
    target:delMod(MOD_ICEATT,10);
    target:delMod(MOD_ICEDEF,25);
    target:delMod(MOD_ICERES,40);
    target:delMod(MOD_MATT,10);
end;