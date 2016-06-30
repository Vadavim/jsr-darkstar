---------------------------------------------------
-- Gastric Bomb
-- Deals Water damage with a long-range acid bomb. Additional effect: Attack Down
-- Range: Long range
-- Notes: Attack Down effect is 50%.
-- Duration: Three minutes
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_ATTACK_DOWN;
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local duration = (60 * skill:getTP() / 1000) * (1 + hard / 5);

    local success = MobStatusEffectMove(mob, target, typeEffect, 50, 0, duration);
    if (success == 242) then
        target:setPendingMessage(278, EFFECT_ATTACK_DOWN);
    end

    if (hard > 0) then
        local success = MobStatusEffectMove(mob, target, EFFECT_POISON, (1 + mob:getMainLvl() / 5) * (1 + hard / 8), 3, duration);
        if (success == 242) then
            target:setPendingMessage(277, EFFECT_POISON);
        end
    end

    local dmgmod = 1 + hard / 4;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,ELE_WATER,dmgmod,TP_MAB_BONUS,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WATER,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
