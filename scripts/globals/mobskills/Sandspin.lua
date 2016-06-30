---------------------------------------------------
-- Sandspin
-- Deals earth damage to enemies within range. Additional Effect: Accuracy Down.
-- Area of Effect is centered around caster.
-- The Additional Effect: Accuracy Down may not always process.
-- Duration: Three minutes ?
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
    local typeEffect = EFFECT_ACCURACY_DOWN;

    local success = MobStatusEffectMove(mob, target, typeEffect, 25, 0, 120);
    if (success == 242) then
        target:setPendingMessage(278, EFFECT_ACCURACY_DOWN);
    end

    if (hard > 0) then
        local success2 = MobStatusEffectMove(mob, target, EFFECT_RASP, (1 + mob:getMainLvl() / 5) * (1 + hard / 5), 0, 60);
        if (success2 == 242) then
            target:setPendingMessage(278, EFFECT_ACCURACY_DOWN);
        end
    end


    local dmgmod = 1 + hard / 6;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*2.3,ELE_EARTH,dmgmod,TP_MAB_BONUS,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_EARTH,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;

end
