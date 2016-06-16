-----------------------------------------
-- Spell: Aquaveil
-- Reduces chance of having a spell interrupted.
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)

    target:delStatusEffect(EFFECT_AQUAVEIL);

    -- duration is said to be based on enhancing skill with max 5 minutes, but I could find no
    -- tests that quantify the relationship so I'm using 5 minutes for now.

    local duration = 300;
    local power = AQUAVEIL_COUNTER + caster:getMod(MOD_AQUAVEIL_COUNT);
    if (caster:getSkillLevel(ENHANCING_MAGIC_SKILL) >= 200) then -- cutoff point is estimated. https://www.bg-wiki.com/bg/Aquaveil
        power = power + 1;
    end
    if (power < 1) then -- this shouldn't happen but it's probably best to prevent someone from accidentally underflowing the counter...
        power = 1;
    end;

    if (caster:hasStatusEffect(EFFECT_COMPOSURE) == true and caster:getID() == target:getID()) then
        duration = duration * 3;
    end


    local subPower = 0
    if ((caster:getID() == target:getID()) and target:getEffectsCount(EFFECT_UNDA) >= 1) then
        power = power + 2;
        subPower = 1 + caster:getMainLvl() / 4;
        if (caster:hasStatusEffect(EFFECT_EMBOLDEN)) then
            subPower = subPower * 1.5;
        end
    end
    power, duration = applyEmbolden(caster, power, duration);

    target:addStatusEffect(EFFECT_AQUAVEIL,power,0,duration, 0, subPower);
    spell:setMsg(230);

    return EFFECT_AQUAVEIL;
end;