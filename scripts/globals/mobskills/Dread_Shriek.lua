---------------------------------------------
--  Dread Shriek
--
--  Description: An unsettling shriek paralyzes targets in an area of effect.
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
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local typeEffect = EFFECT_PARALYSIS;
    local duration = 60 + hard * 15;
    if (mob:hasStatusEffect(EFFECT_SILENCE)) then duration = duration * 0.5 end;
    if (mob:hasStatusEffect(EFFECT_CHOKE)) then duration = duration * 0.8 end;
    if (mob:hasStatusEffect(EFFECT_DROWN)) then duration = duration * 0.8 end;

    if (target:hasStatusEffect(EFFECT_PARALYSIS) and hard > 0) then
        target:delHP(target:getHP() * 0.33);
    end

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 25 + hard * 3, 0, duration));
    enmityStatusCheck(target, mob, skill, 15 + hard * 5);

    return typeEffect;
end;
