---------------------------------------------
-- Autumn Breeze
--
-- Description: Recovers HP. 
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/jsr_utils");
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local power = (mob:getMainLvl() * (mob:getMainLvl() / 20) * 8) * (1 + skill:getTP() / 3000);
    power = reduced_healing_factor(target) * power;

    skill:setMsg(MSG_SELF_HEAL);
    return power;

end;
