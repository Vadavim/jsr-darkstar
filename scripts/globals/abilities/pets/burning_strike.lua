---------------------------------------------------
-- Burning Strike M = 6?
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/summon");
require("/scripts/globals/magic");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onPetAbility(target, pet, skill)
	local numhits = 1;
	local accmod = 1;
	local dmgmod = 6;
    skill:setSkillchain(225); -- Arching Arrow = Fusion

	local totaldamage = 0;
	local damage = AvatarPhysicalMove(pet,target,skill,numhits,accmod,dmgmod,0,TP_NO_EFFECT,1,2,3);
	--get resist multiplier (1x if no resist)
	local resist = applyPlayerResistance(pet,-1,target,pet:getStat(MOD_INT)-target:getStat(MOD_INT),ELEMENTAL_MAGIC_SKILL, ELE_FIRE);
	--get the resisted damage
	damage.dmg = damage.dmg*resist;
	--add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
	damage.dmg = mobAddBonuses(pet,spell,target,damage.dmg,1);
	totaldamage = AvatarFinalAdjustments(damage.dmg,pet,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,numhits);
	target:delHP(totaldamage);
	target:updateEnmityFromDamage(pet,totaldamage);
    
    local DOT = (pet:getMainLvl()/4) + 2;
    target:addStatusEffect(EFFECT_BURN,DOT, 3, 30 + math.floor(skill:getTP() / 5),FLAG_ERASBLE);

	return totaldamage;
end