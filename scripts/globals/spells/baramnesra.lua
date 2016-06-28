-----------------------------------------
-- Spell: Baramnesra
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
    return doBarStatus(caster, target, spell, EFFECT_BARAMNESIA);
end;

