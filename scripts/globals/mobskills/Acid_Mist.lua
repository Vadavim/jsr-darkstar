---------------------------------------------------
-- Acid Mist
-- Deals Water damage to enemies within an area of effect. Additional effect: Attack Down
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
    local typeEffect = EFFECT_ATTACK_DOWN;
    local power = 50;
    local duration = 40 * (skill:getTP() / 1000) * (1 + hard / 5);

    local success = MobStatusEffectMove(mob, target, typeEffect, power, 0, duration);
    if (success == 242) then
        target:setPendingMessage(278, typeEffect);
    end

    if (hard > 0) then
        local effect = target:getStatusEffect(EFFECT_ATTACK_DOWN);
        if (effect ~= nil) then
            target:addMod(MOD_DEFP, -25 - hard * 5);
            effect:addMod(MOD_DEFP, -25 - hard * 5);
        end
    end


    local dmgmod = 1 + hard / 8;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg() * 2.2,ELE_WATER,dmgmod,TP_MAB_BONUS,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WATER,MOBPARAM_WIPE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
