require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/monstertpmoves");
---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local numhits = 2;
    local accmod = 1;
    local dmgmod = 0.9;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);
    target:delHP(dmg);

    local success = MobPhysicalStatusEffectMove(mob, target, skill, EFFECT_DEFENSE_DOWN, 30, 0, 80);
    if (success == 242) then
        target:setPendingMessage(277, EFFECT_DEFENSE_DOWN);
    end

    return dmg;
end;
