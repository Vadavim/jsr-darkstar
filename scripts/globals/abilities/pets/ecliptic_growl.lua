---------------------------------------------------
-- Ecliptic Growl
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onPetAbility(target, pet, skill)
	local moon = VanadielMoonPhase();
    
    local duration = 300;
    local owner = pet:getMaster();
    local durBonus = (owner:getMod(MOD_CHR) / 2 + owner:getMod(MOD_SUMMONING)) * 3;
    if (durBonus > 300) then
        durBonus = 300;
    end
    duration = (duration + durBonus) * (1 + skill:getTP() / 100);
	local buffvalue = 0;
	if moon > 90 then
		buffvalue = 18;
	elseif moon > 75 then
		buffvalue = 15;
	elseif moon > 60 then
		buffvalue = 12;
	elseif moon > 40 then
		buffvalue = 9;
	elseif moon > 25 then
		buffvalue = 6;
	elseif moon > 10 then
		buffvalue = 3;
	else
		buffvalue = 1;
	end
	target:delStatusEffect(EFFECT_STR_BOOST);
	target:delStatusEffect(EFFECT_DEX_BOOST);
	target:delStatusEffect(EFFECT_VIT_BOOST);
	target:delStatusEffect(EFFECT_AGI_BOOST);
	target:delStatusEffect(EFFECT_MND_BOOST);
	target:delStatusEffect(EFFECT_CHR_BOOST);

	target:addStatusEffect(EFFECT_STR_BOOST,buffvalue,0,180);
	target:addStatusEffect(EFFECT_DEX_BOOST,buffvalue,0,180);
	target:addStatusEffect(EFFECT_VIT_BOOST,buffvalue,0,180);
	target:addStatusEffect(EFFECT_AGI_BOOST,18-buffvalue,0,180);
	target:addStatusEffect(EFFECT_INT_BOOST,18-buffvalue,0,180);
	target:addStatusEffect(EFFECT_MND_BOOST,18-buffvalue,0,180);
	target:addStatusEffect(EFFECT_CHR_BOOST,18-buffvalue,0,180);
	skill:setMsg(0);
	return 0;
end