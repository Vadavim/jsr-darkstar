-----------------------------------------
-- Spell: Light of Penance
-- Reduces an enemy's TP. Additional effect: Blindness and "Bind"
-- Spell cost: 53 MP
-- Monster Type: Beastmen
-- Spell Type: Magical (Light)
-- Blue Magic Points: 5
-- Stat Bonus: CHR+1, HP+15
-- Level: 58
-- Casting Time: 3 seconds
-- Recast Time: 60 seconds
-- Magic Bursts on: Transfixion, Fusion, and Light
-- Combos: Auto Refresh
-----------------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");
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

    local typeEffectOne = EFFECT_BLINDNESS;
    local typeEffectTwo = EFFECT_BIND;
    local resistBlind = applyResistanceEffect(caster,spell,target,caster:getStat(MOD_INT) - target:getStat(MOD_INT),BLUE_SKILL,40, EFFECT_BLINDNESS);
    local resistBind = applyResistanceEffect(caster,spell,target,caster:getStat(MOD_INT) - target:getStat(MOD_INT),BLUE_SKILL,40, EFFECT_BIND);
    local resistTP = applyResistance(caster,spell,target,caster:getStat(MOD_INT) - target:getStat(MOD_INT),BLUE_SKILL,40);
    local duration = 60;
    local power = 500 * resistTP;
    local returnEffect = typeEffectOne;
    if (target:isFacing(caster)) then
        if (resistBlind >= 0.5) then
            target:addStatusEffect(EFFECT_BLINDNESS,35,0,duration * resistBlind);
            target:setPendingMessage(277, EFFECT_BLINDNESS);
        end

        if (resistBind >= 0.5) then
            target:addStatusEffect(typeEffectTwo,1,0,duration * resistBind);
            target:setPendingMessage(277, EFFECT_BIND);
        end

        target:delTP(power);
        spell:setMsg(431); -- tp reduced
    end


    return 0;
end;
