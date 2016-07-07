---------------------------------------------
--  Abyss Blast
--
--  Description: Blasts a single target with dark energy. Additional effect: Blind
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown
--  Notes: Blinds target
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
    local power = 15 + hard * 3;
    local duration = 120 + hard * 30;

    local success = MobStatusEffectMove(mob, target, typeEffect, power, 0, duration);
    if (success == 242) then
        target:setPendingMessage(277, EFFECT_BLINDNESS);
        if (hard > 0) then
            local resist = applyPlayerResistance(mob,EFFECT_BIO,target,mob:getStat(MOD_INT)-target:getStat(MOD_INT),0,ELE_DARK);
            if (resist >= 0.5) then
                target:setPendingMessage(278, EFFECT_BIO);
                target:addStatusEffect(EFFECT_BIO, (1 + mob:getMainLvl() / 5) * (1 + hard / 5), 0, 30 + hard * 15, 0, 10 + hard * 2);
            end
        end
    end


    local dmgmod = 1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*5,ELE_DARK,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
