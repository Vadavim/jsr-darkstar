---------------------------------------------------
-- Poison Nails  M=3? guess
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/summon");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onPetAbility(target, pet, skill)
	local numhits = 1;
	local accmod = 1;
	local dmgmod = 2.5;
    skill:setSkillchain(49); -- Power Slash = Transfixion

	local totaldamage = 0;
	local damage = AvatarPhysicalMove(pet,target,skill,numhits,accmod,dmgmod,0,TP_NO_EFFECT,1,2,3);

	totaldamage = AvatarFinalAdjustments(damage.dmg,pet,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_PIERCE,numhits);

	target:delHP(totaldamage);
	target:updateEnmityFromDamage(pet,totaldamage);

	if(AvatarPhysicalHit(skill, totalDamage) and target:hasStatusEffect(EFFECT_POISON) == false) then
        local tp = skill:getTP();
        local owner = pet:getMaster();
        local dur_mod = (owner:getMod(MOD_CHR) / 2) + owner:getMod(MOD_SUMMONING);
        local dur_bonus = dur_mod * 2;
        if (dur_bonus) > 60 then
            dur_bonus = 60;
        end
        local power = (1 + owner:getMainLvl() / 5) * (1.0 + tp / 100)
		target:addStatusEffect(EFFECT_POISON,power,3,60 + dur_bonus);
	end

	return totaldamage;
end