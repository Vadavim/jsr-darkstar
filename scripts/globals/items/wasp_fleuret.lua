-----------------------------------------
-- Item: Wasp Fleuret
-- Additional Effect: Poison
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 25;
    local diff = player:getMod(MOD_CHR) - target:getMod(MOD_CHR);

    if (math.random(0,99) + diff >= chance or applyResistanceAddEffect(player,target,ELE_WATER,diff) <= 0.5) then
        return 0,0,0;
    else
        if (not target:hasStatusEffect(EFFECT_POISON)) then
            target:addStatusEffect(EFFECT_POISON, 14, 3, 30);
        end
        return SUBEFFECT_POISON, MSGBASIC_ADD_EFFECT_STATUS, EFFECT_POISON;
    end
end;
