---------------------------------------------------
-- Splash Breath
-- Deals Water damage in a fan-shaped cone area of effect.
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
    local dmgmod = MobBreathMove(mob, target, 0.1, 0.75, ELE_WATER, 400);
    dmgmod = dmgmod * (1 + hard / 6);
    local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_BREATH,MOBPARAM_WATER,MOBPARAM_WIPE_SHADOWS);

    if (hard > 0) then
        local success = MobStatusEffectMove(mob, target, EFFECT_DROWN, 1 + mob:getMainLvl() / 5, 0, 15 + hard * 15);
        if (success == 242) then
            target:setPendingMessage(278, EFFECT_DROWN);
        end
    end


    target:delHP(dmg);
    return dmg;
end;
