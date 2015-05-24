---------------------------------------------------
-- Shining Ruby
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onPetAbility(target, pet, skill)

    local tp = skill:getTP();   
    local owner = pet:getMaster();
    local durMod = (owner:getMod(MOD_CHR) / 2) + owner:getMod(MOD_SUMMONING);
    local durBonus = durMod * 3;
    if (durBonus) > 180 then
            durBonus = 180;
        end
        
    durBonus = durBonus + tp * 2;


	target:delStatusEffect(EFFECT_SHINING_RUBY);
	target:addStatusEffect(EFFECT_SHINING_RUBY,1,0,180 + durBonus);
	skill:setMsg(MSG_BUFF);
	return EFFECT_SHINING_RUBY;
end