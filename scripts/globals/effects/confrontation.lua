-----------------------------------
--
--
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    if (target:getPet()) then
        target:getPet():addStatusEffect(EFFECT_CONFRONTATION, effect:getPower(), 0, effect:getDuration());
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
    if (target == nil or effect == nil) then
        return;
    end
        
    if (target:getPet()) then
        target:getPet():delStatusEffect(EFFECT_CONFRONTATION);
    end
    if (target:isMob() and target:getSpawner() ~= nil and target:getHPP() ~= 0) then
        target:setLocalVar("TimedOut", 1);
        DespawnMob(target:getID());
    end
    --    DespawnMob(id, 10);
    --end
    
end;