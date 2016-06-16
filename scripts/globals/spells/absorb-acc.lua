--------------------------------------
--     Spell: Absorb-ACC
--     Steals an enemy's accuracy.
--------------------------------------

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

    if (caster:hasStatusEffect(EFFECT_ACCURACY_BOOST)) then
        spell:setMsg(75); -- no effect
    else
        local dINT = caster:getStat(MOD_INT) - target:getStat(MOD_INT);
        local resist = applyResistance(caster,spell,target,dINT,37,0);
        local power = 20;
        local duration = 90;
        local void = caster:getStatusEffect(EFFECT_NETHER_VOID);
        if (void ~= nil) then
            power = power * (1 + void:getPower() / 100);
        end

        if (resist <= 0.125) then
            spell:setMsg(85);
        else
            spell:setMsg(533);
            caster:addStatusEffect(EFFECT_ACCURACY_BOOST,power*resist*((100+(caster:getMod(MOD_AUGMENTS_ABSORB)))/100), 0, duration,FLAG_DISPELABLE); -- caster gains ACC
            target:addStatusEffect(EFFECT_ACCURACY_DOWN,power*resist*((100+(caster:getMod(MOD_AUGMENTS_ABSORB)))/100), 0, duration,FLAG_ERASBLE);    -- target loses ACC
        end
    end
    return EFFECT_ACCURACY_BOOST;
end;