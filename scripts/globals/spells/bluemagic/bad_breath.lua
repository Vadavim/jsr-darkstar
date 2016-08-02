-----------------------------------------
-- Spell: Bad Breath
-- Deals earth damage that inflicts multiple status ailments on enemies within a fan-shaped area originating from the caster
-- Spell cost: 212 MP
-- Monster Type: Plantoids
-- Spell Type: Magical (Earth)
-- Blue Magic Points: 5
-- Stat Bonus: INT+2, MND+2
-- Level: 61
-- Casting Time: 8.75 seconds
-- Recast Time: 120 seconds
-- Magic Bursts on: Scission, Gravitation, Darkness
-- Combos: Fast Cast
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
        params.tMultiplier = 5;
        params.duppercap = 75;
        params.dbonus = 0;
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
        target:delStatusEffectSilent(EFFECT_PARALYSIS);
        target:addStatusEffect(EFFECT_PARALYSIS,20 + getSystemBonus(caster,target,spell) * 5,0,90 * resist);
        target:setPendingMessage(277, EFFECT_PARALYSIS);
    end

    resist = applyResistance(caster,spell,target,caster:getStat(MOD_VIT) - target:getStat(MOD_VIT),BLUE_SKILL,1.0);
    if (damage > 0 and resist >= 0.5) then
        target:delStatusEffectSilent(EFFECT_WEIGHT);
        target:addStatusEffect(EFFECT_WEIGHT,50 + getSystemBonus(caster,target,spell) * 15,0,90 * resist);
        target:setPendingMessage(277, EFFECT_WEIGHT);
    end

    resist = applyResistance(caster,spell,target,caster:getStat(MOD_VIT) - target:getStat(MOD_VIT),BLUE_SKILL,1.0);
    if (damage > 0 and resist >= 0.5 and not target:hasStatusEffect(EFFECT_POISON)) then
        target:addStatusEffect(EFFECT_POISON,(1 + caster:getMainLvl() / 5) * (1 + 0.25 * getSystemBonus(caster,target,spell)) ,0,90 * resist);
        target:setPendingMessage(277, EFFECT_POISON);
    end


    resist = applyResistance(caster,spell,target,caster:getStat(MOD_VIT) - target:getStat(MOD_VIT),BLUE_SKILL,1.0);
    if (damage > 0 and resist >= 0.5 and not target:hasStatusEffect(EFFECT_SLOW)) then
        target:addStatusEffect(EFFECT_SLOW,190 + getSystemBonus(caster,target,spell) * 50,0,getBlueEffectDuration(caster,resist,typeEffect));
        target:setPendingMessage(277, EFFECT_SLOW);
    end

    resist = applyResistance(caster,spell,target,caster:getStat(MOD_VIT) - target:getStat(MOD_VIT),BLUE_SKILL,1.0);
    if (damage > 0 and resist >= 0.5) then
        target:delStatusEffectSilent(EFFECT_SILENCE);
        target:addStatusEffect(EFFECT_SILENCE,1,0,(90 + getSystemBonus(caster,target,spell) * 30) * resist);
        target:setPendingMessage(277, EFFECT_SILENCE);
    end

    resist = applyResistance(caster,spell,target,caster:getStat(MOD_VIT) - target:getStat(MOD_VIT),BLUE_SKILL,1.0);
    if (damage > 0 and resist >= 0.5) then
        target:delStatusEffectSilent(EFFECT_PETRIFICATION);
        target:addStatusEffect(EFFECT_PETRIFICATION,1,0,(4 + getSystemBonus(caster,target,spell) * 2   ) * resist);
        target:setPendingMessage(277, EFFECT_PETRIFICATION);
    end

    resist = applyResistance(caster,spell,target,caster:getStat(MOD_VIT) - target:getStat(MOD_VIT),BLUE_SKILL,1.0);
        if (damage > 0 and resist >= 0.5) then
        target:delStatusEffectSilent(EFFECT_BLINDNESS);
        target:addStatusEffect(EFFECT_BLINDNESS,20 + getSystemBonus(caster,target,spell) * 5,0,90 * resist);
        target:setPendingMessage(277, EFFECT_BLINDNESS);
    end
    
    return damage;

end;
