-----------------------------------------
-- Spell: Sheepfoe Mambo
-- Grants evasion bonus to all members.
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
    return doMambo(caster, target, spell, 1);
end;