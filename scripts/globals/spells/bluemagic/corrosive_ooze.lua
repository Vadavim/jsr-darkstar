-----------------------------------------
-- Spell: Corrosive Ooze
-- Deals water damage to an enemy. Additional Effect: Attack Down and Defense Down
-- Spell cost: 55 MP
-- Monster Type: Amorphs
-- Spell Type: Magical (Water)
-- Blue Magic Points: 4
-- Stat Bonus: HP-10 MP+10
-- Level: 66
-- Casting Time: 5 seconds
-- Recast Time: 30 seconds
-- 
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
    local multi = 1;
    if (caster:hasStatusEffect(EFFECT_AZURE_LORE)) then
        multi = multi + 0.50;
    end
        params.multiplier = multi;
        params.tMultiplier = 4.0;
        params.duppercap = 75;
        params.str_wsc = 0.0;
        params.dex_wsc = 0.0;
        params.vit_wsc = 0.0;
        params.agi_wsc = 0.0;
        params.int_wsc = 0.1;
        params.mnd_wsc = 0.0;
        params.chr_wsc = 0.0;
        params.enmityMult = 0.25;
    damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);

    local resist = applyResistance(caster,spell,target,caster:getStat(MOD_INT) - target:getStat(MOD_INT),BLUE_SKILL,1.0);
    local duration = 60;

    if (damage > 0 and resist >= 0.25) then
        local power = 10 + getSystemBonus(caster,target, spell) * 3;
        if (not target:hasStatusEffect(EFFECT_ATTACK_DOWN)) then
            target:addStatusEffect(EFFECT_ATTACK_DOWN,power,0,duration * resist);
            target:setPendingMessage(278, EFFECT_ATTACK_DOWN);
        end
        if (not target:hasStatusEffect(EFFECT_DEFENSE_DOWN)) then
            target:addStatusEffect(EFFECT_DEFENSE_DOWN,power,0,duration * resist);
            target:setPendingMessage(278, EFFECT_DEFENSE_DOWN);
        end
    end
    
    return damage;
end;