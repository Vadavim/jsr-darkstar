-----------------------------------------
-- Spell: Spirited Etude
-- Static MND Boost, BRD 24
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
    return doEtude(caster, target, spell, MOD_MND, 1);
end;
