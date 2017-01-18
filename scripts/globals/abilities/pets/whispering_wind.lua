---------------------------------------------------
-- Whispering Wind
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onPetAbility(target, pet, skill)
	local base = (5 + pet:getMainLvl() / 3 ) * (1 + skill:getTP() / 1500);
    local duration = 60;
    local owner = pet:getMaster();
    local durBonus = (owner:getMod(MOD_CHR) / 2 + owner:getMod(MOD_SUMMONING)) / 2
    if (durBonus > 30) then
        durBonus = 30;
    end

    target:addStatusEffect(EFFECT_REGEN,base,3,duration + durBonus);
    skill:setMsg(MSG_BUFF);
	return EFFECT_REGEN;
end
