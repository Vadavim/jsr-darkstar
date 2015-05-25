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
    target:addMod(MOD_LIGHTACC,10);
    target:addMod(MOD_LIGHTATT,10);
    target:addMod(MOD_LIGHTDEF,25);
    target:addMod(MOD_LIGHTRES,40);
    target:addMod(MOD_REGEN, effect:getPower());
    target:addMod(MOD_CURE_POTENCY, 10);
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
            member:addStatusEffect(EFFECT_CARBUNCLE_S_FAVOR, effect:getPower(), 0, 16);
        end
    end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_LIGHTACC,10);
    target:delMod(MOD_LIGHTATT,10);
    target:delMod(MOD_LIGHTDEF,25);
    target:delMod(MOD_LIGHTRES,40);
    target:delMod(MOD_REGEN, effect:getPower());
    target:delMod(MOD_CURE_POTENCY, 10);
end;