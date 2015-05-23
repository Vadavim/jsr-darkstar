-----------------------------------
--
--
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------


function onEffectGain(target,effect)
	target:addMod(MOD_REGEN, effect:getPower() / 2);
    target:addMod(MOD_CHR,effect:getPower());
    target:addMod(MOD_STR,effect:getPower());
    target:addMod(MOD_VIT,effect:getPower());
    target:addMod(MOD_DEX,effect:getPower());
    target:addMod(MOD_AGI,effect:getPower());
    target:addMod(MOD_INT,effect:getPower());
    target:addMod(MOD_MND,effect:getPower());
    target:addMod(MOD_HASTE_ABILITY,102);
    target:addMod(MOD_UFASTCAST,33);
    target:addMod(MOD_SPELLINTERRUPT,50);
    target:addMod(MOD_ATTP,30);
    target:addMod(MOD_ACC,30);
    target:addMod(MOD_RACC,30);
    target:addMod(MOD_MACC,30);
    target:addMod(MOD_MEVA,30);
    target:addMod(MOD_DEFP,30);
    target:addMod(MOD_RATTP, 30);
    target:addMod(MOD_MATT,50);
    target:addMod(MOD_REFRESH, effect:getPower() / 6);
    target:addMod(MOD_UDMGMAGIC,-50);
    target:addMod(MOD_UDMGPHYS,-20);
    target:addMod(MOD_STORETP, 33);
    target:addMod(MOD_SNAP_SHOT, 33);
    target:addMod(MOD_EXP_BONUS, 30);
    
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
    local pet = target:getPet();
    if (pet ~= nil) then
        pet:addStatusEffect(EFFECT_ATMA,effect:getPower(),0,6);
    end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_REGEN, effect:getPower() / 2);
    target:delMod(MOD_CHR,effect:getPower());
    target:delMod(MOD_STR,effect:getPower());
    target:delMod(MOD_VIT,effect:getPower());
    target:delMod(MOD_DEX,effect:getPower());
    target:delMod(MOD_AGI,effect:getPower());
    target:delMod(MOD_INT,effect:getPower());
    target:delMod(MOD_MND,effect:getPower());
    target:delMod(MOD_HASTE_ABILITY,102);
    target:delMod(MOD_UFASTCAST,33);
    target:delMod(MOD_SPELLINTERRUPT,50);
    target:delMod(MOD_ATTP,30);
    target:delMod(MOD_DEFP,30);
    target:delMod(MOD_MATT,50);
    target:delMod(MOD_REFRESH, effect:getPower() / 6);
    target:delMod(MOD_UDMGMAGIC,-50);
    target:delMod(MOD_UDMGPHYS,-20);
    target:delMod(MOD_STORETP, 33);
    target:delMod(MOD_SNAP_SHOT, 33);
    target:delMod(MOD_RATTP, 30);
    target:delMod(MOD_EXP_BONUS, 30);
    target:delMod(MOD_ACC,30);
    target:delMod(MOD_MACC,30);
    target:delMod(MOD_MEVA,30);
    target:delMod(MOD_RACC,30);
end;