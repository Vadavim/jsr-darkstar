-----------------------------------------
-- Spell: Sinewy Etude
-- Static STR Boost, BRD 24
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
    return doEtude(caster, target, spell, MOD_STR, 1);
end;
