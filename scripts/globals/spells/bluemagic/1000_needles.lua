-----------------------------------------
-- Spell: 1000 Needles
-- Shoots multiple needles at enemies within range
-- Spell cost: 350 MP
-- Monster Type: Plantoid
-- Spell Type: Magical (Light)
-- Blue Magic Points: 5
-- Stat Bonus: VIT+3, AGI+3
-- Level: 62
-- Casting Time: 12 seconds
-- Recast Time: 120 seconds
-- Bursts on Light; affects accuracy only
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
        
    local damage = 1000;
   
    return damage;
end;
