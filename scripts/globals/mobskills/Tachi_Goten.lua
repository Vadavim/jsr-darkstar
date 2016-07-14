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
    skill:setSkillchain(146);
    local numhits = 1;
    local accmod = 1;
    local dmgmod = 1.0;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_BONUS,2,4,6);
    local params = {};
    local dmg = addBonusesAbility(mob, ELE_THUNDER, target, info.dmg, params);
    dmg = MobFinalAdjustments(dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);

    local success = MobStatusEffectMove(mob, target, EFFECT_SHOCK, 1 + mob:getMainLvl() / 4, 0, 60);
    if (success == 242) then
        target:setPendingMessage(278, EFFECT_SHOCK);
    end


    target:delHP(dmg);
    return dmg;

end;
