-----------------------------------------
-- Spell: Feather Tickle
-- Reduces an enemy's TP
-- Spell cost: 48 MP
-- Monster Type: Birds
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 3
-- Stat Bonus: AGI+1
-- Level: 64
-- Casting Time: 4 seconds
-- Recast Time: 26 seconds
-- Magic Bursts on: Detonation, Fragmentation, and Light
-- Combos: Clear Mind
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");
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

    local dINT = caster:getStat(MOD_INT) - target:getStat(MOD_INT);
    local resist = applyResistance(caster,spell,target,dINT,BLUE_SKILL, 30);

    if (resist >= 0.5) then
        local effect = target:stealStatusEffect();
        if (effect ~= nil) then
            -- add to myself
            local duration = effect:getDuration();
            if (duration > 300) then duration = 300; end
            caster:addStatusEffect(effect:getType(), effect:getPower(), effect:getTickCount(), duration, 0, effect:getSubPower());
            -- add buff to myself
            spell:setMsg(370);
            return 1;
        end
    end

    return 0;
end;
