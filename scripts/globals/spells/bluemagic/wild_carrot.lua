-----------------------------------------
-- Spell: Wild Carrot
-- Restores HP for the target party member
-- Spell cost: 37 MP
-- Monster Type: Beasts
-- Spell Type: Magical (Light)
-- Blue Magic Points: 3
-- Stat Bonus: HP+5
-- Level: 30
-- Casting Time: 2.5 seconds
-- Recast Time: 6 seconds
-- 
-- Combos: Resist Sleep
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");

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

    local mnd = caster:getStat(MOD_MND);
    local vit = target:getStat(MOD_VIT);
    local blue = caster:getSkillLevel(SKILL_BLU);
    local healing = caster:getSkillLevel(SKILL_HEA);

    local power = 100 + blue * 0.45 + vit * 0.5 + mnd * 0.75;
    if (power > 220) then power = 220 + (power - 220) / 3 end;
    power = power * (1 + caster:getMod(MOD_CURE_POTENCY) / 100) * (1 + target:getMod(MOD_CURE_POTENCY_RCVD) / 100);
    if (caster:getSubJob() == JOBS.SCH) then healing = healing / 2 end;
    power = power + healing * 0.3;
    power = getCureFinal(caster, spell, power, 130, true);

    local diff = (target:getMaxHP() - target:getHP());
    if (power > diff) then
        power = diff;
    end
    target:addHP(power);

    if (target:getAllegiance() == caster:getAllegiance() and (target:getObjType() == TYPE_PC or target:getObjType() == TYPE_MOB)) then
        caster:updateEnmityFromCure(target,power);
    end
    spell:setMsg(7);

    target:wakeUp();
    return power;
end;
