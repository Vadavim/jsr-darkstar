-----------------------------------------
--  ID: 4262
--  Item: Purple Drop
-----------------------------------------
--  Dexterity 5
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
    target:addStatusEffect(EFFECT_DEX_BOOST,5,0,1800);
end;