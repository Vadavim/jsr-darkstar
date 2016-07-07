---------------------------------------------------
--  Danse Macabre
--  Family: Corse
--  Description: Charms a single target.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: N/A
--  Range: Single target
--  Notes:
---------------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_CHARM_I;
    local hard = mob:getMobMod(MOBMOD_HARD_MODE);
    local power = 0;
    local duration = 30 * fTP(tp, 1, 1.5, 2) * (1 + hard / 5)

    if (not target:isPC()) then
        skill:setMsg(MSG_MISS);
        return typeEffect;
    end;

    if (hard > 0) then
        target:delTP(500 + hard * 200);
    end


    local msg = MobStatusEffectMove(mob, target, typeEffect, power, 3, duration)
    if (msg == MSG_ENFEEB_IS) then
        mob:charm(target);
    end;
    skill:setMsg(msg);

    return typeEffect;
end
