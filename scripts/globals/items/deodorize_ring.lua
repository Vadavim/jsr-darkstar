-----------------------------------------
--    ID: 11320
--    Skeleton Robe
--    Enchantment: 60Min, Costume - Skeleton
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
    target:delStatusEffect(EFFECT_DEODORIZE);
    target:addStatusEffect(EFFECT_DEODORIZE,0,10,300);
end;