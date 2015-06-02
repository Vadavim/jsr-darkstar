---------------------------------------------------
-- Glittering Ruby
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onPetAbility(target, pet, skill)
	--randomly give str/dex/vit/agi/int/mnd/chr (+12)
	local effect = math.random();
	local effectid = EFFECT_STR_BOOST;
	if(effect<=0.14)then --STR
		effectid = EFFECT_STR_BOOST;
	elseif(effect<=0.28)then --DEX
		effectid = EFFECT_DEX_BOOST;
	elseif(effect<=0.42)then --VIT
		effectid = EFFECT_VIT_BOOST;
	elseif(effect<=0.56)then --AGI
		effectid = EFFECT_AGI_BOOST;
	elseif(effect<=0.7)then --INT
		effectid = EFFECT_INT_BOOST;
	elseif(effect<=0.84)then --MND
		effectid = EFFECT_MND_BOOST;
	else --CHR
		effectid = EFFECT_CHR_BOOST;
	end

	target:delStatusEffect(effectid);
    
    local tp = skill:getTP();
    local power = 12 * (1 + tp / 100 );
    local owner = pet:getMaster();
    
    local dur_mod = (owner:getMod(MOD_CHR) / 2) + owner:getMod(MOD_SUMMONING);
    local dur_bonus = dur_mod * 3;
    if (dur_bonus) > 150 then
            dur_bonus = 150;
        end
    
	target:addStatusEffect(effectid,power,0,300 + dur_bonus);
	skill:setMsg(MSG_BUFF);
	return effectid;
end