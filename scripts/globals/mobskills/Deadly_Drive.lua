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
    local dmgmod = 2.5 + hard / 5;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);
    target:delHP(dmg);
    return dmg;
end
