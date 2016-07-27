-----------------------------------------
--  ID: 4259
--  Item: Clear Drop
-----------------------------------------
--  Intelligence 5
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
    target:addStatusEffect(EFFECT_INT_BOOST,5,0,1800);
end;