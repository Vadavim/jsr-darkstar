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
    target:addMod(MOD_WATERACC,10);
    target:addMod(MOD_WATERATT,10);
    target:addMod(MOD_WATERDEF,25);
    target:addMod(MOD_WATERRES,40);
    target:addMod(MOD_POISONRES,15);
    target:addMod(MOD_DEATHRES,15);
    target:addMod(MOD_SLOWRES,15);
    target:addMod(MOD_AMNESIARES,15);
    target:addMod(MOD_GRAVITYRES,15);
    target:addMod(MOD_STUNRES,15);
    target:addMod(MOD_VIRUSRES,15);
    target:addMod(MOD_PETRIFYRES,15);
    target:addMod(MOD_SILENCERES,15);
    target:addMod(MOD_BLINDRES,15);
    target:addMod(MOD_CHARMRES,15);
    target:addMod(MOD_SLEEPRES,15);
    target:addMod(MOD_BINDRES,15);
    target:addMod(MOD_CURSERES,15);
    target:addMod(MOD_MDEF, 15);
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
    target:delMod(MOD_POISONRES,15);
    target:delMod(MOD_DEATHRES,15);
    target:delMod(MOD_SLOWRES,15);
    target:delMod(MOD_AMNESIARES,15);
    target:delMod(MOD_GRAVITYRES,15);
    target:delMod(MOD_STUNRES,15);
    target:delMod(MOD_VIRUSRES,15);
    target:delMod(MOD_PETRIFYRES,15);
    target:delMod(MOD_SILENCERES,15);
    target:delMod(MOD_BLINDRES,15);
    target:delMod(MOD_CHARMRES,15);
    target:delMod(MOD_SLEEPRES,15);
    target:delMod(MOD_BINDRES,15);
    target:delMod(MOD_CURSERES,15);
    target:delMod(MOD_MDEF, 15);
end;