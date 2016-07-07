---------------------------------------------
--  Typhoon
--
--  Description: Spins around dealing damage to targets in an area of effect.
--  Type: Physical
--  Utsusemi/Blink absorb: 2-4 shadows
--  Range: 10' radial
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
    local numhits = 4;
    local accmod = 1;
    if (mob:hasStatusEffect(EFFECT_WEIGHT)) then accmod = accmod * 0.8; end
    if (mob:hasStatusEffect(EFFECT_BIND)) then accmod = accmod * 0.5; end
    local dmgmod = 0.5 + hard / 12;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,info.hitslanded);
    target:delHP(dmg);

    if (mob:getName() == "Faust") then
        if (mob:getLocalVar("Typhoon") == 0) then
            mob:useMobAbility(539);
            mob:setLocalVar("Typhoon", 1); 
        else
            mob:setLocalVar("Typhoon", 0); 
        end    
    end    

    return dmg;
end;
