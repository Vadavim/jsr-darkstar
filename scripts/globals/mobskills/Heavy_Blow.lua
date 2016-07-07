---------------------------------------------
--  Heavy Blow
--
--  Description: Single target damage
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
    local accmod = 0.8;
    local dmgmod = math.random(1.5, 4) + hard / 8;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_H2H,info.hitslanded);
    if (hard > 0) then
        local success = MobPhysicalStatusEffectMove(mob, target, EFFECT_WEIGHT, 50 + hard * 10, 3, 60);
        if (success == 242) then
            target:setPendingMessage(277, EFFECT_WEIGHT);
        end
        
    end
    target:delHP(dmg);
    return dmg;
end;
