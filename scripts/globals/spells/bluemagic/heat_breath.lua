-----------------------------------------
-- Spell: Heat Breath
-- Deals fire damage to enemies within a fan-shaped area originating from the caster
-- Spell cost: 169 MP
-- Monster Type: Beasts
-- Spell Type: Magical (Fire)
-- Blue Magic Points: 4
-- Stat Bonus: STR+3
-- Level: 71
-- Casting Time: 7.5 seconds
-- Recast Time: 49 seconds
-- Magic Bursts on: Liquefaction, Fusion, Light
-- Combos: Magic Attack Bonus
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
        params.tMultiplier = 5;
        params.duppercap = 75;
        params.dbonus = 50;
        params.str_wsc = 0.0;
        params.dex_wsc = 0.0;
        params.vit_wsc = 0.55;
        params.agi_wsc = 0.0;
        params.int_wsc = 0.0;
        params.mnd_wsc = 0.0;
        params.chr_wsc = 0.0;
    damage = BlueMagicalSpell(caster, target, spell, params, VIT_BASED) * breathFactor(caster);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);
    
    if (caster:hasStatusEffect(EFFECT_AZURE_LORE)) then
        multi = multi + 0.50;
    end


    if (damage > 0 and resist >= 0.5 and not target:hasStatusEffect(EFFECT_DROWN)) then
        target:delStatusEffect(EFFECT_FROST);
        target:delStatusEffectSilent(EFFECT_BURN);
        target:addStatusEffect(EFFECT_BURN, 15 + caster:getMainLvl() / 5 + getSystemBonus(caster,target,spell) * 10,0,60 * resist);
        target:setPendingMessage(278, EFFECT_BURN);
    end

    return damage;
end;
