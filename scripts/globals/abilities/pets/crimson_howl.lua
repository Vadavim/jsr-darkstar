---------------------------------------------------
-- Crimson Howl
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onPetAbility(target, pet, skill, summoner)
	local duration = 90;
    local durBonus = summoner:getMod(MOD_SUMMONING) + summoner:getMod(MOD_CHR) / 2;
    if (durBonus > 90) then
        durBonus = 90;
    end
    local duration = (duration + durBonus) * (1 + skill:getTP() / 100);
	target:addStatusEffect(EFFECT_WARCRY,9,0,duration);
	skill:setMsg(MSG_BUFF);
	return EFFECT_WARCRY;
end