---------------------------------------------
--  Sand Veil
--
--  Description: Enhances evasion.
--  Type: Enhancing
--  Utsusemi/Blink absorb: N/A
--  Range: Self
--  Notes: Very sharp evasion increase.
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    if (mob:hasStatusEffect(EFFECT_DEFENSE_BOOST) or mob:hasStatusEffect(EFFECT_EVASION_BOOST)) then
        return 1;
    end
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local duration = 30 * fTP(skill:getTP(), 1, 1.5, 2) * (1 + hard / 5)

    local typeEffect = EFFECT_EVASION_BOOST;
    skill:setMsg(MobBuffMove(mob, typeEffect, 40, 0, duration));
    if (hard > 0) then
        mob:addStatusEffect(EFFECT_FOIL, 100, 0, 30);
        mob:setPendingMessage(280, EFFECT_FOIL);
    end
    return typeEffect;
end;
