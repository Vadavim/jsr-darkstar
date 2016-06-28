-----------------------------------------
-- Spell: Advancing March
-- Gives party members Haste
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
    return doMarch(caster, target, spell, 1);
end;