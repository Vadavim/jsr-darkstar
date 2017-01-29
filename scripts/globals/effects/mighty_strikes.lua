-----------------------------------
--
--     EFFECT_MIGHTY_STRIKES
--     
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
target:addMod(MOD_CRITHITRATE,100)
if (target:isMob() and not target:isPet()) then
    target:addMod(MOD_TP_BONUS,1000)
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
target:addMod(MOD_CRITHITRATE,-100)
if (target:isMob() and not target:isPet()) then
    target:delMod(MOD_TP_BONUS,1000)
end

end;