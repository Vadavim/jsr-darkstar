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
    
    local resist = applyResistance(caster,spell,target,caster:getStat(MOD_VIT) - target:getStat(MOD_VIT),BLUE_SKILL,40);
    local params = {};
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage    
        params.multiplier = 1.8;
        params.tMultiplier = 3.5;
        params.duppercap = 70;
        params.dbonus = 70;
        params.str_wsc = 0.0;
        params.dex_wsc = 0.0;
        params.vit_wsc = 0.40;
        params.agi_wsc = 0.0;
        params.int_wsc = 0.0;
        params.mnd_wsc = 0.0;
        params.chr_wsc = 0.0;
    damage = BlueMagicalSpell(caster, target, spell, params, VIT_BASED) * breathFactor(caster);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);

    if (damage > 0 and resist > 0.125) then
        local typeEffect = EFFECT_BLINDNESS;
        target:delStatusEffectSilent(typeEffect);
        target:addStatusEffect(typeEffect,20 + getSystemBonus(caster,target,spell) * 5,0,90 * resist);
        target:setPendingMessage(277, EFFECT_BLINDNESS);
    end
    
    return damage;
end;    
