-----------------------------------------
-- Spell: Pollen
-- Restores HP
-- Spell cost: 8 MP
-- Monster Type: Vermin
-- Spell Type: Magical (Light)
-- Blue Magic Points: 1
-- Stat Bonus: CHR+1, HP+5
-- Level: 1
-- Casting Time: 2 seconds
-- Recast Time: 5 seconds
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

    local power = 12 + blue * 0.3 + vit * 0.25 + mnd * 0.5;
    if (power > 45) then power = 45 + (power - 45) / 3 end;
    power = power * (1 + caster:getMod(MOD_CURE_POTENCY) / 100) * (1 + target:getMod(MOD_CURE_POTENCY_RCVD) / 100);
    if (caster:getSubJob() == JOBS.SCH) then healing = healing / 3 end;
    power = power + healing * 0.15;
    if (caster:isMob()) then
        power = power * 3;
    end

    power = getCureFinal(caster, spell, power, 15, true);

    local diff = (target:getMaxHP() - target:getHP());
    if (power > diff) then
        power = diff;
    end
    target:addHP(power);

    if (target:getAllegiance() == caster:getAllegiance() and (target:getObjType() == TYPE_PC or target:getObjType() == TYPE_MOB)) then
        caster:updateEnmityFromCure(target,power);
    end
    spell:setMsg(7);

    return power;
end;