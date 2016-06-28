-----------------------------------------
-- Spell: Sword Madrigal
-- Gives party members accuracy
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
    return doMadrigal(caster, target, spell, 1);
end;