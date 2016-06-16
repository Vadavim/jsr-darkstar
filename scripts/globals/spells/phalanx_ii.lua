-----------------------------------------
--  Spell: PHALANX
-- caster:getMerit() returns a value which is equal to the number of merit points TIMES the value of each point
-- Phalanx II value per point is '3' This is a constant set in the table 'merits'
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
    local enhskill = caster:getSkillLevel(ENHANCING_MAGIC_SKILL);
    local final = 0;
    local merits = caster:getMerit(MERIT_PHALANX_II);

    local duration = 90 + (10 * merits);

    if (caster:hasStatusEffect(EFFECT_COMPOSURE) == true and caster:getID() == target:getID()) then
        duration = duration * 3;
    end

    final = (enhskill / 25) + merits + 1;

    if ((caster:getID() == target:getID()) and target:getEffectsCount(EFFECT_TELLUS >= 1)) then
        final = final * 1.25;
    end

    final, duration = applyEmbolden(caster, final, duration);

    if (target:addStatusEffect(EFFECT_PHALANX,final,0,duration)) then
        spell:setMsg(230);
    else
        spell:setMsg(75);
    end

    if (target:addStatusEffect(EFFECT_PHALANX,final,0,duration)) then
        spell:setMsg(230);
    else
        spell:setMsg(75);
    end

    return EFFECT_PHALANX;
end;
