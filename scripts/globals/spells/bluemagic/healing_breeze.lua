-----------------------------------------
-- Spell: Healing Breeze
-- Restores HP for party members within area of effect
-- Spell cost: 55 MP
-- Monster Type: Beasts
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 4
-- Stat Bonus: CHR+2, HP+10
-- Level: 16
-- Casting Time: 4.5 seconds
-- Recast Time: 15 seconds
-- 
-- Combos: Auto Regen
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

    local power = 40 + blue * 0.35 + vit * 0.25 + mnd * 0.5;
    if (power > 120) then power = 120 + (power - 120) / 3 end;
    power = power * (1 + master:getMod(MOD_CURE_POTENCY) / 100) * (1 + target:getMod(MOD_CURE_POTENCY_RCVD) / 100);
    if (caster:getSubJob() == JOBS.SCH) then healing = healing / 2 end;
    power = power + healing * 0.25;
    power = getCureFinal(caster, spell, power, 60, true);

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