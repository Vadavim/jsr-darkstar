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
    player:delStatusEffectSilent(EFFECT_ICE_SPIKES);
    player:addStatusEffect(EFFECT_ICE_SPIKES, player:getMainLvl() / 2, 0, 30);
end;