---------------------------------------------
--  Chaotic Eye
--
--  Description: Silences an enemy.
--  Type: Magical (Wind)
--
--
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
---------------------------------------------
function onMobSkillCheck(target,mob,skill)
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_SILENCE;
    
    --check if blind
    hasBlind = mob:getStatusEffect(EFFECT_BLINDNESS);
    hashFlash = mob:getStatusEffect(EFFECT_FLASH);
    if ( (hasBlind and math.random(100) <= 50) or (hasFlash) ) then
        skill:setMsg(MSG_NO_EFFECT);
        mob:weaknessTrigger(2);
        mob:addTP(math.floor(skill:getTP() / 2));
        return MSG_NO_EFFECT;
    end

	skill:setMsg(MobGazeMove(mob, target, typeEffect, 1, 0, 120));

	return typeEffect;
end;
