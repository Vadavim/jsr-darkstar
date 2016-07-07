---------------------------------------------------
-- Smite of Rage
-- Damage varies with TP.
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
    local accmod = 1;
    local dmgmod = 2.7 + hard / 5;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded*math.random(2,3));
    target:delHP(dmg);
    if (hard > 0) then
        local success = MobPhysicalStatusEffectMove(mob, target, skill, EFFECT_AMNESIA, 1, 0, 25 + hard * 10);
        if (success == 242) then
            target:setPendingMessage(278, EFFECT_AMNESIA);
        end
    end

    return dmg;
end;
