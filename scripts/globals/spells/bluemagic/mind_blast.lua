-----------------------------------------
-- Spell: Mind Blast
-- Deals lightning damage to an enemy. Additional effect: Paralysis
-- Spell cost: 82 MP
-- Monster Type: Demons
-- Spell Type: Magical (Lightning)
-- Blue Magic Points: 4
-- Stat Bonus: MP+5 MND+1
-- Level: 73
-- Casting Time: 3 seconds
-- Recast Time: 30 seconds
-- Magic Bursts on: Impaction, Fragmentation, and Light
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

    local resist = applyResistanceEffect(caster,spell,target,caster:getStat(MOD_MND) - target:getStat(MOD_MND),BLUE_SKILL,20, EFFECT_PARALYSIS);
    local multi = 1.35;
    local params = {};
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
        params.multiplier = multi;
        params.tMultiplier = 5;
        params.duppercap = 69;
        params.str_wsc = 0.0;
        params.dex_wsc = 0.0;
        params.vit_wsc = 0.0;
        params.agi_wsc = 0.0;
        params.int_wsc = 0.0;
        params.mnd_wsc = 0.5;
        params.chr_wsc = 0.0;
    damage = BlueMagicalSpell(caster, target, spell, params, MND_BASED);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);
    

    if (damage > 0 and resist >= 0.25) then
        local power = 25 + getSystemBonus(caster,target,spell) * 5;
        target:addStatusEffect(EFFECT_PARALYSIS,power,0,60 * resist);
        target:addStatusEffect(EFFECT_MND_DOWN,power,0,60 * resist);
        target:setPendingMessage(277, EFFECT_PARALYSIS);
        target:setPendingMessage(278, EFFECT_MND_DOWN);
    end

    return damage;
end;