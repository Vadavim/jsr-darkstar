
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (target:isBehind(mob, 48) == false) then
        return 1
    end

    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1;
    local accmod = 1;
    local dmgmod = 2.4;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    local mParams = {}; mParams.bonusmab = 0; mParams.includemab = true;
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,info.hitslanded);
    dmg = addBonusesAbility(mob, ELE_ICE, target, dmg, mParams, 1.0);

    local success = MobPhysicalStatusEffectMove(mob, target, skill, EFFECT_PARALYSIS, 30, 0, 45);
    if (success == 242) then
        target:setPendingMessage(277, EFFECT_PARALYSIS);
    end

    target:delHP(dmg);

    return dmg;
end;
