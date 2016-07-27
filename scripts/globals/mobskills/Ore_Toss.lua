---------------------------------------------
--  Ore Toss
--
--  Description: Deals high damage in a ranged attack.
--  Type: Ranged
--  Utsusemi/Blink absorb: Yes
--  Range: Unknown range
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
    local dmgmod = math.random(2,5);
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_RANGED,MOBPARAM_BLUNT,MOBPARAM_3_SHADOW);
    target:delHP(dmg);

    if (hard > 0 and dmg > 0) then
        local success2 = MobStatusEffectMove(mob, target, EFFECT_RASP, 1 + mob:getMainLvl() / 3.5, 0, 30 + hard * 15);
        if (success2 == 242) then
            target:setPendingMessage(278, EFFECT_RASP);
        end
    end
    return dmg;
end;
