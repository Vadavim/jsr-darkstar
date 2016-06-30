---------------------------------------------------
-- Bubble Shower
-- Deals Water damage in an area of effect. Additional effect: STR Down
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_STR_DOWN;
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    MobStatusEffectMove(mob, target, typeEffect, 10, 3, 120);

    local dmgmod = MobBreathMove(mob, target, 0.15, 5, ELE_WATER, 250);
    if (hard > 0) then
        local success = MobStatusEffectMove(mob, target, EFFECT_DROWN, 1 + mob:getMainLvl() / 5, 0, 15 + hard * 15);
        if (success == 242) then
            target:setPendingMessage(278, EFFECT_DROWN);
        end
    end


    local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_BREATH,MOBPARAM_WATER,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
