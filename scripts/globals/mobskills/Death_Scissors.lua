---------------------------------------------
--  Death Scissors
--
--  Description: Damage varies with TP.
--  Type: Physical (Slashing)
--
--
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local numhits = 1;
    local accmod = 0.8;
    local dmgmod = math.random(4,6)+math.random() + hard / 5;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);

    -- keep damage around 700
    if (dmg > 700) then
        dmg = dmg * 0.7;
    end

    if (hard > 0) then
        local success = MobPhysicalStatusEfectMove(mob, target, skill, EFFECT_CURSE_I, 15 + hard * 2, 30 + hard * 15);
        if (success == 242) then
            target:setPendingMessage(277, EFFECT_CURSE);
        end
    end

    target:delHP(dmg);
    return dmg;
end
