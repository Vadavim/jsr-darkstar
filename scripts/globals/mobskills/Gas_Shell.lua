---------------------------------------------
--  Gas Shell
--
--  Description: Releases a toxic gas from its shell, poisoning targets in an area of effect.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown radial
--  Notes: Poison is about 24/tic. The Nightmare Uragnite uses an enhanced version that also inflicts Plague.
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
    local typeEffect = EFFECT_POISON;
    local power = 8 + mob:getMainLvl() / 3;
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, power, 0, 60));
    enmityStatusCheck(target, mob, skill, 15 + hard * 5);

    if (hard > 0 and target:hasStatusEffect(EFFECT_POISON)) then
        local success = MobStatusEffectMove(mob, target, EFFECT_PLAGUE, 1 + hard, 0, 30 + hard * 30);
        if (success == 242) then
            target:setPendingMessage(277, EFFECT_PLAGUE);
        end
    end

    return typeEffect;
end;
