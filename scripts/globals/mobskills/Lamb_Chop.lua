---------------------------------------------------
-- Lamb Chop
-- Deals critical damage. Chance of critical hit varies with TP.
-- 100% TP: ??? / 200% TP: ??? / 300% TP: ???
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);

    local numhits = 1;
    local accmod = 1.2;
    local dmgmod = 2 + hard / 6;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_CRIT_VARIES, 1, 1.5, 2);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,info.hitslanded);

    if (hard > 0) then
        mob:lowerEnmity(target, 25 + hard * 2);
    end

    target:delHP(dmg);
    return dmg;
end;
