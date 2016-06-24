---------------------------------------------------
-- String Clipper
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    skill:setSkillchain(23); -- Dancing Edge: Scission / Detonation

    local numhits = 1;
    local accmod = 1;
    local dmgmod = 1;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_BONUS,1.5, 2.5, 3.5);
    local dmg = AutomatonFinalAdjustments(target, mob, skill, info.dmg);
    dmg = MobFinalAdjustments(dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);
    target:delHP(dmg);
    if (mob:isPet()) then
        target:updateEnmityFromDamage(mob,dmg);
    end

    local success = MobPhysicalStatusEffectMove(mob, target, skill, EFFECT_EVASION_DOWN, 40, 0, 30);
    if (success == 242) then
        target:setPendingMessage(277, EFFECT_EVASION_DOWN);
    end

    local success2 = MobPhysicalStatusEffectMove(mob, target, skill, EFFECT_MAGIC_EVASION_DOWN, 40, 0, 30);
    if (success2 == 242) then
        target:setPendingMessage(277, EFFECT_MAGIC_EVASION_DOWN);
    end


    return dmg;
end;
