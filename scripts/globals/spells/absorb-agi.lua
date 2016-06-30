--------------------------------------
--     Spell: Absorb-AGI
--     Steals an enemy's agility.
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
    
    if (target:hasStatusEffect(EFFECT_AGI_DOWN) or caster:hasStatusEffect(EFFECT_AGI_BOOST)) then
        spell:setMsg(75); -- no effect
    else        
        local dINT = caster:getStat(MOD_INT) - target:getStat(MOD_INT);
        local resist = applyResistance(caster,spell,target,dINT,37,0);
        local power = 8 + caster:getSkillLevel(SKILL_DRK) / 20;
        if (target:getFamily() == 172 or target:getFamily() == 369) then power = power * 1.5; end;
        local duration = 180;
        local void = caster:getStatusEffect(EFFECT_NETHER_VOID);
        if (void ~= nil) then
            power = power * (1 + void:getPower() / 100);
            duration = duration * 3;
        end
        if (resist <= 0.125) then
            spell:setMsg(85);
        else
            spell:setMsg(332);
            caster:addStatusEffect(EFFECT_AGI_BOOST,power*resist*((100+(caster:getMod(MOD_AUGMENTS_ABSORB)))/100), 0, duration,FLAG_DISPELABLE); -- caster gains AGI
            target:addStatusEffect(EFFECT_AGI_DOWN,power*resist*((100+(caster:getMod(MOD_AUGMENTS_ABSORB)))/100), 0, duration,FLAG_ERASBLE);    -- target loses AGI
        end
    end
    return EFFECT_AGI_DOWN;
end;