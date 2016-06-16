---------------------------------------------------
-- Grapple
-- Deals physical damage to enemies within a fan-shaped area originating from pet.
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
    local dmgmod = math.random(2,2.5) * (1 + hard / 6);
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,info.hitslanded);
    target:delHP(dmg);

    if (hard > 0) then
        local success = MobPhysicalStatusEfectMove(mob, target, skill, EFFECT_BIND, 1, 0, 10 + hard * 5, MOD_STR);
        if (success == 242) then
            target:setPendingMessage(277, EFFECT_BIND);
        end
    end

    return dmg;
end;
