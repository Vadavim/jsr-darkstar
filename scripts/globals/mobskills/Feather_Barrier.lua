---------------------------------------------
--  Feather Barrier
--
--  Description: Enhances evasion.
--  Type: Enhancing
--  Utsusemi/Blink absorb: N/A
--  Range: Self
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    if (mob:hasStatusEffect(EFFECT_EVASION_BOOST)) then
        return 1;
    end

    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_EVASION_BOOST;
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    skill:setMsg(MobBuffMove(mob, typeEffect, 20, 0, 120 * (1 + hard / 5)));
    if (hard > 0) then
        mob:addStatusEffect(EFFECT_FOIL, 100, 0, 30);
    end


    return typeEffect;
end;
