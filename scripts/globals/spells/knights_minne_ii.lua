-----------------------------------------
-- Spell: Knight's Minne II
-- Grants Defense bonus to all allies.
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
    return doMinne(caster, target, spell, 2);
end;
