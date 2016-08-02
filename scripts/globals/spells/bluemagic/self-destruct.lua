-----------------------------------------
-- Spell: Self-Destruct
-- Sacrifices HP to damage enemies within range. Affects caster with Weakness
-- Spell cost: 100 MP
-- Monster Type: Arcana
-- Spell Type: Magical (Fire)
-- Blue Magic Points: 3
-- Stat Bonus: STR+2
-- Level: 50
-- Casting Time: 3.25 seconds
-- Recast Time: 21 seconds
-- Magic Bursts on: Liquefaction, Fusion, and Light
-- Combos: Auto Refresh
-----------------------------------------

require("scripts/globals/settings");
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
    local powerBonus = caster:getHP() / 2;
    caster:delHP(powerBonus);
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    params.multiplier = 1;
    params.tMultiplier = 4;
    params.duppercap = 70;
    params.dbonus = powerBonus * 0.8;
    params.str_wsc = 0.0;
    params.dex_wsc = 0.0;
    params.vit_wsc = 0.0;
    params.agi_wsc = 0.0;
    params.int_wsc = 0.4;
    params.mnd_wsc = 0.0;
    params.chr_wsc = 0.0;
    damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);

--    local playerHP = caster:getHP();
--    local damage =  (playerHP / 2);
--
--
--    if(damage > 0) then
--        target:delHP(damage);
--        caster:setHP(playerHP / 2);
--
--    end
    
    return damage;
end;
