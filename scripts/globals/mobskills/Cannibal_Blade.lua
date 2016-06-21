---------------------------------------------------
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/globals/magic");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    skill:setSkillchain(184); -- Retribution: Gravitation / Reverberation
    local dmg = 50 + mob:getMainLvl() * 3.5;
    dmg = dmg * (1 + (skill:getTP() - 1000) / 3000);
    target:delHP(dmg);
    mob:addHP(dmg);

    return dmg;
end;

