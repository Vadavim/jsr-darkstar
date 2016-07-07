-----------------------------------------
-- Spell: Holy
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
    -- doDivineNuke(V,M,caster,spell,target,hasMultipleTargetReduction,resistBonus)
    local dmg = doDivineNuke(80 + caster:getMainLvl() * 3,4,caster,spell,target,false,35);
    if (caster:getMainJob() == JOBS.PLD) then
        caster:addStatusEffect(EFFECT_ENLIGHT, 5 + caster:getMainLvl() / 1.5, 0, 45);
    end
    return dmg;
end;