---------------------------------------------
--  Methane Breath
--
--  Description: Deals fire damage to enemies within a fan-shaped area originating from the caster.
--  Type: Magical (Fire)
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
    local dmgmod = MobBreathMove(mob, target, 0.2, 1.875, ELE_FIRE, 400);
    if (hard > 0) then
        local success = MobStatusEffectMove(mob, target, EFFECT_BURN, (1 + mob:getMainLvl() / 5) * (1 + hard / 5), 0, 30 + hard * 15, MOD_VIT);
        if (success == 242) then
            target:setPendingMessage(278, EFFECT_BURN);
        end
    end


    local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_BREATH,MOBPARAM_FIRE,MOBPARAM_IGNORE_SHADOWS);

    target:delHP(dmg);
    return dmg;
end;
