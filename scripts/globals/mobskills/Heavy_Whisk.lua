---------------------------------------------
--  Heavy Whisk
--
--  Description: Damage varies with TP.
--  Type: Physical (Blunt)
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

    local numhits = 1;
    local accmod = 1;
    local dmgmod = 2.2 + hard / 5;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_H2H,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    if (hard > 0 and dmg > 0) then
        mob:lowerEnmity(target, 15 + hard * 10);
    end
    return dmg;
end;
