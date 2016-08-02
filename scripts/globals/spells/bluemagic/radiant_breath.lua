-----------------------------------------
-- Spell: Radiant Breath
-- Deals light damage to enemies within a fan-shaped area of effect originating from the caster. Additional effect: Slow and Silence.
-- Spell cost: 116 MP
-- Monster Type: Wyverns
-- Spell Type: Magical (Light)
-- Blue Magic Points: 4
-- Stat Bonus: CHR+1, HP+5
-- Level: 54
-- Casting Time: 5.25 seconds
-- Recast Time: 33.75 seconds
-- Magic Bursts on: Transfixion, Fusion, Light
-- Combos: None
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

    local params = {};
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    local multi = 1.8;
    if(caster:hasStatusEffect(EFFECT_AZURE_LORE)) then
        multi = multi + 0.50;
    end
        params.multiplier = multi;
        params.tMultiplier = 3.5;
        params.duppercap = 70;
        params.dbonus = 30;
        params.str_wsc = 0.0;
        params.dex_wsc = 0.0;
        params.vit_wsc = 0.4;
        params.agi_wsc = 0.0;
        params.int_wsc = 0.0;
        params.mnd_wsc = 0.0;
        params.chr_wsc = 0.0;
    damage = BlueMagicalSpell(caster, target, spell, params, VIT_BASED) * breathFactor(caster);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);

    local resist = applyResistance(caster,spell,target,caster:getStat(MOD_VIT) - target:getStat(MOD_VIT),BLUE_SKILL,1.0);

    if (damage > 0 and resist >= 0.5) then
        target:delStatusEffectSilent(EFFECT_SLOW);
        target:addStatusEffect(EFFECT_SLOW,225 + getSystemBonus(caster,target,spell) * 50,0,90 * resist);
        target:setPendingMessage(277, EFFECT_SLOW);
    end
    
    if (damage > 0 and resist >= 0.5) then
        target:delStatusEffectSilent(EFFECT_SILENCE);
        target:addStatusEffect(EFFECT_SILENCE,1,0,90 * resist);
        target:setPendingMessage(277, EFFECT_SILENCE);
    end
    
    return damage;
end;
