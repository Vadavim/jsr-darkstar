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
    skill:setSkillchain(33);
    local numhits = 1;
    local accmod = 1;
    local dmgmod = 1.0;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg(),ELE_FIRE,dmgmod,TP_DMG_BONUS, 2.0, 4.0, 7.0);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);

    local success = MobStatusEffectMove(mob, target, EFFECT_BURN, 1 + mob:getMainLvl() / 4, 0, 60);
    if (success == 242) then
        target:setPendingMessage(278, EFFECT_BURN);
    end


    target:delHP(dmg);
    return dmg;

end;
