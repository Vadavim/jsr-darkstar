---------------------------------------------
--  Heat Breath
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
    if (mob:hasStatusEffect(EFFECT_SILENCE) and math.random(0, 100) < 50) then return 0 end;
    if (mob:hasStatusEffect(EFFECT_DROWN) and math.random(0, 100) < 15) then return 0 end;
    if (mob:hasStatusEffect(EFFECT_CHOKE) and math.random(0, 100) < 15) then return 0 end;

    local dmgmod = MobBreathMove(mob, target, 0.5, 1, ELE_FIRE, 500);
    dmgmod = dmgmod * hard / 5;

    if (hard > 0) then
        local power = (1 + mob:getMainLvl() / 5) * (1 + hard / 5);
        local success = MobStatusEffectMove(mob, target, EFFECT_BURN, power, 0, 60, MOD_VIT);
        if (success == 242) then
            target:setPendingMessage(277, EFFECT_BURN);
        end
    end


    local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_BREATH,MOBPARAM_FIRE,MOBPARAM_IGNORE_SHADOWS);

    target:delHP(dmg);
    return dmg;
end;
