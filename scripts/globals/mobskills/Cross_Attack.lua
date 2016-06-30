---------------------------------------------------
-- Cross Attack
-- Single target attack, 2-hits.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    -- Needs Knockback added
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local numhits = 2;
    local accmod = 1;
    local dmgmod = 1.5 + hard / 5;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_H2H,info.hitslanded);

    if (hard > 0 and dmg > 0) then
        local success = MobPhysicalStatusEffectMove(mob, target, EFFECT_POISON, 1 + mob:getMainLvl() / 4, 0, 45 + hard * 15);
        if (success == 242) then
            target:setPendingMessage(278, EFFECT_POISON);
        end
    end
    target:delHP(dmg);
    return dmg;
end;
