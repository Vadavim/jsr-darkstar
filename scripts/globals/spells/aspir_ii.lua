-----------------------------------------
-- Spell: Aspir
-- Drain functions only on skill level!!
-----------------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)

    local dmg = 10 + 0.575 * (caster:getSkillLevel(DARK_MAGIC_SKILL) + caster:getMod(79 + DARK_MAGIC_SKILL));
    if (target:getFamily() == 172 or target:getFamily() == 369) then dmg = dmg * 1.5; end;
    --get resist multiplier (1x if no resist)
    local resist = applyResistance(caster,spell,target,caster:getStat(MOD_INT)-target:getStat(MOD_INT),DARK_MAGIC_SKILL,1.0);
    --get the resisted damage
    dmg = dmg*resist;
    --add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
    dmg = addBonuses(caster,spell,target,dmg);
    --add in target adjustment
    dmg = adjustForTarget(target,dmg,spell:getElement());
    --add in final adjustments
    local void = caster:getStatusEffect(EFFECT_NETHER_VOID);
    if (void ~= nil) then
        dmg = dmg * (1 + void:getPower() / 100);
    end

    dmg = dmg * (1 +  caster:getMod(MOD_ENH_DRAIN_ASPIR) / 100);

    if (target:getFamily() == 172 or target:getFamily() == 369) then dmg = dmg * 1.5; end;

    if (dmg < 0) then
        dmg = 0
    end

    dmg = dmg * DARK_POWER;

    if (target:isUndead()) then
        spell:setMsg(75); -- No effect
        return dmg;
    end

    if (target:getMP() > dmg) then
        caster:addMP(dmg);
        target:delMP(dmg);
    else
        dmg = target:getMP();
        caster:addMP(dmg);
        target:delMP(dmg);
    end

    return dmg;
end;