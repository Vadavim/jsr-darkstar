---------------------------------------------
--  Great Bleat
--
--  Description: Lowers maximum HP of targets in an area of effect.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown radial
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
    local duration = 60 * fTP(tp, 1, 1.5, 2) * (1 + hard / 5)


    local typeEffect = EFFECT_MAX_HP_DOWN;

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 30 + hard * 2, 0, duration, MOD_MND));

    if (hard > 0) then
        local success = MobStatusEffectMove(mob, target, EFFECT_INHIBIT_TP, 15 + hard * 2, 0, duration, MOD_MND);
        if (success == 242) then
            target:setPendingMessage(277, typeEffect);
        end

    end


    enmityStatusCheck(target, mob, skill, 15 + hard * 5);

    return typeEffect;
end;
