---------------------------------------------
--  Rhino Guard
--
--  Description: Enhances evasion.
--  Type: Enhancing
--  Utsusemi/Blink absorb: N/A
--  Range: Self
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_EVASION_BOOST;
    hasWeight = mob:getStatusEffect(EFFECT_WEIGHT);
    hasBind = mob:getStatusEffect(EFFECT_BIND);
    if ( ( hasWeight and math.random(100) <= 50) or (hasBind) ) then
        skill:setMsg(MSG_NO_EFFECT);
        mob:addTP(math.floor(skill:getTP() / 2));
        mob:weaknessTrigger(2);
        return typeEffect;
    end
    skill:setMsg(MobBuffMove(mob, typeEffect, 35, 0, 60));
    return typeEffect;
end;
