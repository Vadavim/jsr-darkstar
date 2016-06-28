-----------------------------------------
-- Spell: Quick Etude
-- Static AGI Boost, BRD 28
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return checkEtude(caster, 1);
end;

function onSpellCast(caster,target,spell)
    return doEtude(caster, target, spell, MOD_AGI, 1);
end;
