-----------------------------------------
--  Spell: Poison
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local effect = EFFECT_POISON;

    local duration = 90;

    local pINT = caster:getStat(MOD_INT);
    local mINT = target:getStat(MOD_INT);
--JSR: increased DOT but decreased duration for poison
    local dINT = (pINT - mINT);
    local power = caster:getSkillLevel(ENFEEBLING_MAGIC_SKILL) / 15 + 12;
    if power > 38 then
        power = 38;
    end

    local params = {}; params.bonusmab = 0; params.includemab = true;
    power = addBonusesAbility(caster, ELE_WATER, target, power, params, 1.0);

    local resist = applyResistanceEffect(caster,spell,target,dINT,ENFEEBLING_MAGIC_SKILL,0,effect);
    if (resist == 1 or resist == 0.5) then -- effect taken
        duration = duration * resist;

        if (target:addStatusEffect(effect,power,3,duration)) then
            spell:setMsg(236);
        else
            spell:setMsg(75);
        end

    else -- resist entirely.
        spell:setMsg(85);
    end

    return effect;
end;
