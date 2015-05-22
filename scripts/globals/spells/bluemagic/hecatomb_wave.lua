-----------------------------------------
-- Spell: Hecatomb Wave
-- Deals wind damage to enemies within a fan-shaped area originating from the caster. Additional effect: Blindness
-- Spell cost: 116 MP
-- Monster Type: Demons
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 3
-- Stat Bonus: AGI+1
-- Level: 54
-- Casting Time: 5.25 seconds
-- Recast Time: 33.75 seconds
-- Magic Bursts on: Detonation, Fragmentation, Light
-- Combos: Max MP Boost
-----------------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");
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
    
    local resist = applyResistance(caster,spell,target,caster:getStat(MOD_VIT) - target:getStat(MOD_VIT),BLUE_SKILL,1.0);
    local params = {};
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage    
        params.multiplier = 3.8;
        params.tMultiplier = 1.5;
        params.duppercap = 55;
        params.str_wsc = 0.0;
        params.dex_wsc = 0.0;
        params.vit_wsc = 1.0;
        params.agi_wsc = 0.0;
        params.int_wsc = 0.0;
        params.mnd_wsc = 0.0;
        params.chr_wsc = 0.0;
    damage = BlueMagicalSpell(caster, target, spell, params, VIT_BASED);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);

    if(damage > 0 and resist > 0.125) then
        local typeEffect = EFFECT_BLINDNESS;
        target:delStatusEffect(typeEffect);
        target:addStatusEffect(typeEffect,25,0,getBlueEffectDuration(caster,resist,typeEffect));
    end
    
    return damage;
end;    
