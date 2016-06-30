---------------------------------------------------
-- Brain Drain
-- Deals damage to a single target. Additional effect: INT Down
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
    local dmgmod = 1 + hard / 5;
    if (target:hasStatusEffect(EFFECT_INT_DOWN)) then dmgmod = dmgmod * 1.5; end;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3.25,ELE_DARK,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_IGNORE_SHADOWS);

    local typeEffect = EFFECT_INT_DOWN;

    local success = MobStatusEffectMove(mob, target, skill, typeEffect, 10, 3, 60 * (skill:getTP() / 1000));
    if (success == 242) then
        target:setPendingMessage(278, typeEffect);
    end

    if (hard > 0 and dmg > 0) then
        local success2 = MobStatusEffectMove(mob, target, EFFECT_MAGIC_DEF_DOWN, 30 + hard * 5, 0, 60);
        if (success2 == 242) then
            target:setPendingMessage(277, typeEffect);
        end
    end


    target:delHP(dmg);

    return dmg;
end;
