---------------------------------------------
--  Hard Membrane
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
    if (mob:hasStatusEffect(EFFECT_EVASION_BOOST)) then
        return 1;
    end
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_EVASION_BOOST;

    skill:setMsg(MobBuffMove(mob, typeEffect, 25, 0, 60));
    local effect = mob:getStatusEffect(EFFECT_EVASION_BOOST);
    if (effect ~= niil) then
        effect:addMod(MOD_ICEDEF, -60);
        target:addMod(MOD_ICEDEF, -60);
    end

    return typeEffect;
end;
