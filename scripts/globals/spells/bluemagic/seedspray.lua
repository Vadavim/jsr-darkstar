-----------------------------------------
-- Spell: Seedspray
-- Delivers a threefold attack. Additional effect: Weakens defense. Chance of effect varies with TP
-- Spell cost: 61 MP
-- Monster Type: Plantoids
-- Spell Type: Physical (Slashing)
-- Blue Magic Points: 2
-- Stat Bonus: VIT+1
-- Level: 61
-- Casting Time: 4 seconds
-- Recast Time: 35 seconds
-- Skillchain Element(s): Ice (Primary) and Wind (Secondary) - (can open Impaction, Compression, Fragmentation, Scission or Gravitation; can close Induration or Detonation)
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
        params.tpmod = TPMOD_CRITICAL;
        params.dmgtype = DMGTYPE_SLASH;
        params.scattr = SC_GRAVITATION;
        params.numhits = 3;
        params.multiplier = 1.2;
        params.tp150 = 2;
        params.tp300 = 3.2;
        params.azuretp = 1.25;
        params.duppercap = 75;
        params.str_wsc = 0.0;
        params.dex_wsc = 0.0;
        params.vit_wsc = 0.0;
        params.agi_wsc = 0.3;
        params.int_wsc = 0.0;
        params.mnd_wsc = 0.0;
        params.chr_wsc = 0.0;
        params.offcratiomod = MOD_RATT;
    damage = BluePhysicalSpell(caster, target, spell, params);
    local distance = utils.clamp(caster:checkDistance(target), 0, 100);
    printf("distance: %f\n", distance);
    damage = damage * (1 + (distance / 36));
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);
   

    local resist = applyResistance(caster,spell,target,30,BLUE_SKILL);
    if (damage > 0 and resist >= 0.25) then
        local typeEffect = EFFECT_DEFENSE_DOWN;
        target:delStatusEffect(typeEffect);
        target:addStatusEffect(typeEffect,15 + getSystemBonus(caster,target,spell) * 4,0,60 * resist);
        target:setPendingMessage(278, EFFECT_DEFENSE_DOWN);
    end
    
    return damage;
end;