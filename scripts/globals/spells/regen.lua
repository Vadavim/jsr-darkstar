-----------------------------------------
-- Spell: Regen
-- Gradually restores target's HP.
-----------------------------------------
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
    
    local hp = math.ceil(5 * (1 + 0.01 * caster:getMod(MOD_REGEN_MULTIPLIER))); -- spell base times gear multipliers
    hp = hp + caster:getMerit(MERIT_REGEN_EFFECT); -- bonus hp from merits
    hp = hp + caster:getMod(MOD_LIGHT_ARTS_REGEN); -- bonus hp from light arts
    
    local duration = 75 + caster:getMod(MOD_REGEN_DURATION);

    if (caster:hasStatusEffect(EFFECT_COMPOSURE) == true and caster:getID() == target:getID()) then
        duration = duration * 3;
    end

    duration = calculateDurationForLvl(duration, 21, target:getMainLvl());

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

    if (caster:isMob()) then
        hp = hp  * 2.5;
    end

    if (caster:hasStatusEffect(EFFECT_PERPETUANCE)) then
        duration = duration * 2;
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