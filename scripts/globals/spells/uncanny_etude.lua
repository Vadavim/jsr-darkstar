-----------------------------------------
-- Spell: Uncanny Etude
-- Static DEX Boost, BRD 72
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return checkEtude(caster, 2);
end;

function onSpellCast(caster,target,spell)
    return doEtude(caster, target, spell, MOD_DEX, 2);
end;
