---------------------------------------------
--  Fluid Spread
--
--  Description: Splashes around liquid in an area of effect.
--  Type: Physical
--  Utsusemi/Blink absorb: 2-3 shadows
--  Range: 10' radial
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
    local numhits = math.random(2,3);
    local accmod = 1;
    local dmgmod = .6 + hard / 10;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);

    if (dmg > 0 and hard > 0) then
        local success = MobPhysicalStatusEffectMove(mob, target, EFFECT_POISON, (1 + mob:getMainLvl() / 8) * (1 + hard / 5), 3, 60);
        if (success == 242) then
            target:setPendingMessage(277, EFFECT_POISON);
        end
    end


    target:delHP(dmg);
    return dmg;
end;
