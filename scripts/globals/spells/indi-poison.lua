-----------------------------------------
-- Spell: Ifrit
-- Summons Ifrit to fight by your side
-----------------------------------------

require("scripts/globals/pets");
require("scripts/globals/summon");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

local spellName = "indiPoison";
local baseDegen   = 1;
local degenDivide = 18;

function onMagicCastingCheck(caster,target,spell)
    return checkLuopan(caster, target, spell, spellName);
end

function onSpellCast(caster,target,spell)
    doLuopan(caster, target, spell, spellName, baseDegen, degenDivide);
    return 0;
end;
