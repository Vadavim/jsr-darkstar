-----------------------------------------
--  ID: 4263
--  Item: Blue Drop
-----------------------------------------
--  Mind 5
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
    target:addStatusEffect(EFFECT_MND_BOOST,5,0,1800);
end;