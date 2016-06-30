---------------------------------------------
--  Entangle
--
--  Description: Attempts to bind a single target with vines.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Melee
--  Notes: When used by the Cemetery Cherry and Jidra, it also deals damage, inflicts Poison, and resets hate. When used by Cernunnos, also drains HP equal to the damage inflicted.
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_BIND;
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 1, 0, 30));
    if (hard > 0) then
        local success = MobStatusEffectMove(mob, target, EFFECT_WEIGHT, 50 + hard * 5, 0, 60);
        if (success == 242) then
            target:setPendingMessage(277, EFFECT_WEIGHT);
        end

        local success2 = MobStatusEffectMove(mob, target, EFFECT_SLOW, 150 + hard * 25, 0, 60);
        if (success2 == 242) then
            target:setPendingMessage(277, EFFECT_SLOW);
        end
    end


    return typeEffect;
end;
