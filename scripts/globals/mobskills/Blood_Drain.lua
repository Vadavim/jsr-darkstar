---------------------------------------------------
-- Blood Drain
-- Steals an enemy's HP. Ineffective against undead.
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
    local dmgmod = 1 + hard / 8;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*2,ELE_DARK,dmgmod,TP_MAB_BONUS,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_IGNORE_SHADOWS);

        skill:setMsg(MobPhysicalDrainMove(mob, target, skill, MOBDRAIN_HP, dmg));
    if (hard > 0 and dmg > 0) then
        local tpDrain = target:getTP() * (0.15 + hard / 20);
        target:delTP(tpDrain);
        mob:addTP(tpDrain);
    end


    return dmg;
end;
