-----------------------------------------
-- Spell: Banish
-- Deals light damage to an enemy.
-----------------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    --doDivineBanishNuke(V,M,caster,spell,target,hasMultipleTargetReduction,resistBonus)
    local dmg = doDivineBanishNuke(130,3.5,caster,spell,target,false,25);
    if (caster:getMainJob() == JOBS.PLD) then
        caster:addStatusEffect(EFFECT_ENLIGHT, 5 + caster:getMainLvl() / 2.5, 0, 60);
    end
    return dmg;
end;