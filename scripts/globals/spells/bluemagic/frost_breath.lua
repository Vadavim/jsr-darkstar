-----------------------------------------
-- Spell: Frost Breath
-- Deals ice damage to enemies within a fan-shaped area originating from the caster. Additional effect: Paralysis
-- Spell cost: 136 MP
-- Monster Type: Lizards
-- Spell Type: Magical (Ice)
-- Blue Magic Points: 3
-- Stat Bonus: INT-2
-- Level: 66
-- Casting Time: 6.5 seconds
-- Recast Time: 42.75 seconds
-- Magic Bursts on: Induration, Distortion, and Darkness
-- Combos: Conserve MP
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

    local multi = 1.8;
    local resist = applyResistance(caster,spell,target,caster:getStat(MOD_VIT) - target:getStat(MOD_VIT),BLUE_SKILL,1.0);
    local params = {};
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
        params.multiplier = multi;
        params.tMultiplier = 4.5;
        params.duppercap = 75;
        params.dbonus = 90;
        params.str_wsc = 0.0;
        params.dex_wsc = 0.0;
        params.vit_wsc = 0.5;
        params.agi_wsc = 0.0;
        params.int_wsc = 0.0;
        params.mnd_wsc = 0.0;
        params.chr_wsc = 0.0;
    damage = BlueMagicalSpell(caster, target, spell, params, VIT_BASED) * breathFactor(caster);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);
    
    if (caster:hasStatusEffect(EFFECT_AZURE_LORE)) then
        multi = multi + 0.50;
    end

    if (damage > 0 and resist >= 0.5) then
        target:delStatusEffect(EFFECT_PARALYSIS);
        target:addStatusEffect(EFFECT_PARALYSIS,20 + getSystemBonus(caster,target,spell) * 5,0,120 * resist);
        target:setPendingMessage(277, EFFECT_PARALYSIS);
    end
    
    return damage;
end;
