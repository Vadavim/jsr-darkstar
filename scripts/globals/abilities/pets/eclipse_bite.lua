---------------------------------------------------
-- Eclipse Bite M=8 subsequent hits M=2
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/summon");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
	ability:setRecast(50);
    return 0,0;
end;

function onPetAbility(target, pet, skill, master)
	local numhits = 3; local accmod = 1.25; local strRatio = 2;
	local dmgmod = summoningDamageBonus(master, 50, 0.7, 140);
	local dmgmodsubsequent = summoningDamageBonus(master, 30, 0.55, 80);
    skill:setSkillchain(135); --Blade Ten = Gravitation
    pet:addTP(600 + skill:getTP()); -- Add TP for using physical skill

	local damage = AvatarPhysicalMove(pet,target,skill,numhits,accmod,dmgmod,dmgmodsubsequent,strRatio);
	local totaldamage = AvatarFinalAdjustments(damage.dmg,pet,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,numhits);
	target:delHP(totaldamage);
	target:updateEnmityFromDamage(pet,totaldamage);
	return totaldamage;
end
