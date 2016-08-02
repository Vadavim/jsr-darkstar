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

    local typeEffect = EFFECT_STR_DOWN;
    local dINT = caster:getStat(MOD_CHR) - target:getStat(MOD_CHR);
    local resist = applyResistance(caster,spell,target,dINT,BLUE_SKILL, 50);
    local duration = 180 + getSystemBonus(caster,target,spell) * 60;
    local power = (10 + caster:getMainLvl() / 3) * (1 + 0.25 * getSystemBonus(caster, target, spell));

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
