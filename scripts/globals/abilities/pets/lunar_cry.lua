---------------------------------------------------
-- Aerial Armor
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onPetAbility(target, pet, skill)
	local moon = VanadielMoonPhase();
	local buffvalue = 0;
	if moon > 90 then
		buffvalue = 36;
	elseif moon > 75 then
		buffvalue = 30;
	elseif moon > 60 then
		buffvalue = 24;
	elseif moon > 40 then
		buffvalue = 18;
	elseif moon > 25 then
		buffvalue = 12;
	elseif moon > 10 then
		buffvalue = 6;
	else
		buffvalue = 1;
	end
	target:delStatusEffect(EFFECT_ACCURACY_DOWN);
	target:delStatusEffect(EFFECT_EVASION_DOWN);
    target:delStatusEffect(EFFECT_MAGIC_ACC_DOWN);
    target:delStatusEffect(EFFECT_MAGIC_EVASION_DOWN);
	target:addStatusEffect(EFFECT_ACCURACY_DOWN,buffvalue,0,180);
    target:addStatusEffect(EFFECT_MAGIC_ACC_DOWN,buffvalue,0,180);
	target:addStatusEffect(EFFECT_EVASION_DOWN,36-buffvalue,0,180);
    target:addStatusEffect(EFFECT_MAGIC_EVASION_DOWN,36-buffvalue,0,180);
	skill:setMsg(0);
	return 0;
end