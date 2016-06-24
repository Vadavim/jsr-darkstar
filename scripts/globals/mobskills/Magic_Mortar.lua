---------------------------------------------------
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    skill:setSkillchain(122); -- Drakesbane: Fusion / Transfixion

    local dmg = 75 + mob:getMainLvl() * 4.5;
    dmg = dmg * (1 + (skill:getTP() - 1000) / 3000) * (mob:getHPP() / 100);
    local dmg = AutomatonFinalAdjustments(target, mob, skill, dmg);

    target:delHP(dmg);
    if (mob:isPet()) then
        target:updateEnmityFromDamage(mob,dmg);
    end


    return dmg;
end;

