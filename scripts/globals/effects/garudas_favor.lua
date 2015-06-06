-----------------------------------
--
--
--
-----------------------------------
-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_WINDACC,10);
    target:addMod(MOD_WINDATT,10);
    target:addMod(MOD_WINDDEF,25);
    target:addMod(MOD_WINDRES,40);
    target:addMod(MOD_EVA, 20);
    target:addMod(MOD_RATTP, 10);
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
    if (not target:isPet()) then
        return;
    end
    local owner = target:getMaster();

    local party = owner:getParty();
    if (party ~= nil) then
        for i,member in ipairs(party) do
            member:addStatusEffect(EFFECT_GARUDA_S_FAVOR, effect:getPower(), 0, 16);
        end
    end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_WINDACC,10);
    target:delMod(MOD_WINDATT,10);
    target:delMod(MOD_WINDDEF,25);
    target:delMod(MOD_WINDRES,40);
    target:delMod(MOD_EVA, 20);
    target:delMod(MOD_RATTP, 10);
end;