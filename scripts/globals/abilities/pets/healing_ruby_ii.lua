---------------------------------------------------
-- Healing Ruby II
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onPetAbility(target, pet, skill)
	local base = 28 + pet:getMainLvl()*4;
    local owner = pet:getMaster();
    local tp = skill:getTP();
    local bonus = owner:getMod(MOD_CHR) + owner:getMod(MOD_SUMMONING);
    base = base + tp + bonus;
   

	if(target:getHP()+base > target:getMaxHP()) then
		base = target:getMaxHP() - target:getHP(); --cap it
	end
	skill:setMsg(MSG_SELF_HEAL);
	target:addHP(base);
	return base;
end