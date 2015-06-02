---------------------------------------------------
-- Moonlit Charge M=4
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
	local dmgmod = 4;
    skill:setSkillchain(84); -- Keen Edge = Compression

	local totaldamage = 0;
	local damage = AvatarPhysicalMove(pet,target,skill,numhits,accmod,dmgmod,0,TP_NO_EFFECT,1,2,3);
	totaldamage = AvatarFinalAdjustments(damage.dmg,pet,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,numhits);
    
    local owner = pet:getMaster();
    local durBonus = (owner:getMod(MOD_CHR) / 2 + owner:getMod(MOD_SUMMONING));
    if (durBonus > 60) then
        durBonus = 60;
    end
    local tp = skill:getTP();
    
	target:addStatusEffect(EFFECT_BLINDNESS, 20 + math.floor(tp / 10), 0, 60 + durBonus);
    --target:addStatusEffect(EFFECT_CHAINBOUND, 1, 0, 10);
	target:delHP(totaldamage);
	target:updateEnmityFromDamage(pet,totaldamage);

	return totaldamage;
end