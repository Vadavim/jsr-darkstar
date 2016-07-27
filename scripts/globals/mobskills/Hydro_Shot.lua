---------------------------------------------------
-- Hydro Shot
-- Additional effect: Enmity Down. Chance of effect varies with TP.
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
    local dmgmod = 2.2;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_H2H,info.hitslanded);

    local typeEffect = EFFECT_ENMITY_DOWN;

    mob:resetEnmity(target);

    if (hard > 0 and dmg > 0) then
        local success2 = MobStatusEffectMove(mob, target, EFFECT_DROWN, 1 + mob:getMainLvl() / 3.5, 0, 30 + hard * 15);
        if (success2 == 242) then
            target:setPendingMessage(278, EFFECT_DROWN);
        end
    end

    target:delHP(dmg);
    return dmg;
end;
