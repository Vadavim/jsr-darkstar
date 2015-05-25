---------------------------------------------------
-- Whispering Wind
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onPetAbility(target, pet, skill)
    local healing = 30;
	local base = 1 + pet:getMainLvl() / 3 + skill:getTP() / 40;
    local duration = 90;
    local owner = pet:getMaster();
    local durBonus = (owner:getMod(MOD_CHR) / 2 + owner:getMod(MOD_SUMMONING)) * 2;
    if (durBonus > 90) then
        durBonus = 90;
    end
    
    target:addStatusEffect(EFFECT_REGEN,base,3,duration + durBonus);
    skill:setMsg(MSG_BUFF);
	return EFFECT_REGEN;
end