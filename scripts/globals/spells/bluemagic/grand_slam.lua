-----------------------------------------
-- Spell: Grand Slam
-- Delivers an area attack. Damage varies with TP
-- Spell cost: 24 MP
-- Monster Type: Beastmen
-- Spell Type: Physical (Blunt)
-- Blue Magic Points: 2
-- Stat Bonus: INT+1
-- Level: 30
-- Casting Time: 1 seconds
-- Recast Time: 14.25 seconds
-- Skillchain Element(s): Ice (can open Impaction, Compression, or Fragmentation; can close Induration)
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
        params.tpmod = TPMOD_ATTACK;
        params.dmgtype = DMGTYPE_BLUNT;
        params.scattr = SC_INDURATION;
        params.numhits = 1;
        params.multiplier = 2.2;
        params.tp150 = 3.3;
        params.tp300 = 4.6;
        params.azuretp = 1.0;
        params.duppercap = 32;
        params.dbonus = 15;
        params.str_wsc = 0.0;
        params.dex_wsc = 0.0;
        params.vit_wsc = 0.6;
        params.agi_wsc = 0.0;
        params.bonusAcc = -10;
        params.int_wsc = 0.0;
        params.mnd_wsc = 0.0;
        params.chr_wsc = 0.0;
    damage = BluePhysicalSpell(caster, target, spell, params);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);
   
    return damage;    
end;
