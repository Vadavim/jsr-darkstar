-----------------------------------------
--  ID: 4258
--  Item: Red Drop
-----------------------------------------
--  Strength 5
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
local result = 0;
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_STR_BOOST,5,0,1800);
end;