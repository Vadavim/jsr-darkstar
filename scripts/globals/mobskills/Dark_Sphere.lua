---------------------------------------------------
-- Dark Sphere
-- Deals Dark damage to targets in a fan-shaped area of effect. Additional effect: Blind
-- Range: 15' cone
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
    local typeEffect = EFFECT_BLINDNESS;

    local success = MobStatusEffectMove(mob, target, typeEffect, 20 + hard * 4, 0, 120 * (1 + hard / 5));
    if (success == 242) then
        target:setPendingMessage(277, typeEffect);
    end

    if (hard > 0) then
        local resist = applyPlayerResistance(mob,EFFECT_BIO,target,mob:getStat(MOD_INT)-target:getStat(MOD_INT),0,ELE_DARK);
        if (resist >= 0.5) then
            target:setPendingMessage(278, EFFECT_BIO);
            target:addStatusEffect(EFFECT_BIO, (1 + mob:getMainLvl() / 5) * (1 + hard / 5), 0, 30 + hard * 15, 0, 10 + hard * 2);
        end
    end


    local dmgmod = 1 + hard / 10;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*2.5,ELE_DARK,dmgmod,TP_MAB_BONUS,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_1_SHADOW);
    target:delHP(dmg);
    return dmg;
end;
