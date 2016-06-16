---------------------------------------------
--  Dark Spore
--
--  Description: Unleashes a torrent of black spores in a fan-shaped area of effect, dealing dark damage to targets. Additional effect: Blind
--  Type: Magical Dark (Element)
--
--
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
    local tp = skill:getTP();
    local duration = 90 * fTP(tp, 1, 1.5, 2) * (1 + hard / 5)

    local typeEffect = EFFECT_BLINDNESS;
    local success = MobStatusEffectMove(mob, target, typeEffect, 15 + hard * 5, 3, duration, MOD_VIT);
    if (success == 242) then
        mob:lowerEnmity(target, 5 + hard * 2);
        target:setPendingMessage(277, EFFECT_BLINDNESS);
    end


    local dmgmod = MobBreathMove(mob, target, 0.25, 2, ELE_DARK, 800);

    if (hard > 0) then
        dmgmod = dmgmod * (1 + hard / 4);
    end

    local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_BREATH,MOBPARAM_DARK,MOBPARAM_IGNORE_SHADOWS);

    target:delHP(dmg);
    return dmg;
end;
