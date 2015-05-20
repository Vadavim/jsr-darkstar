-----------------------------------------
-- ID: 4127
-- Item: Max-Potion +3
-- Item Effect: Restores 700 HP
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/jsr_item");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return checkPotion(target);
end;
-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    usePotion(target, 1000);
end;