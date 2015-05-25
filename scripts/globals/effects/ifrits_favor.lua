-----------------------------------
--
--
--
-----------------------------------
-----------------------------------
require("scripts/globals/status");
-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FIREACC,10);
    target:addMod(MOD_FIREATT,10);
    target:addMod(MOD_FIREDEF,25);
    target:addMod(MOD_FIRERES,40);
    target:addMod(MOD_DOUBLE_ATTACK, 10);
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
    if (party ~= null) then
        for i,member in ipairs(party) do
            member:addStatusEffect(EFFECT_IFRIT_S_FAVOR, 1, 0, 16);
        end
    end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FIREACC,10);
    target:delMod(MOD_FIREATT,10);
    target:delMod(MOD_FIREDEF,25);
    target:delMod(MOD_FIRERES,40);
    target:delMod(MOD_DOUBLE_ATTACK, 10);
end;