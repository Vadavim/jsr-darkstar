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
    local dmg = doDivineBanishNuke(350,4.5,caster,spell,target,false,30);
    if (caster:getMainJob() == JOBS.PLD) then
        caster:addStatusEffect(EFFECT_ENLIGHT, 12 + caster:getMainLvl() / 2, 0, 45);
    end
    return dmg;
end;