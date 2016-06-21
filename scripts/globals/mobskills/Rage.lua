---------------------------------------------
--  Rage
--
--  Description: The Ram goes berserk
--  Type: Enhancing
--  Utsusemi/Blink absorb: N/A
--  Range: Self
--  Notes: 25% Attack UP, -25% defense DOWN
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    if (mob:hasStatusEffect(EFFECT_BERSERK)) then return 1 end;
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local tp = skill:getTP();
    local duration = 45 * fTP(tp, 1, 1.5, 2) * (1 + hard / 5)
    
    local typeEffect = EFFECT_BERSERK;
    skill:setMsg(MobBuffMove(mob, typeEffect, 1, 0, duration));
    if (hard > 0) then
        mob:addStatusEffect(EFFECT_STORE_TP, 20 + hard * 5, 0, duration);
    end

    return typeEffect;
end;
