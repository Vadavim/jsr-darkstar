---------------------------------------------
--  Fluid Toss
--
--  Description: Lobs a ball of liquid at a single target.
--  Type: Ranged
--  Utsusemi/Blink absorb: 1 shadow
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
    local accmod = 1;
    local dmgmod = 2.9 + hard / 5;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);

    mob:delHP(mob:getHP() * 0.1);

    if (mob:checkDistance(target) > 8) then -- Don't use it if he is on his target.
        mob:addTP(500);
    end;

    if (dmg > 0 and hard > 0) then
        local success = MobPhysicalStatusEffectMove(mob, target, EFFECT_POISON, (1 + mob:getMainLvl() / 5) * (1 + hard / 5), 3, 60);
        if (success == 242) then
            target:setPendingMessage(277, EFFECT_POISON);
        end
    end

    target:delHP(dmg);
    return dmg;
end;
