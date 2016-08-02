-----------------------------------------
-- Spell: Spiral Spin
-- Chance of effect varies with TP. Additional Effect: Accuracy Down
-- Spell cost: 39 MP
-- Monster Type: Vermin
-- Spell Type: Physical (Slashing)
-- Blue Magic Points: 3
-- Stat Bonus: STR+1 HP+5
-- Level: 60
-- Casting Time: 4 seconds
-- Recast Time: 45 seconds
-- Skillchain property: Transfixion (can open Compression, Reverberation, or Distortion)
-- Combos: Plantoid Killer
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
        params.dmgtype = DMGTYPE_SLASH;
        params.scattr = SC_TRANSFIXION;
        params.numhits = 1;
    params.multiplier = 2;
        params.tp150 = 3.5;
        params.tp300 = 5;
        params.azuretp = 1.25;
        params.duppercap = 60;
        params.str_wsc = 0.0;
        params.dex_wsc = 0.0;
        params.vit_wsc = 0.0;
        params.agi_wsc = 0.50;
        params.int_wsc = 0.0;
        params.mnd_wsc = 0.0;
        params.chr_wsc = 0.0;
    damage = BluePhysicalSpell(caster, target, spell, params);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);
   
    local resist = applyResistance(caster,spell,target,caster:getStat(MOD_INT) - target:getStat(MOD_INT),BLUE_SKILL,1.0);
    if (damage > 0 and resist >= 0.25) then
        if (target:canGainStatusEffect(EFFECT_ACCURACY_DOWN)) then
            target:addStatusEffect(EFFECT_ACCURACY_DOWN,20 + getSystemBonus(caster, target, spell) * 5,0,60 * resist);
            target:setPendingMessage(278, EFFECT_ACCURACY_DOWN);
        end
    end


    return damage;
end;
