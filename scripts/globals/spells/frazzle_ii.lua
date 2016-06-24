-----------------------------------------
-- Spell: Distract II
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
    local dMND = (caster:getStat(MOD_INT) - target:getStat(MOD_INT));
    local power = 30;
    local duration = 180 * applyResistanceEffect(caster,spell,target,dMND,35,0,EFFECT_MAGIC_EVASION_DOWN);

    if (duration >= 60) then
        if (target:addStatusEffect(EFFECT_MAGIC_EVASION_DOWN,power,0,duration)) then
            spell:setMsg(236);
        else
            spell:setMsg(75);
        end
    else
        spell:setMsg(85);
    end

    return EFFECT_EVASION_DOWN;
end;
