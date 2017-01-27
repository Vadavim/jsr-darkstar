-----------------------------------
--
--
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:recalculateAbilitiesTable();
    local bonus = effect:getPower();
--    local regen = effect:getSubPower();
    local mainBonus = 0;
    if (target:getMainJob() == JOBS.SCH) then mainBonus = 10; end;

    target:addMod(MOD_WHITE_MAGIC_COST, -bonus);
    target:addMod(MOD_WHITE_MAGIC_CAST, -bonus);
    target:addMod(MOD_WHITE_MAGIC_RECAST, -bonus);

    if not (target:hasStatusEffect(EFFECT_TABULA_RASA)) then
        target:addMod(MOD_WHITE_MAGIC_COST, -10 - mainBonus);
        target:addMod(MOD_WHITE_MAGIC_CAST, -10 - mainBonus);
        target:addMod(MOD_WHITE_MAGIC_RECAST, -10 - mainBonus);
        target:addMod(MOD_BLACK_MAGIC_COST, 20 + mainBonus);
        target:addMod(MOD_BLACK_MAGIC_CAST, 20 + mainBonus);
        target:addMod(MOD_BLACK_MAGIC_RECAST, 20 + mainBonus);
--        target:addMod(MOD_LIGHT_ARTS_REGEN, regen);
--        target:addMod(MOD_REGEN_DURATION, regen*2);
    end
    target:recalculateSkillsTable();
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
    target:recalculateAbilitiesTable();
    local bonus = effect:getPower();
    local regen = effect:getSubPower();
    local mainBonus = 0;
    if (target:getMainJob() == JOBS.SCH) then mainBonus = 10; end;

    target:delMod(MOD_WHITE_MAGIC_COST, -bonus);
    target:delMod(MOD_WHITE_MAGIC_CAST, -bonus);
    target:delMod(MOD_WHITE_MAGIC_RECAST, -bonus);
    
    if not (target:hasStatusEffect(EFFECT_TABULA_RASA)) then
        target:delMod(MOD_WHITE_MAGIC_COST, -10 - mainBonus);
        target:delMod(MOD_WHITE_MAGIC_CAST, -10 - mainBonus);
        target:delMod(MOD_WHITE_MAGIC_RECAST, -10 - mainBonus);
        target:delMod(MOD_BLACK_MAGIC_COST, 20 + mainBonus);
        target:delMod(MOD_BLACK_MAGIC_CAST, 20 + mainBonus);
        target:delMod(MOD_BLACK_MAGIC_RECAST, 20 + mainBonus);
        target:delMod(MOD_LIGHT_ARTS_REGEN, regen);
        target:delMod(MOD_REGEN_DURATION, regen*2);
    end    
    target:recalculateSkillsTable();
end;