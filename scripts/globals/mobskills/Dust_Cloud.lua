---------------------------------------------------
-- Dust Cloud
-- Deals Earth damage to targets in a fan-shaped area of effect. Additional effect: Blind
-- Range: 10' cone
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local tp = skill:getTP();
    local duration = 60 * fTP(tp, 1, 1.5, 2) * (1 + hard / 5)
    

    local typeEffect = EFFECT_BLINDNESS;

    local success = MobStatusEffectMove(mob, target, typeEffect, 15 + hard * 3, 0, duration);
    if (success == 242) then
        target:setPendingMessage(277, typeEffect);
    end

    if (hard > 0) then
        local power = (1 + mob:getMainLvl() / 5) * (1 + hard / 5);
        local success2 = MobStatusEffectMove(mob, target, EFFECT_RASP, power, 0, duration);
        if (success2 == 242) then
            target:setPendingMessage(278, EFFECT_RASP);
        end
    end


    local dmgmod = 1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*2,ELE_EARTH,dmgmod,TP_DMG_VARIES,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_EARTH,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
