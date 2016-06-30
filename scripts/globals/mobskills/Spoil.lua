---------------------------------------------
--  Spoil
--
--  Description: Lowers the strength of target.
--  Type: Enhancing
--  Utsusemi/Blink absorb: Ignore
--  Range: Self
--  Notes: Very sharp evasion increase.
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


    local typeEffect = EFFECT_STR_DOWN;
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 10, 3, 120));
    enmityStatusCheck(target, mob, skill, 15 + hard * 5);

    if (hard > 0) then
        local success = MobStatusEffectMove(mob, target, EFFECT_PLAGUE, 5, 0, 30 + hard * 15);
        if (success == 242) then
            target:setPendingMessage(277, EFFECT_PLAGUE);
        end
    end



    return typeEffect;
end;
