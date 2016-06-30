---------------------------------------------
--  Ink Jet
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
    local typeEffect = EFFECT_BLINDNESS;
    local duration = 80 * (skill:getTP() / 1000);

    local success = MobStatusEffectMove(mob, target, typeEffect, 20 + hard * 3, 0, duration);
    if (success == 242) then
        target:setPendingMessage(277, EFFECT_BLINDNESS);
    end

    local dmgmod = 1 + hard / 5;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*2.5,ELE_WATER,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_IGNORE_SHADOWS);

    target:delHP(dmg);
    return dmg;
end;
