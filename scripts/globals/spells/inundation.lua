-----------------------------------------
-- Spell: Distract
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

    -- Pull base stats.
    local dMND = (caster:getStat(MOD_MND) - target:getStat(MOD_MND));
    

    -- Duration, including resistance.  Unconfirmed.
    local resist = applyResistanceEffect(caster,spell,target,dMND,35,0,EFFECT_NONE);
    if (resist >= 0.25) then
        if (target:addStatusEffect(EFFECT_CHAINBOUND,1,0,15)) then
            spell:setMsg(236);
        else
            spell:setMsg(75);
        end
    else
        spell:setMsg(85);
    end



    return EFFECT_NONE;
end;
