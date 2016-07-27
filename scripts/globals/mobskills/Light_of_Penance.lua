---------------------------------------------
--  Light of Penance
--
--  Description: Reduces an enemy's TP. Additional effect: Blindness and "Bind".
--  Type: Magical (Light)
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);

    if (hard > 0) then
        skill:setActivationTime(750);
    else
        skill:setActivationTime(1500);
    end
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local tpReduced = 0;
    target:setTP(tpReduced);

    local success = MobGazeMove(mob, target, EFFECT_BLINDNESS, 20, 0, 120);
    if (success == 242) then
        target:setPendingMessage(277, EFFECT_BLINDNESS);
    end
    


    local success2 = MobGazeMove(mob, target, EFFECT_BIND, 1, 0, 30);
    if (success2 == 242) then
        target:setPendingMessage(277, EFFECT_BIND);
    end
    


    skill:setMsg(MSG_TP_REDUCED);

    return tpReduced;
end;
