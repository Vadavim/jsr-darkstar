---------------------------------------------------
-- Glittering Ruby
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    ability:setRecast(30);
    return 0,0;
end;

function onPetAbility(target, pet, skill, master)
    local chr, summoning, level, tp = master:getMod(MOD_CHR), master:getMod(MOD_SUMMONING), pet:getMainLvl(), skill:getTP() + pet:getMod(MOD_TP_BONUS);

	local effects = {EFFECT_STR_BOOST_II, EFFECT_DEX_BOOST_II, EFFECT_INT_BOOST_II,
        EFFECT_VIT_BOOST_II, EFFECT_AGI_BOOST_II, EFFECT_MND_BOOST_II, EFFECT_CHR_BOOST_II};

    -- choose two effects
    local choice = math.random(1,7);
    local firstEffect = effects[choice];
    effects.remove(choice);
    local secondEffect = effects[math.random(1,6)];

	target:delStatusEffect(firstEffect);
    target:delStatusEffect(secondEffect);

    local power = 12 + tp / 200;
    local duration = 300 + chr * 3 + summoning * 6;
    if (duration > 600) then duration = 600 end;

	target:addStatusEffect(firstEffect,power,0,duration);
    target:setPendingMessage(279, secondEffect);
	skill:setMsg(MSG_BUFF);
	return firstEffect;
end
