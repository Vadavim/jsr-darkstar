---------------------------------------------
--  Roar
--
--  Description: Paralyzes targets in an area of effect.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: 10' radial
--  Notes:
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
    if (mob:hasStatusEffect(EFFECT_DROWN) and math.random(0, 100) < 15) then return 0 end;
    if (mob:hasStatusEffect(EFFECT_CHOKE) and math.random(0, 100) < 15) then return 0 end;
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local tp = skill:getTP();
    local duration = 30 * fTP(tp, 1, 1.5, 2) * (1 + hard / 5)
    

    local typeEffect = EFFECT_PARALYSIS;
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 35 + hard, 0, duration, MOD_MND));
    enmityStatusCheck(target, mob, skill, 15 + hard * 5);

    if (hard > 0 and skill:getMsg() == 242) then
        local success2 = MobStatusEffectMove(mob, target, skill, EFFECT_TERROR, 1, 0, 10 + hard * 2, MOD_MND);
        if (success2 == 242) then
            target:setPendingMessage(277, EFFECT_TERROR);
        end
    end


    return typeEffect;
end;
