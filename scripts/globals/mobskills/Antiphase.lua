---------------------------------------------
--  Antiphase
--
--  Description: Silence Area of Effect (15.0')
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
    local typeEffect = EFFECT_SILENCE;
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local tp = skill:getTP();
    mob:lowerEnmity(target, 15 + hard * 5);

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 1, 0, duration, MOD_MND));
    enmityStatusCheck(target, mob, skill, 15 + hard * 5);

    if (hard > 0) then
        local success = MobRoarMove(mob, target, EFFECT_AMNESIA, 1, 0, duration, MOD_MND);
        if (success == 242) then
            target:setPendingMessage(277, EFFECT_AMNESIA);
        end
    end



    return typeEffect;
end;
