-----------------------------------------
-- ID: 16509
-- Item: Aspir Knife
-- Additional effect: MP Drain
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    player:delStatusEffectSilent(EFFECT_STR_BOOST);
    player:addStatusEffect(EFFECT_STR_BOOST, player:getMainLvl() / 2, 3, 30);
end;