-----------------------------------------
-- Spell: Poison Breath
-- Deals water damage to enemies within a fan-shaped area originating from the caster. Additional effect: Poison
-- Spell cost: 22 MP
-- Monster Type: Hound
-- Spell Type: Magical (Water)
-- Blue Magic Points: 1
-- Stat Bonus: MND+1
-- Level: 22
-- Casting Time: 3 seconds
-- Recast Time: 19.5 seconds
-- Magic Bursts on: Reverberation, Distortion, and Darkness
-- Combos: Clear Mind
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
    local multi = 1.8;
    local params = {};
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
        params.multiplier = multi;
        params.tMultiplier = 1.5;
        params.duppercap = 33;
        params.dbonus = 0;
        params.str_wsc = 0.0;
        params.dex_wsc = 0.0;
        params.vit_wsc = 0.25;
        params.agi_wsc = 0.0;
        params.int_wsc = 0.0;
        params.mnd_wsc = 0.0;
        params.chr_wsc = 0.0;
    damage = BlueMagicalSpell(caster, target, spell, params, VIT_BASED) * breathFactor(caster);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);
    
    if(caster:hasStatusEffect(EFFECT_AZURE_LORE)) then
        multi = multi + 0.50;
    end

    if(damage > 0 and resist >= 0.25 and not target:hasStatusEffect(EFFECT_POISON)) then
        local typeEffect = EFFECT_POISON;
        local power = 1 + caster:getMainLvl()/4;
        if (power > 10) then
            power = 10;
        end
        power = power * (1 + 0.25 * getSystemBonus(caster,target,spell));
        target:addStatusEffect(typeEffect,power,0,120 * resist);
        target:setPendingMessage(277, EFFECT_POISON);
    end
    
    return damage;
end;
