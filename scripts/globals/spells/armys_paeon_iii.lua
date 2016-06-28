-----------------------------------------
-- Spell: Army's Paeon III
-- Gradually restores target's HP.
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return checkPaeon(caster, 3);
end;

function onSpellCast(caster,target,spell)
    return doPaeon(caster, target, spell, 3);
end;
