-----------------------------------------
-- Spell: Hydro Shot
-- Additional effect: Enmity Down. Chance of effect varies with TP
-- Spell cost: 55 MP
-- Monster Type: Beastmen
-- Spell Type: Physical (Blunt)
-- Blue Magic Points: 3
-- Stat Bonus: MND+2
-- Level: 63
-- Casting Time: 0.5 seconds
-- Recast Time: 26 seconds
-- Skillchain Element(s): Water (can open Impaction and Induration; can close Reverberation and Fragmentation)
-- Combos: Rapid Shot
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
        params.tpmod = TPMOD_CHANCE;
        params.dmgtype = DMGTYPE_H2H;
        params.scattr = SC_REVERBERATION;
        params.numhits = 1;
        params.multiplier = 1.8;
        params.tp150 = 3;
        params.tp300 = 4.5;
        params.azuretp = 1.25;
        params.dbonus = 20;
        params.duppercap = 75;
        params.str_wsc = 0.0;
        params.dex_wsc = 0.0;
        params.vit_wsc = 0.0;
        params.agi_wsc = 0.4;
        params.int_wsc = 0.4;
        params.mnd_wsc = 0.0;
        params.chr_wsc = 0.0;
--        params.enmityMult = 0.5;
    damage = BluePhysicalSpell(caster, target, spell, params);
    local mParams = {}; mParams.bonusmab = 0; mParams.includemab = true;
    damage = addBonusesAbility(caster, ELE_WATER, target, damage, mParams, 1.0);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);

    local resist = applyResistance(caster,spell,target,30,BLUE_SKILL);
    if (target:isMob()) then
        local enmityShed = 15 * resist;
        target:lowerEnmity(caster, enmityShed);
    end

--   -- Changed to Drown
--    local chance = math.random();
--    if (chance < 0.95 and target:getStatusEffect(EFFECT_DROWN) == nil) then
--        local DOT = (caster:getMainLvl()/5) + 6;
--        target:addStatusEffect(EFFECT_DROWN,DOT, 3, 60,FLAG_ERASBLE);
--    end


    return damage;
end;
