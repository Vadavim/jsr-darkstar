-----------------------------------------
-- Spell: Maelstrom
-- Deals water damage to enemies within range. Additional effect: STR Down
-- Spell cost: 162 MP
-- Monster Type: Aquans
-- Spell Type: Magical (Water)
-- Blue Magic Points: 5
-- Stat Bonus: Mind +2
-- Level: 61
-- Casting Time: 6 seconds
-- Recast Time: 39 seconds
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

    local params = {};
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
        params.multiplier = 1.5;
        params.tMultiplier = 4;
        params.duppercap = 80;
        params.dbonus = 150;
        params.str_wsc = 0.0;
        params.dex_wsc = 0.0;
        params.vit_wsc = 0.0;
        params.agi_wsc = 0.0;
        params.int_wsc = 0.6;
        params.mnd_wsc = 0.0;
        params.chr_wsc = 0.0;
    damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);
    
    local resist = applyResistance(caster,spell,target,caster:getStat(MOD_INT) - target:getStat(MOD_INT),BLUE_SKILL,60);

    if (damage > 0 and resist > 0.0625) then
        if (target:canGainStatusEffect(EFFECT_STR_DOWN)) then
            target:delStatusEffectSilent(EFFECT_STR_DOWN);
            target:addStatusEffect(EFFECT_STR_DOWN,40 + getSystemBonus(caster,target,spell) * 15,0,60 * resist);
            target:setPendingMessage(278, EFFECT_STR_DOWN);
        end
    end
    
    return damage;
end;
