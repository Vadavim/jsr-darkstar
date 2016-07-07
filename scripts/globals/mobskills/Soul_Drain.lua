---------------------------------------------
--  Soul Drain
--
--  Description: Steals an enemy's HP.
--  Type: Magical
--  Utsusemi/Blink absorb: 1 shadow
--  Range: Melee
--  Notes:
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
    local dmgmod = 1 + hard / 10;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,ELE_DARK,dmgmod,TP_DMG_VARIES);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_1_SHADOW);
    if (hard > 0 and dmg > 0) then
        local tpDrain = target:getTP() * 0.5;
        mob:addTP(tpDrain);
        target:delTP(tpDrain);
    end


    skill:setMsg(MobPhysicalDrainMove(mob, target, skill, MOBDRAIN_HP, dmg));

    return dmg;
end;
