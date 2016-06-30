---------------------------------------------------
-- MP Drainkiss
-- Deals dark damage to a single target. Additional effect: Aspir
-- Type: Magical
-- Utsusemi/Blink absorb: 1 shadow
-- Range: Melee
-- Notes: If used against undead, it will simply do damage and not drain MP.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (target:getMP() == 0) then
        return 1;
    end

    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);

    local dmgmod = 1 + hard / 5;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*1.6,ELE_DARK,dmgmod,TP_MAB_BONUS,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_1_SHADOW);

    if (dmg > target:getMP()) then dmg = target:getMP(); end
    skill:setMsg(MobPhysicalDrainMove(mob, target, skill, MOBDRAIN_MP, dmg));
    if (dmg > 0 and hard > 0) then
        mob:addHP(dmg * (3 + hard));
    end


    return dmg;
end;
