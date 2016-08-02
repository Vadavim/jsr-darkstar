-----------------------------------------
-- Spell: Lowing
-- Gives enemies within range a powerful disease that prevents recovery of HP and MP
-- Spell cost: 66 MP
-- Monster Type: Beasts
-- Spell Type: Magical (Fire)
-- Blue Magic Points: 2
-- Stat Bonus: HP-5
-- Level: 71
-- Casting Time: 7 seconds
-- Recast Time: 56 seconds
-- Magic Bursts on: Liquefaction, Fusion, and Light
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

    local typeEffect = EFFECT_PLAGUE;
    local dINT = caster:getStat(MOD_MND) - target:getStat(MOD_MND);
    local resist = applyResistanceEffect(caster,spell,target,dINT,BLUE_SKILL, 50, EFFECT_DISEASE);
    local duration = 120 * resist;
    local power = 6 + getSystemBonus(caster,target,spell) * 2;
    
    if (resist >= 0.25) then -- Do it!
        if (target:addStatusEffect(typeEffect,power,0,duration * resist)) then
            spell:setMsg(236);
        else
            spell:setMsg(75);
        end
    else
        spell:setMsg(85);
    end;

    return typeEffect; 
end;
