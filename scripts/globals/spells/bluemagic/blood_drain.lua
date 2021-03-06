-----------------------------------------
-- Spell: Blood Drain
-- Steals an enemy's HP. Ineffective against undead
-- Spell cost: 10 MP
-- Monster Type: Giant Bats
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 2
-- Stat Bonus: HP-5, MP+5
-- Level: 20
-- Casting Time: 4 seconds
-- Recast Time: 90 seconds
-- Magic Bursts on: Compression, Gravitation, Darkness
-- Combos: None
-----------------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/settings");
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

    local dmg = 8 + (0.5 * (caster:getSkillLevel(BLUE_SKILL)) + caster:getMod(1 + BLUE_SKILL));
    local resist = applyResistance(caster,spell,target,caster:getStat(MOD_INT)-target:getStat(MOD_INT),BLUE_SKILL,20);
    dmg = dmg * (1 +  caster:getMod(MOD_ENH_DRAIN_ASPIR) / 100);
    dmg = dmg*resist;
    dmg = addBonuses(caster,spell,target,dmg);
    dmg = adjustForTarget(target,dmg,spell:getElement());
    if (dmg > (caster:getSkillLevel(BLUE_SKILL) + 40)) then
        dmg = (caster:getSkillLevel(BLUE_SKILL) + 40);
    end

    if (target:getFamily() == 172 or target:getFamily() == 369) then dmg = dmg * 1.5; end;
    if (dmg < 0) then
        dmg = 0
    end
    
    if (target:isUndead()) then
        spell:setMsg(75); 
        return dmg;
    end

    if (target:getHP() < dmg) then
        dmg = target:getHP();
    end

    dmg = BlueFinalAdjustments(caster,target,spell,dmg, {});
    caster:addHP(dmg);
    
    return dmg;
end;
