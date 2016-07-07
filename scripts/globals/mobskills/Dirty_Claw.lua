---------------------------------------------------
-- Dirty Claw
-- Deals damage to a single target.
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
    if (mob:hasStatusEffect(EFFECT_WEIGHT)) then accmod = accmod * 0.8; end
    if (mob:hasStatusEffect(EFFECT_BIND)) then accmod = accmod * 0.5; end
    local dmgmod = 2.4 + hard / 8;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);

    if (dmg > 0 and hard > 0) then
        local success = MobStatusEffectMove(mob, target, EFFECT_POISON, (1 + mob:getMainLvl() / 3) * (1 + hard / 5), 0, 30 + hard * 15, MOD_VIT);
        if (success == 242) then
            target:setPendingMessage(277, EFFECT_POISON);
        end
    end

    target:delHP(dmg);
    return dmg;
end;
