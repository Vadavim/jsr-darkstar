-----------------------------------------
-- Spell: Queasyshroom
-- Additional effect: Poison. Duration of effect varies with TP
-- Spell cost: 20 MP
-- Monster Type: Plantoids
-- Spell Type: Physical (Piercing)
-- Blue Magic Points: 2
-- Stat Bonus: HP-5, MP+5
-- Level: 8
-- Casting Time: 2 seconds
-- Recast Time: 15 seconds
-- Skillchain Element(s): Dark (can open Transfixion or Detonation; can close Compression or Gravitation)
-- Combos: None
-----------------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/bluemagic");
require("scripts/globals/weaponskills");

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
        params.dmgtype = DMGTYPE_PIERCE;
        params.scattr = SC_DARK;
        params.numhits = 1;
    params.multiplier = 1.5;
        params.tp150 = 1.25;
        params.tp300 = 1.25;
        params.azuretp = 1.25;
        params.duppercap = 22;
        params.str_wsc = 0.0;
        params.dex_wsc = 0.0;
        params.vit_wsc = 0.0;
        params.agi_wsc = 0.4;
        params.int_wsc = 0.0;
        params.mnd_wsc = 0.0;
        params.chr_wsc = 0.0;
    local poisonMult = 1;
    if (caster:hasStatusEffect(EFFECT_CHAIN_AFFINITY)) then
        poisonMult = fTP(caster:getTP() + caster:getMod(MOD_TP_BONUS), 1, 3, 6);
    end

    damage = BluePhysicalSpell(caster, target, spell, params);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);

    local resist = applyResistance(caster,spell,target,60,BLUE_SKILL);
    if (resist >= 0.25 and damage > 0) then
        local power = 1 + caster:getMainLvl()/4;
        local typeEffect = EFFECT_POISON;
        if (power > 12) then
            power = 12;
        end
        power = poisonMult * power * (1 + 0.25 * getSystemBonus(caster,target,spell));
        target:delStatusEffectSilent(typeEffect);
        target:addStatusEffect(typeEffect,power,0,90 * resist);
        target:setPendingMessage(277, EFFECT_POISON);
    end
    
    return damage;
end;
