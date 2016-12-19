-----------------------------------------
-- Spell: Regen III
-- Gradually restores target's HP.
-----------------------------------------
-- Cleric's Briault enhances the effect
-- Scale down duration based on level
-- Composure increases duration 3x
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)

    local hp = 25;
    local meritBonus = caster:getMerit(MERIT_REGEN_EFFECT);

    --printf("Regen III: Merit Bonus = Extra +%d", meritBonus);    

    local body = caster:getEquipID(SLOT_BODY);
    if (body == 15089 or body == 14502) then
        hp = hp+3;
    end

    hp = hp + caster:getMod(MOD_REGEN_EFFECT) + meritBonus;

    local duration = 60;

    duration = duration + caster:getMod(MOD_REGEN_DURATION);

    duration = calculateDurationForLvl(duration, 66, target:getMainLvl());

    if (target:hasStatusEffect(EFFECT_REGEN) and target:getStatusEffect(EFFECT_REGEN):getTier() == 1) then
        target:delStatusEffect(EFFECT_REGEN);
    end


    if (caster:hasStatusEffect(EFFECT_LIGHT_ARTS) and caster:getMainJob() == JOBS.SCH) then
        hp = hp * 1.33;
        duration = duration * 1.2;
    end

    if (caster:hasStatusEffect(EFFECT_DIVINE_SEAL)) then
        hp = hp * 2;
    end

    if (caster:hasStatusEffect(EFFECT_RAPTURE)) then
        hp = hp * 1.5;
    end

    if (caster:hasStatusEffect(EFFECT_PERPETUANCE)) then
        duration = duration * 2;
    end

    if (caster:isMob()) then
        hp = hp * 2.5;
    end

    local subPower = 0
    if ((caster:getID() == target:getID()) and target:getEffectsCount(EFFECT_LUX) >= 1) then
        hp = hp * 1.25;
        duration = duration * 1.33;
        subPower = 10;
    end
    hp = hp * (1  + target:getMod(MOD_CURE_POTENCY_RCVD) / 100);
    hp, duration = applyEmbolden(caster, hp, duration);




    if (target:addStatusEffect(EFFECT_REGEN,hp,3,duration,0,subPower,0)) then
        spell:setMsg(230);
    else
        spell:setMsg(75); -- no effect
    end

    return EFFECT_REGEN;
end;