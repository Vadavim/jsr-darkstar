-----------------------------------------
--    Spell: Foil
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
    local duration = 30;
    if (caster:hasStatusEffect(EFFECT_COMPOSURE) == true and caster:getID() == target:getID()) then
        duration = duration * 3;
    end

    local power = 100;
    if (target:getEffectsCount(EFFECT_FLABRA) >= 1) then
        local power = 125;
    end

    power, duration = applyEmbolden(caster, power, duration);

    if (target:addStatusEffect(EFFECT_FOIL,power,0,duration)) then
        spell:setMsg(230);
    else
        spell:setMsg(75);
    end

    return EFFECT_FOIL;
end;