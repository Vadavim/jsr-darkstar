-----------------------------------------
-- ID: 16741
-- Item: Poison Dagger +1
-- Additional Effect: Poison
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 30;
    local diff = player:getMod(MOD_CHR) - target:getMod(MOD_CHR);

    if (math.random(0,99) + diff >= chance or applyResistanceAddEffect(player,target,ELE_WATER,diff) <= 0.5) then
        return 0,0,0;
    else
        target:addStatusEffect(EFFECT_POISON, 5, 3, 30);
        return SUBEFFECT_POISON, MSGBASIC_ADD_EFFECT_STATUS, EFFECT_POISON;
    end
end;