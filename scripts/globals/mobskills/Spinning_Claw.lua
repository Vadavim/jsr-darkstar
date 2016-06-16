---------------------------------------------
--  Spinning Claw
--
--  Description: Slashes targets in an area of effect.
--  Type: Physical
--  Utsusemi/Blink absorb: 2-3 shadows
--  Range: 15' radial
--  Notes:
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
    if (mob:hasStatusEffect(EFFECT_WEIGHT) and math.random(0, 100) < 25) then return 0 end;
    if (mob:hasStatusEffect(EFFECT_BIND) and math.random(0, 100) < 80) then return 0 end;

    local numhits = 1;
    local accmod = 1;
    local dmgmod = 2.0 + hard / 8;

    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,MOBPARAM_3_SHADOW);

    if (hard > 0) then
        mob:addStatusEffect(EFFECT_FOIL, 50 + hard * 10, 0, 30);
        mob:setPendingMessage(279, EFFECT_FOIL);
    end

    target:delHP(dmg);
    return dmg;
end;
