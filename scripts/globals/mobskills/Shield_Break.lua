---------------------------------------------
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    skill:setSkillchain(80);

    local numhits = 1;
    local accmod = 1;
    local dmgmod = 1.25;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_CRIT_VARIES,1.3,1.6,2.0);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);
    mob:addTP(skill:getTP() * 0.5);

    local success = MobStatusEffectMove(mob, target, EFFECT_EVASION_DOWN, 40, 0, 60);
    if (success == 242) then
        target:setPendingMessage(278, EFFECT_EVASION_DOWN);
    end


    target:delHP(dmg);
    return dmg;

end;
