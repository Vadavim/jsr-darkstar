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
local spellName = "indiRegen";
local baseDegen   = 1;
local degenDivide = 12;

function onMagicCastingCheck(caster,target,spell)
    return checkLuopan(caster, target, spell, spellName);
end

function onSpellCast(caster,target,spell)
    doLuopan(caster, target, spell, "indiRegen", baseDegen, degenDivide);
    return 0;
end;
