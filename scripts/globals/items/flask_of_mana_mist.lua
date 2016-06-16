-----------------------------------------
-- ID: 4116
-- Item: Hi-Potion
-- Item Effect: Restores 100 HP
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/jsr_item");

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
    target:addMP(target:getMainLvl() * 5);
end;