-----------------------------------
--
--
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------
function onEffectGain(target,effect)
    target:addMod(MOD_THUNDERACC,10);
    target:addMod(MOD_THUNDERATT,10);
    target:addMod(MOD_THUNDERDEF,25);
    target:addMod(MOD_THUNDERRES,40);
    target:addMod(MOD_CRIT_DMG_INCREASE, 25);
    target:addMod(MOD_CRITHITRATE, 5);
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
            member:addStatusEffect(EFFECT_RAMUH_S_FAVOR, effect:getPower(), 0, 16);
        end
    end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_THUNDERACC,10);
    target:delMod(MOD_THUNDERATT,10);
    target:delMod(MOD_THUNDERDEF,25);
    target:delMod(MOD_THUNDERRES,40);
    target:delMod(MOD_CRIT_DMG_INCREASE, 25);
    target:delMod(MOD_CRITHITRATE, 5);
end;