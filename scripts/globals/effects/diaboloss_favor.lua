-----------------------------------
--
--
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_DARKACC,10);
    target:addMod(MOD_DARKATT,10);
    target:addMod(MOD_DARKDEF,25);
    target:addMod(MOD_DARKRES,40);
    target:addMod(MOD_REFRESH, effect:getPower());
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
    if (not target:isPet()) then
        return;
    end
    local owner = target:getMaster();

    local party = owner:getParty(true);
    if (party ~= nil) then
        for i,member in ipairs(party) do
            member:addStatusEffect(EFFECT_DIABOLOS_S_FAVOR, effect:getPower(), 0, 16);
        end
    end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_DARKACC,10);
    target:delMod(MOD_DARKATT,10);
    target:delMod(MOD_DARKDEF,25);
    target:delMod(MOD_DARKRES,40);
    target:delMod(MOD_REFRESH, effect:getPower());
end;