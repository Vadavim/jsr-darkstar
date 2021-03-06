-----------------------------------------
-- Spell: Uppercut
-- Damage varies with TP
-- Spell cost: 31 MP
-- Monster Type: Plantoids
-- Spell Type: Physical (Blunt)
-- Blue Magic Points: 3
-- Stat Bonus: STR+2, DEX+1
-- Level: 38
-- Casting Time: 0.5 seconds
-- Recast Time: 17.75 seconds
-- Skillchain Element(s): Fire (Primary) and Lightning (Secondary) - (can open Scission, Detonation, Liquefaction, or Fusion; can close Liquefaction, Impaction, or Fusion)
-- Combos: Attack Bonus
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
        params.dmgtype = DMGTYPE_H2H;
        params.scattr = SC_LIQUEFACTION;
        params.scattr2 = SC_IMPACTION;
        params.numhits = 1;
        params.multiplier = 1.55;
        params.tp150 = 2.5;
        params.tp300 = 3.5;
        params.azuretp = 1.5;
        params.duppercap = 50;
        params.dbonus = 34;
        params.str_wsc = 0.45;
        params.dex_wsc = 0.0;
        params.vit_wsc = 0.0;
        params.agi_wsc = 0.0;
        params.int_wsc = 0.0;
        params.mnd_wsc = 0.0;
        params.chr_wsc = 0.0;
    damage = BluePhysicalSpell(caster, target, spell, params);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);
    
    -- Missing Knockback
   
    return damage;
end;