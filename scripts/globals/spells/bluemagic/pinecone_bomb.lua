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
        params.duppercap = 45;
        params.dbonus = 10;
        params.str_wsc = 0.0;
        params.dex_wsc = 0.0;
        params.vit_wsc = 0.0;
        params.agi_wsc = 0.4;
        params.int_wsc = 0.0;
        params.mnd_wsc = 0.0;
        params.chr_wsc = 0.0;
    local raspMult = 1;
    if (caster:hasStatusEffect(EFFECT_CHAIN_AFFINITY)) then
        raspMult = BluefTP(blueTP(), 1, 2, 3.5);
    end

    damage = BluePhysicalSpell(caster, target, spell, params);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);

    local resist = applyResistance(caster,spell,target,60,BLUE_SKILL);
    if (resist >= 0.25 and damage > 0) then
        local power = (1 + caster:getMainLvl() / 5) * raspMult * (1 + 0.25 * getSystemBonus(caster,target,spell));
        local duration = (90 + getSystemBonus(caster,target,spell) * 30) * (1 + (raspMult - 1) / 2);

        local mParams = {}; mParams.bonusmab = 0; mParams.includemab = true;
        power = addBonusesAbility(caster, ELE_EARTH, target, power, params, 1.0);

        target:delStatusEffectSilent(EFFECT_RASP);
        target:addStatusEffect(EFFECT_RASP, power, 0, duration * resist);
        target:setPendingMessage(278, EFFECT_RASP);
    end
    
    return damage;
end;
