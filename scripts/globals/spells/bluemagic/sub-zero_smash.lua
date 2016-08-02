-----------------------------------------
-- Spell: Sub-zero Smash
-- Additional Effect: Paralysis. Damage varies with TP
-- Spell cost: 44 MP
-- Monster Type: Aquans
-- Spell Type: Physical (Blunt)
-- Blue Magic Points: 4
-- Stat Bonus: HP+10 VIT+3
-- Level: 72
-- Casting Time: 1 second
-- Recast Time: 30 seconds
-- Skillchain Element(s): Fragmentation-IconFragmentation (can open/close Light-Icon Light with Fusion WSs and spells)
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
        params.tpmod = TPMOD_CRITICAL;
        params.dmgtype = DMGTYPE_BLUNT;
        params.scattr = SC_FRAGMENTATION;
        params.numhits = 1;
        params.multiplier = 2.3;
        params.tp150 = 3.5;
        params.tp300 = 5.5;
        params.azuretp = 1.25;
        params.duppercap = 60;
        params.str_wsc = 0.3;
        params.dex_wsc = 0.0;
        params.vit_wsc = 0.0;
        params.agi_wsc = 0.0;
        params.int_wsc = 0.3;
        params.mnd_wsc = 0.0;
        params.chr_wsc = 0.0;
    damage = BluePhysicalSpell(caster, target, spell, params);
    local mParams = {}; mParams.bonusmab = 0; mParams.includemab = true;
    damage = addBonusesAbility(caster, ELE_ICE, target, damage, mParams, 1.0);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);
   
    local resist = applyResistanceEffect(caster,spell,target,30,BLUE_SKILL, 0, EFFECT_PARALYSIS);
    local duration = (30 + getSystemBonus(caster,target,spell) * 10) * resist;
    local power = 30 + getSystemBonus(caster,target,spell) * 6;
    if (damage > 0 and resist >= 0.25) then
        local typeEffect = EFFECT_PARALYSIS;
        target:delStatusEffectSilent(typeEffect);
        target:addStatusEffect(typeEffect,power,0,duration);
        target:setPendingMessage(277, EFFECT_PARALYSIS);
    end
    
    return damage;
end;
