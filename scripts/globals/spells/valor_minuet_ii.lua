-----------------------------------------
-- Spell: Valor Minuet II
-- Grants Attack bonus to all allies.
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
    return doMinuet(caster, target, spell, 2);
end;
