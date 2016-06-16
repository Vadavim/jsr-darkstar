-----------------------------------------
-- Spell: BARSTONRE
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

    local enhanceSkill = caster:getSkillLevel(ENHANCING_MAGIC_SKILL);
    local power = calculateBarspellPower(caster,enhanceSkill);
    local mdefBonus = caster:getMerit(MERIT_BAR_SPELL_EFFECT) + caster:getMod(MOD_BARSPELL_MDEF_BONUS);
    local duration = 150;

    if (enhanceSkill > 180) then
        duration = 150 + 0.8 * (enhanceSkill - 180);
    end

    if (caster:hasStatusEffect(EFFECT_COMPOSURE) == true and caster:getID() == target:getID()) then
        duration = duration * 3;
    end

    if ((caster:getID() == target:getID()) and target:getEffectsCount(EFFECT_FLABRA) >= 1) then
        power = power * 1.25;
        mdefBonus = mdefBonus + 10;
    end
    power, duration = applyEmbolden(caster, power, duration);

    target:addStatusEffect(EFFECT_BARSTONE,power,0,duration,0,mdefBonus);

    return EFFECT_BARSTONE;
end;
