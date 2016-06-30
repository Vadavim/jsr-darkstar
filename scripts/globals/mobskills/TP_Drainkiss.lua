---------------------------------------------------
-- Drainkiss
-- Deals dark damage to a single target. Additional effect: TP Drain
-- Type: Magical
-- Utsusemi/Blink absorb: 1 shadow
-- Range: Melee
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/globals/magic");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (target:getTP() < 500) then
        return 1
    end
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);

    local power = 500 * (1 + skill:getTP() / 1000) * (1 + hard / 5);
    local resist = applyPlayerResistance(mob,-1,target, mob:getStat(MOD_INT) - target:getStat(MOD_INT), 0, ELE_DARK);
    local params = {}; params.includemab = true;
    local dmg = resist * addBonusesAbility(player, ELE_DARK, target, power, params);
    skill:setMsg(MobPhysicalDrainMove(mob, target, skill, MOBDRAIN_TP, dmg));

    return dmg;
end;
