---------------------------------------------
--  Numbing Noise
--
--  Description: Creates an unsettling sound. Additional effect: Stun
--  Type: Physical
--  Utsusemi/Blink absorb: Ignore
--  Range: 10' cone
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
    local typeEffect = EFFECT_STUN;

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 1, 0, 5));
    if (hard > 0) then
        local success = MobRoarMove(mob, target, EFFECT_PARALYSIS, 20 + hard * 2, 30);
        if (success == 242) then
            target:setPendingMessage(277, EFFECT_PARALYSIS);
        end
    end


    return typeEffect;
end;
