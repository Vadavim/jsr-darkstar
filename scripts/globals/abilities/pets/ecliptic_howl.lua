---------------------------------------------------
-- Aerial Armor
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/globals/utils");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
	ability:setRecast(45);
    return 0,0;
end;

function onPetAbility(target, pet, skill, master)
	local chr, summoning, level, tp = master:getMod(MOD_CHR), master:getMod(MOD_SUMMONING), pet:getMainLvl(), skill:getTP() + pet:getMod(MOD_TP_BONUS);
	local duration = utils.clamp(180 + (chr + summoning) * 3, 180, 360) + tp / 10;


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
	target:delStatusEffect(EFFECT_ACCURACY_BOOST);
	target:delStatusEffect(EFFECT_EVASION_BOOST);
	target:addStatusEffect(EFFECT_ACCURACY_BOOST,buffvalue,0,duration);
	target:addStatusEffect(EFFECT_EVASION_BOOST,36-buffvalue,0,duration);
	skill:setMsg(0);
	return 0;
end
