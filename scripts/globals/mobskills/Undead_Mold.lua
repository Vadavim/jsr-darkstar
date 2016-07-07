---------------------------------------------
--  Undead Mold
--
--  Description: Releases undead spores that diseases targets in front.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Front arc
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
    local typeEffect = EFFECT_DISEASE;
    if (hard > 0) then
        typeEffect = EFFECT_PLAGUE;
    end
    local duration = 120 * fTP(skill:getTP(), 1, 1.5, 2) * (1 + hard / 5)

    local success = MobStatusEffectMove(mob, target, typeEffect, 2 + hard, 0, duration);
    if (success == 242) then
        target:setPendingMessage(277, typeEffect);
    end

    local dmgmod = 1 + hard / 10;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*1.5,ELE_DARK,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
