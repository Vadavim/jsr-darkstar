---------------------------------------------
--  Riddle
--
--  Description: Reduces maximum MP in an area of effect.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: 15' radial
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    if (mob:hasStatusEffect(EFFECT_SILENCE) and math.random(0, 100) < 50) then return 0 end;
    if (mob:hasStatusEffect(EFFECT_INT_DOWN) and math.random(0, 100) < 33) then return 0 end;
    if (mob:hasStatusEffect(EFFECT_ADDLE) and math.random(0, 100) < 50) then return 0 end;

    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local duration =  90 * fTP(tp, 1, 1.5, 2) * (1 + hard / 5)

    if (target:hasStatusEffect(EFFECT_ADDLE)) then
        target:addStatusEffect(EFFECT_CHARM_I, 1, 0, 10 + hard * 5);
    end

    local typeEffect = EFFECT_ADDLE;
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 40, 0, duration));

    return typeEffect;
end;
