---------------------------------------------
--  Claw Cyclone
--
--  Description: Damages enemies within area of effect with a twofold attack. Damage varies with TP.
--  Type: Physical (Slashing)
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
    local tp = skill:getTP();

    local numhits = 2;
    local accmod = 1;
    local dmgmod = 1.1 + hard / 6;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);

    if (hard > 0) then
        mob:addStatusEffect(EFFECT_FOIL, 50 + hard * 10, 0, 30);
        mob:setPendingMessage(280, EFFECT_FOIL);
    end

    target:delHP(dmg);
    return dmg;
end;
