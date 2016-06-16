-----------------------------------------
-- ID: 4172
-- Item: Reraiser
-- Item Effect: +100% HP
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return 0;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    local duration = 900;
        target:delStatusEffect(EFFECT_ATTACK_BOOST);
        target:addStatusEffect(EFFECT_ATTACK_BOOST,15,0,duration);
end;
