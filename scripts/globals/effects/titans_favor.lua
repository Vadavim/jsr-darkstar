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
    target:addMod(MOD_EARTHACC,10);
    target:addMod(MOD_EARTHATT,10);
    target:addMod(MOD_EARTHDEF,25);
    target:addMod(MOD_EARTHRES,40);
    target:addMod(MOD_DEF, effect:getPower());
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
            member:addStatusEffect(EFFECT_TITAN_S_FAVOR, effect:getPower(), 0, 16);
        end
    end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_EARTHACC,10);
    target:delMod(MOD_EARTHATT,10);
    target:delMod(MOD_EARTHDEF,25);
    target:delMod(MOD_EARTHRES,40);
    target:delMod(MOD_DEF, effect:getPower());
end;