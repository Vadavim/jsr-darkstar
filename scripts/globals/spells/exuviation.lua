-----------------------------------------
-- Spell: Exuviation
-- Restores HP and removes one detrimental magic effect.
-- Can be used with Diffusion.
-- Shamelessly stolen from http://members.shaw.ca/pizza_steve/cure/Cure_Calculator.html
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local mnd = caster:getStat(MOD_MND);
    local vit = target:getStat(MOD_VIT);
    local blue = caster:getSkillLevel(SKILL_BLU);
    local healing = caster:getSkillLevel(SKILL_HEA);

    local power = 250 + blue * 0.50 + vit * 2.0 + mnd * 0.5;
    if (power > 250) then power = 250 + (power - 250) / 3 end;
    power = power * (1 + caster:getMod(MOD_CURE_POTENCY) / 100) * (1 + target:getMod(MOD_CURE_POTENCY_RCVD) / 100);
    if (caster:getSubJob() == JOBS.SCH) then healing = healing / 2 end;
    power = power + healing * 0.5;
    local erased = caster:eraseStatusEffect();
    if (erased > 0) then
        power = power * 1.33;
    end
    power = getCureFinal(caster, spell, power, 250, true);


    local diff = (target:getMaxHP() - target:getHP());
    if (power > diff) then
        power = diff;
    end
    target:addHP(power);

    if (target:getAllegiance() == caster:getAllegiance() and (target:getObjType() == TYPE_PC or target:getObjType() == TYPE_MOB)) then
        caster:updateEnmityFromCure(target,power);
    end
    return power;
end;