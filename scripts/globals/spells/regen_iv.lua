-----------------------------------------
-- Spell: Regen IV
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

    local hp = math.ceil(30 * (1 + 0.01 * caster:getMod(MOD_REGEN_MULTIPLIER))); -- spell base times gear multipliers
    hp = hp + caster:getMerit(MERIT_REGEN_EFFECT); -- bonus hp from merits
    hp = hp + caster:getMod(MOD_LIGHT_ARTS_REGEN); -- bonus hp from light arts

    if (caster:isMob()) then
        hp = hp * 2.5;
    end;

    local duration = 60;

    duration = duration + caster:getMod(MOD_REGEN_DURATION);

    duration = calculateDurationForLvl(duration, 86, target:getMainLvl());

    if (target:hasStatusEffect(EFFECT_REGEN) and target:getStatusEffect(EFFECT_REGEN):getTier() == 1) then
        target:delStatusEffect(EFFECT_REGEN);
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