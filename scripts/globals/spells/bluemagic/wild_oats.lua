-----------------------------------------
-- Spell: Wild Oats
-- Additional effect: Vitality Down. Duration of effect varies on TP
-- Spell cost: 9 MP
-- Monster Type: Plantoids
-- Spell Type: Physical (Piercing)
-- Blue Magic Points: 3
-- Stat Bonus: CHR+1, HP+10
-- Level: 4
-- Casting Time: 0.5 seconds
-- Recast Time: 7.25 seconds
-- Skillchain Element(s): Light (can open Compression, Reverberation, or Distortion; can close Transfixion)
-- Combos: Beast Killer
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
        params.tpmod = TPMOD_DURATION;
        params.dmgtype = DMGTYPE_PIERCE;
        params.scattr = SC_TRANSFIXION;
        params.numhits = 1;
        params.multiplier = 1.84;
        params.tp150 = 1.84;
        params.tp300 = 1.84;
        params.azuretp = 1.84;
        params.duppercap = 11;
        params.str_wsc = 0.0;
        params.dex_wsc = 0.0;
        params.vit_wsc = 0.0;
        params.agi_wsc = 0.3;
        params.int_wsc = 0.0;
        params.mnd_wsc = 0.0;
        params.chr_wsc = 0.0;
    local duration = 30;
    local power = 15 + getSystemBonus(caster,target,spell);
    if (caster:hasStatusEffect(EFFECT_CHAIN_AFFINITY)) then
        duration = duration + caster:getTP() / 100;
        power = power + caster:getTP() / 100;
    end

    damage = BluePhysicalSpell(caster, target, spell, params);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);




    local resist = applyResistance(caster,spell,target,60,BLUE_SKILL);
    if (damage > 0 and resist >= 0.25) then
        target:addStatusEffect(EFFECT_VIT_DOWN,power,3,duration * resist);
        target:setPendingMessage(278, EFFECT_VIT_DOWN);
    end


    return damage;

end;