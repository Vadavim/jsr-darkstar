-----------------------------------
--
--
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------
function onEffectGain(target,effect)
    target:addMod(MOD_WATERACC,10);
    target:addMod(MOD_WATERATT,10);
    target:addMod(MOD_WATERDEF,250);
    target:addMod(MOD_WATERRES,40);
    target:addMod(MOD_MACC, 20);
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
            member:addStatusEffect(EFFECT_LEVIATHAN_S_FAVOR, effect:getPower(), 0, 16);
        end
    end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_WATERACC,10);
    target:delMod(MOD_WATERATT,10);
    target:delMod(MOD_WATERDEF,25);
    target:delMod(MOD_WATERRES,40);
    target:delMod(MOD_MACC, 20);
end;