-----------------------------------------
-- Spell: Swift Etude
-- Static AGI Boost, BRD 68
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
    return doEtude(caster, target, spell, MOD_AGI, 2);
end;
