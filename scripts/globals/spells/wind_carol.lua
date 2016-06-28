-----------------------------------------
-- Spell: Wind Carol
-- Increases wind resistance for party members within the area of effect.
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
    return doCarol(caster, target, spell, ELE_WIND);
end;
