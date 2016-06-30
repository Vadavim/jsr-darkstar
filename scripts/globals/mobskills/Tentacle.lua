---------------------------------------------------
-- Tentable
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
    local dmgmod = 2.6 + hard / 5;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);
    target:delHP(dmg);

    if (hard > 0 and dmg > 0) then
        local success = MobPhysicalStatusEffectMove(mob, target, EFFECT_POISON, 1 + mob:getMainLvl() / 4, 0, 45 + hard * 15);
        if (success == 242) then
            target:setPendingMessage(278, EFFECT_POISON);
        end
    end

    return dmg;
end;
