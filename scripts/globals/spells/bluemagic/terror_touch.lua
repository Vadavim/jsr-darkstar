-----------------------------------------
-- Spell: Terror Touch
-- Additional effect: Weakens attacks. Accuracy varies with TP
-- Spell cost: 62 MP
-- Monster Type: Undead
-- Spell Type: Physical (Blunt)
-- Blue Magic Points: 3
-- Stat Bonus: HP-5 MP+10
-- Level: 40
-- Casting Time: 3.25 seconds
-- Recast Time: 21 seconds
-- Duration: 60~ seconds
-- Skillchain Element(s): Dark (Primary) and Water (Secondary) - (can open Transfixion, Detonation, Impaction, or Induration; can close Compression, Reverberation, or Gravitation)
-- Combos: Defense Bonus
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
        params.tpmod = TPMOD_ACC;
        params.dmgtype = DMGTYPE_H2H;
        params.scattr = SC_COMPRESSION;
        params.numhits = 1;
        params.multiplier = 1.8;
        params.tp150 = 2;
        params.tp300 = 2.5;
        params.azuretp = 1.5;
        params.duppercap = 50;
        params.str_wsc = 0.0;
        params.dex_wsc = 0.0;
        params.vit_wsc = 0.0;
        params.agi_wsc = 0.0;
        params.int_wsc = 0.0;
        params.mnd_wsc = 0.0;
        params.chr_wsc = 1;
    local power = 15 + getSystemBonus(caster,target,spell) * 5;
    local duration = 90;
    if (caster:hasStatusEffect(EFFECT_CHAIN_AFFINITY)) then
        power = power + caster:getTP() / 500;
        duration = duration + caster:getTP() / 11.111;
    end

    damage = BluePhysicalSpell(caster, target, spell, params);
    local mParams = {}; mParams.bonusmab = 0; mParams.includemab = true;
    damage = addBonusesAbility(caster, ELE_DARK, target, damage, mParams, 1.0);

    damage = BlueFinalAdjustments(caster, target, spell, damage, params);

    local resist = applyResistance(caster,spell,target,60,BLUE_SKILL);
    if (resist >= 0.25 and damage > 0) then
        target:addStatusEffect(EFFECT_ATTACK_DOWN, power, 0, duration);
        target:setPendingMessage(278, EFFECT_ATTACK_DOWN);
    end

    return damage;
end;
