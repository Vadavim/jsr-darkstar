---------------------------------------------
--  Jamming Wave
--
--  Description: Silence Area of Effect (16.0')
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
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
    local typeEffect = EFFECT_SILENCE;
    local duration = 45;
    if (mob:hasStatusEffect(EFFECT_SILENCE)) then duration = duration * 0.5 end;
    if (mob:hasStatusEffect(EFFECT_CHOKE)) then duration = duration * 0.8 end;
    if (mob:hasStatusEffect(EFFECT_DROWN)) then duration = duration * 0.8 end;

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 1, 0, 45));
    enmityStatusCheck(target, mob, skill, 15 + hard * 5);
    if (hard > 0) then
        local success = MobStatusEffectMove(mob, target, EFFECT_AMNESIA, 1, 0, duration / 2);
        if (success == 242) then
            target:setPendingMessage(277, EFFECT_AMNESIA);
        end
    end
    return typeEffect;
end;
