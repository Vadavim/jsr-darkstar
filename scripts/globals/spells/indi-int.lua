-----------------------------------------

require("scripts/globals/pets");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

local spellName = "indiInt";
local baseDegen   = 1;
local degenDivide = 12;

function onMagicCastingCheck(caster,target,spell)
    return checkLuopan(caster, target, spell, spellName);
end

function onSpellCast(caster,target,spell)
    doLuopan(caster, target, spell, spellName, baseDegen, degenDivide);
    return 0;
end;
