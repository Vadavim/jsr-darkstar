-----------------------------------------
-- Spell: Awful Eye
-- Lowers Strength of enemies within a fan-shaped area originating from the caster
-- Spell cost: 32 MP
-- Monster Type: Lizards
-- Spell Type: Magical (Water)
-- Blue Magic Points: 2
-- Stat Bonus: MND+1
-- Level: 46
-- Casting Time: 2.5 seconds
-- Recast Time: 60 seconds
-- Magic Bursts on: Reverberation, Distortion, and Darkness
-- Combos: Clear Mind
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/bluemagic");

-----------------------------------------
-- OnMagicCastingCheck
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
    
    local duration = 90;
    local dINT = caster:getStat(MOD_MND) - target:getStat(MOD_MND);
    local resist = applyResistance(caster,spell,target,dINT,37);
    
    if(resist > (0.0652)) then
        -- resisted!
        spell:setMsg(85);
        return 0;
    end

    if(target:hasStatusEffect(EFFECT_STR_DOWN) == true) then
        -- no effect
        spell:setMsg(75);
    else
        target:addStatusEffect(EFFECT_STR_DOWN,20,0,duration);
        spell:setMsg(236);
    end

    return EFFECT_INT_DOWN;
end;
