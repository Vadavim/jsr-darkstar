-----------------------------------------
-- Spell: Army's Paeon V
-- Gradually restores target's HP.
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return checkPaeon(caster, 5);
end;

function onSpellCast(caster,target,spell)
    return doPaeon(caster, target, spell, 5);
end;
